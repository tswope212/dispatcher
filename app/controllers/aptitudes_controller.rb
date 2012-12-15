class AptitudesController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:index, :destroy]
  before_filter :authenticate_person!, :only => [:show, :edit, :update]
  # GET /aptitudes
  # GET /aptitudes.json
  def index
    @aptitudes = if params[:sort] == 'skill'
      Aptitude.by_skill
    else
      Aptitude.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aptitudes }
    end
  end

  # GET /aptitudes/1
  # GET /aptitudes/1.json
  def show
    @aptitude = Aptitude.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aptitude }
    end
  end

  # GET /aptitudes/new
  # GET /aptitudes/new.json
  def new
    @aptitude = Aptitude.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aptitude }
    end
  end

  # GET /aptitudes/1/edit
  def edit
    @aptitude = Aptitude.find(params[:id])
  end

  # POST /aptitudes
  # POST /aptitudes.json
  def create
    @aptitude = Aptitude.new(params[:aptitude])

    respond_to do |format|
      if @aptitude.save
        format.html { redirect_to skills_path, notice: 'Aptitude was successfully created.' }
        format.json { render json: @aptitude, status: :created, location: @aptitude }
      else
        format.html { render action: "new" }
        format.json { render json: @aptitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aptitudes/1
  # PUT /aptitudes/1.json
  def update
    @aptitude = Aptitude.find(params[:id])

    respond_to do |format|
      if @aptitude.update_attributes(params[:aptitude])
        format.html { redirect_to @aptitude, notice: 'Aptitude was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aptitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aptitudes/1
  # DELETE /aptitudes/1.json
  def destroy
    @aptitude = Aptitude.find(params[:id])
    @aptitude.destroy

    respond_to do |format|
      format.html { redirect_to aptitudes_url }
      format.json { head :no_content }
    end
  end
end
