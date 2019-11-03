class TasksController < ApplicationController
  
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_name: params[:task_name],content: params[:content],user_id: current_user.id)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_index_url
    else
      render :new
    end
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
    if @task.save
      flash[:success] = "タスクを更新しました。"
      redirect_to user_tasks_index_url
    else
      render :edit
    end
    
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_index_url
  end
end
