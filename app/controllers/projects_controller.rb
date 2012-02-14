class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = project.all

    respond_to do |format|
      format.html { render }
      format.json { render json: @projects }
    end
  end

  # GET /projects/1.json
  def show
    @project = project.find(params[:id])

    respond_to do |format|
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
  end

  # POST /projects.json
  def create
    @project = project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.json { render json: @project, status: :created, location: @project }
      else
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1.json
  def update
    @project = project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.json { render json: nil, status: :ok }
      else
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1.json
  def destroy
    @project = project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end
