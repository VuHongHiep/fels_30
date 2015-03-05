class FollowingController < ApplicationController
  before_action :logged_in_user

  def show
    @title = "Following"
    @user  = User.find params[:format]
    @users = @user.followers.paginate page: params[:page], per_page: 10
    render 'show'
  end

  private
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
