class TasksController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :direct_user, :only => [:show, :index]
  def registration
    
  end
  
  def intake
    @resident = Resident.new :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :first_name => params[:first_name], :last_name => params[:last_name], :primary_phone_number => params[:primary_phone_number]
    if @resident.save
      ResidentRegistrationMailer.registration_receipt(@resident).deliver
      sign_in @resident
      @city = City.find params[:city_id]
      @street = @city.streets.find_or_create_by_name params[:street_name]
      @address = @street.addresses.find_or_create_by_street_number :street_number => params[:street_number], :zip_code => params[:zip_code]
      @unit = @address.units.find_or_create_by_name params[:unit_name]
      @unit.resident = @resident
      @unit.save
      params[:languages].each do |language_id|
        @resident.proficiencies.create :language_id => language_id
      end
      session[:unit_id] = @unit.id
      session[:address_id] = @address.id
    else
      render :action => 'registration'
    end
  end
  
  def legal_intake
    @address = Address.find session[:address_id]
    @address.update_attributes params[:address]
    session[:address_id] = nil
    @unit = Unit.find session[:unit_id]
    @unit.needs_met = params[:needs_met] == 'yes' ? true : false
    @unit.power_on = params[:power] == 'yes' ? true : false
    @unit.heater_needed = params[:heater] == 'yes' ? true : false
    @unit.save
  end
    
  def finish_intake
    @unit = Unit.find session[:unit_id]
    session[:unit_id] = nil
    @unit.update_attributes params[:unit]
    redirect_to @unit
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to :action => :index, notice: 'Task created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  private
  def direct_user
    return true if current_person || current_team_admin
  end
end
