class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @activities = Activity.all
    @carbon_emissions_by_activity_type = Activity.group("activity_types.name").joins(:activity_type).sum(:carbon_emission)
    @carbon_emissions_by_category = Activity.group("activity_types.category").joins(:activity_type).sum(:carbon_emission)
  end
end
