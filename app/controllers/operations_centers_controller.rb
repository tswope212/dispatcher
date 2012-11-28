class OperationsCentersController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:edit, :update, :destroy]
  before_filter :authenticate_person, :only => [:show, :index]
  # GET /operations_centers
  # GET /operations_centers.json
  def index
    @operations_centers = OperationsCenter.alphabetical

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations_centers }
    end
  end

  # GET /operations_centers/1
  # GET /operations_centers/1.json
  def show
    @operations_center = OperationsCenter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operations_center }
    end
  end

  # GET /operations_centers/new
  # GET /operations_centers/new.json
  def new
    @operations_center = OperationsCenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operations_center }
    end
  end

  # GET /operations_centers/1/edit
  def edit
    @operations_center = OperationsCenter.find(params[:id])
  end

  # POST /operations_centers
  # POST /operations_centers.json
  def create
    @operations_center = OperationsCenter.new(params[:operations_center])

    respond_to do |format|
      if @operations_center.save
        format.html { redirect_to @operations_center, notice: 'Operations center was successfully created.' }
        format.json { render json: @operations_center, status: :created, location: @operations_center }
      else
        format.html { render action: "new" }
        format.json { render json: @operations_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /operations_centers/1
  # PUT /operations_centers/1.json
  def update
    @operations_center = OperationsCenter.find(params[:id])

    respond_to do |format|
      if @operations_center.update_attributes(params[:operations_center])
        format.html { redirect_to @operations_center, notice: 'Operations center was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @operations_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations_centers/1
  # DELETE /operations_centers/1.json
  def destroy
    @operations_center = OperationsCenter.find(params[:id])
    @operations_center.destroy

    respond_to do |format|
      format.html { redirect_to operations_centers_url }
      format.json { head :no_content }
    end
  end
end
