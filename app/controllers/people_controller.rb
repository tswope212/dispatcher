class PeopleController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:index, :show, :destroy, :email_export]
  before_filter :authenticate_person!, :only => [:home, :edit, :update]

  def home
    
  end

  # GET /people
  # GET /people.json
  def index
    @people = if params[:sort] == 'first_name'
      Person.order('first_name ' + params[:first_name_direction])
    elsif params[:sort] == 'last_name'
      Person.order('last_name ' + params[:last_name_direction])
    elsif params[:sort] == 'email'
      Person.order('email ' + params[:email_direction])
    elsif params[:sort] == 'phone'
      Person.order('primary_phone_number ' + params[:phone_direction])
    elsif params[:sort] == 'updated'
      Person.order('updated_at ' + params[:updated_direction])
    else
      Person
    end.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end
  
  def email_export
    @people = Person.all
    
    render :text => @people.map(&:email).compact.join(', ')
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { 
          if current_person.andand.has_not_signed_waivers?
            redirect_to waivers_path, :notice => 'You are now signed up as a volunteer!  Before proceeding, please sign your volunteer waivers.'
          else
            redirect_to @person
          end
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
end
