class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.includes(:team).all
  end

  def show
    # just to know there's show action
  end

  def new
    @task = Task.new
  end

  def edit
    # just to know there's edit action
  end

  def create
    @task = Task.create(task_params)

    respond_with @task
  end

  def update
    @task.update_attributes(task_params)

    respond_with @task
  end

  def destroy
    @task.destroy

    respond_with @task
  end

  protected

  def task_params
    params.require(:task).permit(:name, :description, :team_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
