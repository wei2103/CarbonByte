class DashboardController < ApplicationController
  def index
    @activities = Activity.all
  end
end
