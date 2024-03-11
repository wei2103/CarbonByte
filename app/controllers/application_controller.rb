class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :redirect_to_welcome_if_preferences_blank


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # def after_sign_up_path_for(resource)
  #   # Customize the path to where you want to redirect the user after signing up
  #   # For example, redirecting to the user's profile page:
  #   new_preference_path(resource)
  # end


  private

  # before action check if user.preferences are blank. If yes, redirect to preferences. Except for Preference's controller's actions.
  def redirect_to_welcome_if_preferences_blank
    if current_user && current_user.preferences.blank? && request.path != preferences_path
      redirect_to preferences_path
    end
  end
end
