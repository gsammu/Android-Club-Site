class SessionsController < Devise::SessionsController

  def destroy
    sign_out :user
    head :ok
  end

end
