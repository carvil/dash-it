class ProjectsController < ApplicationController

  respond_to :html, :json

  def index
    @projects = Project.all
    respond_with @projects
  end

  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    respond_with @project
  end

  def new
    @project = Project.new
  end

  # POST /projects.json
  def create
    @project = Project.new(params[:project])

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
    @project = Project.find(params[:id])

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
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end
