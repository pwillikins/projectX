class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['FACEBOOK_KEY']
  end
end