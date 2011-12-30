class TasksController < ApplicationController
 def index
  #@tasks = Task.where(:done=>false).order("due_date DESC")
  @tasks = Task.undone.paginate(:page => params[:page], :per_page => 10)
 end

 def show
  @task = Task.find(params[:id])
 end

 def new
  @task = Task.new
 end

 def create
  @task = Task.create(params[:task])
  redirect_to @task
 end

 def edit
  @task = Task.find(params[:id])
 end

 def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to :tasks
 end

 def update
  @task = Task.find(params[:id])
  @task.update_attributes(params[:task])
  redirect_to @task
 end

 def finish
  @task = Task.find(params[:id])
  @task.update_attribute(:done, true)
  redirect_to :back
 end
 
 def done
  # @tasks = Task.where(:done=>true).order("due_date")
   @tasks = Task.done.paginate(:page => params[:page], :per_page => 10)
   render :index
 end
 
 def restart
  @task = Task.find(params[:id])
  @task.update_attribute(:done, false)
  redirect_to :back
 end

 def search
  @tasks = Task.undone
  @tasks = @tasks.search(params[:query]) if params[:query].present?
  @tasks = @tasks.paginate(:page => params[:page], :per_page => 10)
  render :index
 end
end
