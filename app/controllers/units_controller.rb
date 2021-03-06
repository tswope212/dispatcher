class UnitsController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:index, :edit, :update, :destroy]
  before_filter :check_authorization, :only => :show

  def search
    @units = Unit.search(params[:query]).page(params[:page])
    render :action => :index
  end
  
  # GET /units
  # GET /units.json
  def index
    @units = if params[:order] == 'updated'
      Unit.order('updated_at ' + params[:updated_direction])
    elsif params[:order] == 'created'
      Unit.order('created_at ' + params[:created_direction])
    elsif params[:order] == 'note_updated'
      Unit.order('note_updated_at ' + params[:note_updated_direction])
    elsif params[:order] == 'first_name'
      Unit.joins(:resident).order('residents.first_name ' + params[:first_name_direction])
    elsif params[:order] == 'last_name'
      Unit.joins(:resident).order('residents.last_name ' + params[:last_name_direction])
    elsif params[:order] == 'name'
      Unit.order('name ' + params[:name_direction])
    elsif params[:order] == 'address'
      Kaminari.paginate_array(Address.joins(:street, :units).order("streets.name #{params[:address_direction]}").order("addresses.street_number #{params[:address_direction]}").map(&:units).flatten)
    else
      Unit.order('created_at desc')
    end.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @units }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @unit = Unit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit }
    end
  end

  # GET /units/new
  # GET /units/new.json
  def new
    @unit = Unit.new :address_id => params[:address_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit }
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])
  end
  
  def phase
    @unit = Unit.find params[:id]
  end

  def apply
    @unit = Unit.find params[:unit_id]
    @phase_template = PhaseTemplate.find params[:phase_template_id]
    @phase_template.steps.each do |step|
      @unit.jobs.create :task_id => step.task_id
    end
    redirect_to @unit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(params[:unit])
    if session[:resident_id]
      @unit.resident_id = session[:resident_id]
      session[:resident_id] = nil
    end

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render json: @unit, status: :created, location: @unit }
      else
        format.html { render action: "new" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.json
  def update
    @unit = Unit.find(params[:id])
    
    if params[:unit].andand[:note].present? && (@unit.note.blank? || (@unit.note != params[:unit][:note]))
      @unit.note_updated_by = current_person
      @unit.note_updated_at = Time.now
    end

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url }
      format.json { head :no_content }
    end
  end
  
  def upload
    csv = params[:csv][:data]
    data = csv.read
    # CSV.parse(data, :headers => :first_row) do |unit|
    #   if unit['Address'] =~ /(\d+)\s+([\w\s]+)/
    #     street_number = $1
    #     street_name = $2
    #   else
    #     street_number = unit['Address']
    #   end
    #   neighborhood = Neighborhood.find_or_create_by_name(unit['Neighborhood']) if unit['Neighborhood'].present?
    #   street = Street.find_or_create_by_name street_name
    #   address = Address.find_or_create_by_street_number street_number, :street => street, :neighborhood => neighborhood
    #   unit['Contact Name'] =~ /([\w\s]+)\s+([\w\-]+)/
    #   first_name = $1
    #   last_name = $2
    #   resident = Resident.create :first_name => first_name, :last_name => last_name, :email => "#{first_name.andand.gsub(/\s/, '')}-#{last_name}-#{SecureRandom.urlsafe_base64(4)}@disasterdispatcher.net", :password => 'password', :password_confirmation => 'password', :primary_phone_number => unit['Phone']
    #   unit = Unit.create :address => address, :name => unit['Name'], :resident => resident, :power_on => (unit['Power On?'] == 'Yes'), :legal_needs => unit['Legal Assistance'], :heater_needed => (unit['Is a Heater Needed?'] == 'Yes'), :medical_needs => unit['Healthcare Needs'], :insurance_situation => unit['FEMA Visited House? What color tag? Insurance?'], :note => "Category:#{unit['Category']}\nSpoke to Resident:#{unit['Spoke to Resident']}\nSupplies:#{unit['Supplies']}\nLabor:#{unit['Labor?']}\nPartnering with F2F:#{unit['Partnering with F2F']}\nComments:#{unit['Comments']}\nDate:#{unit['Date']}\nTime:#{unit['Time']}\nScheduling:#{unit['Scheduling']}\nHousing Assistance:#{unit['Housing Assistance']}\nCrew Leader:#{unit['Crew Leader']}"
    # end
    

    CSV.parse(data, :headers => :first_row) do |survey|
      if survey['Street'] =~ /(\d+)\s+([\w\s]+)/
        street_number = $1
        street_name = $2
      end
      street = Street.find_or_create_by_name street_name
      address = Address.find_or_create_by_street_number street_number, :street => street
      resident = Resident.create :first_name => survey['First Name'], :last_name => survey['Last Name'], :email => survey['Email'], :password => 'password', :password_confirmation => 'password', :primary_phone_number => survey['Phone']
      Unit.create :address => address, :name => 'Main Unit', :resident => resident, :power_on => (survey['Do you have electricity?'] == 'YES'), :legal_needs => survey['Does anyone need to speak with a lawyer? '], :heater_needed => (survey['Do you have heat?'] == 'NO'), :medical_needs => survey['Does anyone in your household need medical attention? '], :insurance_situation => survey['Name of insurers:']
    end
    redirect_to :action => :index
  end
  
  private
  def check_authorization
    @unit = Unit.find params[:id]
    return true if @unit.resident == current_resident
    return true if current_team_admin
  end
end
