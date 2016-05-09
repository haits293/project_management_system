class UsersController < ApplicationController
  before_action :logged_in
  before_action :correct_user, except: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.status = "active"
      redirect_to @user
      flash[:success] = "Added Successfully"
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "Profile updated"
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).update_attribute(:status, "deleted")
    redirect_to users_url
    flash[:success] = "User deleted"
  end

  private
    def user_params
      params.require(:admin).permit(:name, :email, :password,
        :password_confirmation, :gender, :class, :institue)
    end
end
