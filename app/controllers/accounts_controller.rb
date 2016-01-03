class AccountsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @accounts = Account.all
    authorize User
  end

  def show
    @account = Account.find(params[:id])
    authorize @user
  end
  
  def new
    @account = Account.new
    authorize @account
  end

  def update
    @account = Account.find(params[:id])
    authorize @user
    if @account.update_attributes(acct_params)
      redirect_to accounts_path, :notice => "Account has been updated."
    else
      redirect_to accounts_path, :alert => "Unable to update account."
    end
  end
  
  def create
    @account = Account.new(acct_params)
    if @account.save
        redirect_to account_url, notice: "Account has been created!" 
    else
        render :new
    end
  end

  def destroy
    account = Account.find(params[:id])
    authorize user
    account.destroy
    redirect_to accounts_path, :notice => "Account has been deleted."
  end

  private

  def acct_params
    params.require(:account).permit(:status, :status_date)
  end
end
