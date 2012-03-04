class TodosController < ApplicationController
  respond_to :html, :json

  def index
    @todos = Todo.where(project_id: params[:project_id])
    respond_with @todos
  end
end
