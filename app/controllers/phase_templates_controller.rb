class PhaseTemplatesController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :authenticate_person!, :only => [:show, :index]
  # GET /phase_templates
  # GET /phase_templates.json
  def index
    @phase_templates = PhaseTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phase_templates }
    end
  end

  # GET /phase_templates/1
  # GET /phase_templates/1.json
  def show
    @phase_template = PhaseTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phase_template }
    end
  end

  # GET /phase_templates/new
  # GET /phase_templates/new.json
  def new
    @phase_template = PhaseTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phase_template }
    end
  end

  # GET /phase_templates/1/edit
  def edit
    @phase_template = PhaseTemplate.find(params[:id])
  end

  # POST /phase_templates
  # POST /phase_templates.json
  def create
    @phase_template = PhaseTemplate.new(params[:phase_template])

    respond_to do |format|
      if @phase_template.save
        format.html { redirect_to @phase_template, notice: 'Phase template was successfully created.' }
        format.json { render json: @phase_template, status: :created, location: @phase_template }
      else
        format.html { render action: "new" }
        format.json { render json: @phase_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phase_templates/1
  # PUT /phase_templates/1.json
  def update
    @phase_template = PhaseTemplate.find(params[:id])

    respond_to do |format|
      if @phase_template.update_attributes(params[:phase_template])
        format.html { redirect_to @phase_template, notice: 'Phase template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phase_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phase_templates/1
  # DELETE /phase_templates/1.json
  def destroy
    @phase_template = PhaseTemplate.find(params[:id])
    @phase_template.destroy

    respond_to do |format|
      format.html { redirect_to phase_templates_url }
      format.json { head :no_content }
    end
  end
end
