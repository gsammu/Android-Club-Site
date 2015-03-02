class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo_lists = TodoList.includes(:todo_items).all.order(deadline: :asc)
    @completed_task = CompletedTask.new
  end
end
