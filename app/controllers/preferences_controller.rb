class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @user.preferences.build unless @user.preferences.present?
  end

  def create
    @user = current_user
    if @user.update(preferences_params)
      redirect_to root_path, notice: 'Preferences updated successfully.'
    else
      render :new
    end
  end

  private

  def preferences_params
    params.require(:user).permit(preference_ids: [])
  end
end
