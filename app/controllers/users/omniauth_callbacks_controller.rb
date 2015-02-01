class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  respond_to :json

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)


    # We will pre-register the approved members to our system
    if @user.andand.persisted?
      sign_in :user, @user, :event => :authentication
      @user.remember_me!

      p @message = {
        user_signed_in: user_signed_in?,
        current_user: current_user || nil,
        user_session: user_session || nil
      }
      render json: @user, status: :ok
    else
    # These guys logged in are not approved to be club member, sorry.
      render json: {error: 'not_member'}, status: :forbidden
    end

  end

end