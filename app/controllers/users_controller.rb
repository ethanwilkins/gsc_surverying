class UsersController < ApplicationController
  before_action :security, only: [:new, :create]
  
  def admin
    @posts = Post.where.not(tag: nil).reverse
    redirect_to root_url unless admin?
  end
  
  def edit
    @posts = Post.find params[:id]
  end
  
  def show
    @user = User.find params[:id]
  end
  
  def new
    unless current_user
      @user = User.new
    end
  end
  
  def create
    @user = User.new(user_params)
    # first user created is admin by default
    @user.admin = true if User.all.size.zero?
    if @user.save
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      cookies.permanent[:logged_in_before] = true
      redirect_to root_url
    else
      redirect_to :back
    end
  end
  
  def update
  end
  
  private
  
  def security
    if User.all.size > 3
      redirect_to '/404'
    end
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
