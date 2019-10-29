class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    # @task = current_user.tasks.build(params.require(:task).permit(:content))
    @task = Task.new(task_name: params[:task_name],content: params[:content],user_id: current_user.id)
    @task.save
    redirect_to tasks_index_url
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

  end
  
  def edit
  end

  def destroy
    redirect_to tasks_url
  end
end
