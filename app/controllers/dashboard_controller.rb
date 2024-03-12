class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.all

    @carbon_emissions_by_activity_type = Activity.where(user_id: current_user.id).group("activity_types.name").joins(:activity_type).sum(:carbon_emission)

    @carbon_emissions_by_category = Activity.where(user_id: current_user.id).group("activity_types.category").joins(:activity_type).sum(:carbon_emission)
  end
end
