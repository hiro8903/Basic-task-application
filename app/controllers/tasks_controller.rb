class TasksController < ApplicationController
  
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_name: params[:task_name],content: params[:content],user_id: current_user.id)
    @task.save
    redirect_to user_tasks_index_url
  end

  def index
    @tasks = Task.where(user_id: current_user.id)
    
  end

  def show
    
    @task = Task.find(params[:id])
    @user = @task.user

  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.content = params[:content]
    @task.task_name = params[:task_name]
    @task.save
    redirect_to user_tasks_index_url
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_index_url
  end
end
