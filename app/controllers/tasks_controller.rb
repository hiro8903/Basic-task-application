class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    redirect_to tasks_url
  end
  
  def destroy
    redirect_to tasks_url
  end
end
