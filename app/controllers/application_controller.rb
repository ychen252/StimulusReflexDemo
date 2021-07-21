class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:group, :email, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:group, :email, :password, :current_password)}
    end


end
