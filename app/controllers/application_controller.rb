class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # protect_from_forgery
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs



  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

end
