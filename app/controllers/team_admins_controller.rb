class TeamAdminsController < ApplicationController
  before_filter :authenticate_taylor!, :only => [:activate, :deactivate]
  before_filter :authenticate_team_admin!
  # GET /team_admins
  # GET /team_admins.json
  def index
    @team_admins = TeamAdmin.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team_admins }
    end
  end

  # GET /team_admins/1
  # GET /team_admins/1.json
  def show
    @team_admin = TeamAdmin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team_admin }
    end
  end

  # GET /team_admins/new
  # GET /team_admins/new.json
  def new
    @team_admin = TeamAdmin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team_admin }
    end
  end

  # GET /team_admins/1/edit
  def edit
    @team_admin = TeamAdmin.find(params[:id])
  end

  # POST /team_admins
  # POST /team_admins.json
  def create
    @team_admin = TeamAdmin.new(params[:team_admin])

    respond_to do |format|
      if @team_admin.save
        format.html { redirect_to @team_admin, notice: 'Team admin was successfully created.' }
        format.json { render json: @team_admin, status: :created, location: @team_admin }
      else
        format.html { render action: "new" }
        format.json { render json: @team_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /team_admins/1
  # PUT /team_admins/1.json
  def update
    @team_admin = TeamAdmin.find(params[:id])

    respond_to do |format|
      if @team_admin.update_attributes(params[:team_admin])
        format.html { redirect_to @team_admin, notice: 'Team admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate
    @team_admin = TeamAdmin.find params[:id]
    @team_admin.update_attribute :active, true
    
    @team_admin.send :generate_reset_password_token!
    TeamAdminMailer.activation_message(@team_admin).deliver
    
    redirect_to :action => :index
  end
  
  def deactivate
    @team_admin = TeamAdmin.find params[:id]
    @team_admin.update_attribute :active, false
    redirect_to :action => :index
  end

  # DELETE /team_admins/1
  # DELETE /team_admins/1.json
  def destroy
    @team_admin = TeamAdmin.find(params[:id])
    @team_admin.destroy

    respond_to do |format|
      format.html { redirect_to team_admins_url }
      format.json { head :no_content }
    end
  end
  
  private
  def authenticate_taylor!
    current_team_admin == TeamAdmin.taylor
  end
end
