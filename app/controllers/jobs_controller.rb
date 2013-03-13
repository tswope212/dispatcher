class JobsController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:new, :destroy]
  before_filter :authenticate_person_or_coordinator!, :only => [:show, :edit, :update, :index, :start, :finish]
  # GET /jobs
  # GET /jobs.json
  def index
    params[:completion_scope] ||= 'all'
    @jobs = if params[:address_id]
      if params[:order] == 'impending'
        Address.find(params[:address_id]).jobs.impending
      elsif params[:order] == 'undispatched'
        Address.find(params[:address_id]).jobs.undispatched
      else
        scope_for_completion Address.find(params[:address_id]).jobs
      end
    elsif params[:unit_id]
      scope_for_completion Unit.find(params[:unit_id]).jobs
    elsif current_coordinator
      scope_for_completion current_coordinator.jobs
    elsif params[:sort] == 'complete'
      Job.by_completion
    elsif params[:sort] == 'task'
      scope_for_completion Job.by_task
    elsif params[:sort] == 'unit'
      Kaminari.paginate_array(Address.joins(:street, :units).order("streets.name #{params[:address_direction]}").order("addresses.street_number #{params[:address_direction]}").map(&:units).flatten.map(&:jobs).flatten)
    elsif params[:sort] == 'city'
      scope_for_completion Job.by_city
    elsif params[:sort] == 'team'
      Kaminari.paginate_array(Team.alphabetical.map(&:jobs).flatten)
    else
      scope_for_completion Job
    end.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job.unit, notice: "We have received your request for #{@job.task.name}." }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html do
          if params[:job].length == 1
            redirect_to unit_jobs_path(@job.unit)
          else
            redirect_to @job, notice: 'Job was successfully updated.'
          end
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def start
    @job = Job.find params[:id]
    @job.update_attribute :actual_start, Time.now
    redirect_to @job
  end
  
  def finish
    @job = Job.find params[:id]
    @job.update_attribute :actual_end, Time.now
    redirect_to @job
  end
  
  def export
    @jobs = Job.dispatched
    filename = Rails.root + "tmp/jobs_#{Time.now.strftime("%m-%d-%H-%M")}.csv"
    CSV.open(filename, 'wb') do |csv|
      csv << ['Address', 'Type of Work', 'Volunteer', 'Organization', 'Hours', 'Cost']
      @jobs.each do |job|
        job.teams.each do |team|
          team.people.each do |person|
            csv << [job.address.name, job.task.name, person.name, 'SI Unity', 1, 10]
          end
        end
      end
    end
    send_file filename
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end
  
  protected
  
  def scope_for_completion collection
    if params[:completion_scope].present?
      collection.send params[:completion_scope]
    else
      collection
    end
  end
end
