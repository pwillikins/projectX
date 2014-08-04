class ResetPasswordsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      token = SecureRandom.uuid
      @user.update(password_reset_token: token, password_reset_sent_at: Time.now)
      UserMailer.password_reset(@user).deliver
    end

    redirect_to root_path, notice: 'An email has been sent with instructions on how to reset your password'
  end

  def edit
    @user = User.find_by(password_reset_token: params[:token])
  end

  def update
    @user = User.find_by(password_reset_token: params[:token])
    if @user.password_reset_sent_at > 15.minutes.ago
      @user.update(password: params[:user][:password])
      redirect_to '/', notice: "Password Updated"
    else
      redirect_to root_path, notice: "Token has expired. Click Forgot password? for another email. Please note, the reset password length is only active for 15 minutes."
    end
  end
end
