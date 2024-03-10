class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @activities = Activity.all
  end
end
