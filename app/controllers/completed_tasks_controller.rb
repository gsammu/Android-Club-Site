class CompletedTasksController < ApplicationController
  before_action :authenticate_user!
  def new
  	@ct = CompletedTask.new
  end
  def create
  	if(params[:is_checked].to_s == "true")
  		current_user.completed_tasks.build(todo_item_id: params[:completed_task]["todo_item_id"])
  	else
  		current_user.completed_tasks.where(todo_item_id: params[:completed_task]["todo_item_id"]).destroy_all
  	end
      if current_user.save
      	respond_to do |format| 
        format.html { redirect_to root_url, notice: "Save process completed!" }
        format.json { render json: nil, status: :ok }
    	end
      else
      	respond_to do |format| 
          format.json { 
            flash.now[:notice]="Save proccess coudn't be completed!" 
            redirect_to dashboard_url
          }
    	end
      end
  end
  def person_params
      params.require(:completed_task).permit(:id, :todo_item_id, :is_checked)
    end
end
