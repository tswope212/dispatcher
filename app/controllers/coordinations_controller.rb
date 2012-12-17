class CoordinationsController < ApplicationController
  before_filter :authenticate_team_admin!, :only => [:new, :create, :edit, :update, :destroy]
  # GET /coordinations
  # GET /coordinations.json
  def index
    @coordinations = Coordination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coordinations }
    end
  end

  # GET /coordinations/1
  # GET /coordinations/1.json
  def show
    @coordination = Coordination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coordination }
    end
  end

  # GET /coordinations/new
  # GET /coordinations/new.json
  def new
    @coordination = Coordination.new :coordinator_id => params[:coordinator_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coordination }
    end
  end

  # GET /coordinations/1/edit
  def edit
    @coordination = Coordination.find(params[:id])
  end

  # POST /coordinations
  # POST /coordinations.json
  def create
    @coordination = Coordination.new(params[:coordination])
    @coordination.team_admin = current_team_admin

    respond_to do |format|
      if @coordination.save
        format.html { redirect_to @coordination, notice: 'Coordination was successfully created.' }
        format.json { render json: @coordination, status: :created, location: @coordination }
      else
        format.html { render action: "new" }
        format.json { render json: @coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coordinations/1
  # PUT /coordinations/1.json
  def update
    @coordination = Coordination.find(params[:id])

    respond_to do |format|
      if @coordination.update_attributes(params[:coordination])
        format.html { redirect_to @coordination, notice: 'Coordination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinations/1
  # DELETE /coordinations/1.json
  def destroy
    @coordination = Coordination.find(params[:id])
    @coordination.destroy

    respond_to do |format|
      format.html { redirect_to coordinations_url }
      format.json { head :no_content }
    end
  end
end
