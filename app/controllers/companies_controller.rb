class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  
  def index
    @companies = Company.all
    authorize Company
  end
 
  def show
    @users = @company.users(params[:company_id])
    authorize @company
  end
 
  def new
    @company = Company.new
    authorize @company
  end
 
  def edit
    authorize @company
  end
 
  def create
    @company = Company.new(company_params)
    authorize @company
    if @company.save
      flash[:notice] = 'Company was successfully created.'
      redirect_to @company
    else
      render 'new'
    end
  end
 
  def update
    if @company.update_attributes(company_params)
      authorize @company
      flash[:notice] = "Company was successfully updated."
      redirect_to @company
    else
      render 'edit'
    end
  end
 
  def destroy
    authorize @company
    @company.destroy
    flash[:notice] = "Company was successfully deleted"
    redirect_to companies_path
  end
 
  private
    def set_company
      @company = Company.find(params[:id])
    end
    
    def company_params
      params.require(:company).permit(:company_name)
    end
    
end