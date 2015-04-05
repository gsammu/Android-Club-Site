class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  respond_to :html, :json

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    # We will pre-register the approved members to our system
    if @user.andand.persisted?
      p "User persisted"
      sign_in :user, @user, :event => :authentication
      @user.remember_me!

      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.json { render json: @user, status: :ok }
      end
    else
      p "User NOT persisted"
    # These guys logged in are not approved to be club member, sorry.
      respond_to do |format|
        format.html { redirect_to root_path, alert: "not_member" }
        format.json { render json: {error: 'not_member'}, status: :forbidden }
      end
    end

  end

end
