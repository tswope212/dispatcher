class DispatchesController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :authenticate_person!, :only => [:show, :index]
  # GET /dispatches
  # GET /dispatches.json
  def index
    @dispatches = Dispatch.recent

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dispatches }
    end
  end

  # GET /dispatches/1
  # GET /dispatches/1.json
  def show
    @dispatch = Dispatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dispatch }
    end
  end

  # GET /dispatches/new
  # GET /dispatches/new.json
  def new
    @dispatch = Dispatch.new :job_id => params[:job_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dispatch }
    end
  end

  # GET /dispatches/1/edit
  def edit
    @dispatch = Dispatch.find(params[:id])
  end

  # POST /dispatches
  # POST /dispatches.json
  def create
    @dispatch = Dispatch.new(params[:dispatch])
    @dispatch.person = current_person

    respond_to do |format|
      if @dispatch.save
        format.html { redirect_to jobs_path, notice: "#{@dispatch.team.name} dispatched." }
        format.json { render json: @dispatch, status: :created, location: @dispatch }
      else
        format.html { render action: "new" }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dispatches/1
  # PUT /dispatches/1.json
  def update
    @dispatch = Dispatch.find(params[:id])

    respond_to do |format|
      if @dispatch.update_attributes(params[:dispatch])
        format.html { redirect_to @dispatch, notice: 'Dispatch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatches/1
  # DELETE /dispatches/1.json
  def destroy
    @dispatch = Dispatch.find(params[:id])
    @dispatch.destroy

    respond_to do |format|
      format.html { redirect_to dispatches_url }
      format.json { head :no_content }
    end
  end
end
