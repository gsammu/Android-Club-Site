class CompletedTasksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    if (params[:is_checked].to_s == "true")
      current_user.completed_tasks.build(completed_task_params)
    else
      current_user.completed_tasks.where(completed_task_params).destroy_all
    end
    if current_user.save
      respond_to do |format|
        format.html do
          redirect_to root_url, notice: "Save process completed!"
        end
        format.json do
          render json: nil, status: :ok
        end
      end
    else
      respond_to do |format|
        format.html do
          redirect_to dashboard_url, notice: "Save failed"
        end
        format.json do
          render json: { success: false } 
        end
      end
    end
  end

  def completed_task_params
    params.require(:completed_task).permit(:id, :todo_item_id, :is_checked)
  end
end
