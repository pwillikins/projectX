class UserController < ApplicationController

  def new

  end

  def create
    @user = User.new
    @user.band_name = params[:band_name]
    @user.tour_info = params[:tour_info]
    @user.save
    redirect_to "/user/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
  end

  def show_all
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.band_name = params[:band_name]
    @user.tour_info = params[:tour_info]
    @user.save
    redirect_to "/user/#{@user.id}"
  end
end