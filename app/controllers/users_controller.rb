class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  #after_action :send_welcome_email, only: [:create]

  def index
    @users = User.all
    authorize User
  end

  def show
    authorize @user
  end
  
  def new
    @user = User.new
    authorize @user
  end
  
  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
        redirect_to @user, notice: "User successfully created" 
    else
        render 'new'
    end
  end

  def edit
    authorize @user
  end
  
  def update
    authorize @user
    if params[:user][:password].blank?
       params[:user].delete(:password)
       params[:user].delete(:password_confirmation)
    end
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: "User updated"
    else
      render 'edit'
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, notice: "User deleted"
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:role, :username, :name, :email, :password, :password_confirmation, :current_password, :company_id)
    end

end
