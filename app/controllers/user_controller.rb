class UserController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @activities = Activity.where(user_id: current_user.id)
    activity_types = ActivityType.all

    # Map the activity types, put those that are already in the user's preferences in higher order and with a ⭐ in the name, and those that are not in the user's preferences in lower order
    sorted_activity_types = activity_types.sort_by { |activity_type| current_user.preferences.include?(activity_type) ? 0 : 1 }

    @activity_types = sorted_activity_types.map { |activity_type| [current_user.preferences.include?(activity_type) ? "⭐ #{activity_type.name} (#{activity_type.climatiq_unit_type}/#{activity_type.climatiq_unit_of_measurement})" : "#{activity_type.name} (#{activity_type.climatiq_unit_type}/#{activity_type.climatiq_unit_of_measurement})", activity_type.id] }

    @activity = Activity.new # Initialize a new activity
  end
end
