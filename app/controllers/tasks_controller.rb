class TasksController < ApplicationController

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "Successfully created"
		else
			render action: "new"
		end
	end


	private

	def task_params
		params[:task].permit(:title, :project_id, :is_completed, :due_date)
	end


end
