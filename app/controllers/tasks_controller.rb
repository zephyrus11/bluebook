class TasksController < ApplicationController

	def index
		@task = Task.all
		
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
		authorize! :edit, @task
		
	end

	def update
		@task = Task.find(params[:id])
		@task.assign_attributes(task_params)
		authorize! :update, @task
		save_task
	end

	def destroy
		@task = Task.find(params[:id])
		authorize! :destroy, @task
		@task.destroy
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
		params.require(:task).permit(:task, :detail, :due_date, :completed)
	end
end
