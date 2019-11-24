class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_devise_params, if: :devise_controller?

  Warden::Manager.after_authentication do |user, auth, opts|
    user.update(is_online: true)
    StatusUpdaterJob.perform_now(user)
  end

  Warden::Manager.before_logout do |user, auth, opts|
    user.update(is_online: false)
    StatusUpdaterJob.perform_now(user)
  end

  protected
  
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :name, :email, :password, :password_confirmation])
  end
end
