class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  
  def new
    @user = User.new
    authorize @user
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to @user, notice: "User succesfully created!" 
    else
        redirect_to users_path, :alert => "Unable to add new user."
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

    def user_params
      params.require(:user).permit(:role, :username, :name, :email, :password, :password_confirmation, :current_password)
    end

end
