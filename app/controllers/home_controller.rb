class HomeController < ApplicationController
  before_filter :soft_authenticate_user

  def home
  	@current_user = current_user

    @message = {
      user_signed_in: user_signed_in?,
      # current_user: current_user,
      user_session: user_session
    }
  end
end
