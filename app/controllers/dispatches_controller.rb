class DispatchesController < ApplicationController
  before_filter :authenticate_team_admin_or_coordinator!, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :authenticate_person!, :only => [:show, :index]

  def introduction
    
  end

  # GET /dispatches
  # GET /dispatches.json
  def index
    sort_order = params[:direction] == 'reverse' ? ' desc' : ' asc'
    @dispatches = case params[:order]
    when 'updated'
      Dispatch.order('updated at' + sort_order)
    when 'dispatcher'
      Dispatch.joins(:person).order('people.last_name' + sort_order)
    when 'team'
      Dispatch.joins(:team).order('teams.name' + sort_order)
    when 'job'
      Dispatch.joins(:task).order('tasks.name' + sort_order)
    when 'date'
      Dispatch.order('created_at' + sort_order)
    else
      Dispatch.recent
    end.page(params[:page])
    
    @dispatches = @dispatches.send(params[:filter]) if params[:filter].present?
    
    @dispatches = Kaminari.paginate_array(Dispatch.recent.sort_by { |d| d.job.andand.completion_state.to_s }).page(params[:page]) if params[:order] == 'complete'

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
