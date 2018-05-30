class TasksController < ApplicationController

	def index
		@task = Task.all
		if params[:search]
		  @task = Task.search(params[:search]).order("created_at DESC")
		else
		  @task = Task.all.order("created_at DESC")
		end
				
	end

	def new
		@task = Task.new
		@user = User.find_by(id: session[:user_id])
		
	end

	def create
		
		@task = Task.new(task_params)
		@task.user_id = current_user.id
		save_task
		redirect_to '/'
	end

	def edit
		@task = Task.find(params[:id])
		
		
	end

	def update
		@task = Task.find(params[:id])
		
		@task.update(task_params)
        redirect_to tasks_url, notice: 'Task was successfully updated.'
		save_task
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		# respond_to do |format|
  #     	format.js { render "destroy", :locals => {:task => @task}}
     	redirect_to tasks_url, notice: 'Task was successfully destroyed.' 
		
		@tasks = Task.all
	end

	private

	def save_task
		if @task.save
			@tasks = Task.all
		
		else
		
		end
	end

	def task_params
		params.require(:task).permit(:task, :detail, :due_date, :completed, :images)
	end
end
