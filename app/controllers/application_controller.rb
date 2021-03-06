class ApplicationController < ActionController::Base
  include Pundit
  
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :name, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :name, :email, :password, :password_confirmation, :current_password)}
    end

  private

    def user_not_authorized
      redirect_to error_redirect_path, alert: "You are not authorized to perform this action."
    end
end
