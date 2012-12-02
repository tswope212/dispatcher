class TaskWaiversController < ApplicationController
  before_filter :authenticate_team_admin!
  # GET /task_waivers
  # GET /task_waivers.json
  def index
    @task_waivers = if params[:sort] == 'task'
      TaskWaiver.by_task
    elsif params[:sort] == 'waiver'
      TaskWaiver.by_waiver
    else
      TaskWaiver.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_waivers }
    end
  end

  # GET /task_waivers/1
  # GET /task_waivers/1.json
  def show
    @task_waiver = TaskWaiver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_waiver }
    end
  end

  # GET /task_waivers/new
  # GET /task_waivers/new.json
  def new
    @task_waiver = TaskWaiver.new :task_id => params[:task_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_waiver }
    end
  end

  # GET /task_waivers/1/edit
  def edit
    @task_waiver = TaskWaiver.find(params[:id])
  end

  # POST /task_waivers
  # POST /task_waivers.json
  def create
    @task_waiver = TaskWaiver.new(params[:task_waiver])
    @task_waiver.team_admin = current_team_admin

    respond_to do |format|
      if @task_waiver.save
        format.html { redirect_to @task_waiver, notice: 'Task waiver was successfully created.' }
        format.json { render json: @task_waiver, status: :created, location: @task_waiver }
      else
        format.html { render action: "new" }
        format.json { render json: @task_waiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_waivers/1
  # PUT /task_waivers/1.json
  def update
    @task_waiver = TaskWaiver.find(params[:id])

    respond_to do |format|
      if @task_waiver.update_attributes(params[:task_waiver])
        format.html { redirect_to @task_waiver, notice: 'Task waiver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_waiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_waivers/1
  # DELETE /task_waivers/1.json
  def destroy
    @task_waiver = TaskWaiver.find(params[:id])
    @task_waiver.destroy

    respond_to do |format|
      format.html { redirect_to task_waivers_url }
      format.json { head :no_content }
    end
  end
end
