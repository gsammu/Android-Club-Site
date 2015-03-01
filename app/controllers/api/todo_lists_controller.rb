class API::TodoListsController < ApplicationController

  def index
    @todo_lists = TodoList.all
    render json: @todo_lists
  end

end