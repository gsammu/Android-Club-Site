class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private
  
  def soft_authenticate_user
    if user_signed_in?
      authenticate_user!
    end
  end

end
