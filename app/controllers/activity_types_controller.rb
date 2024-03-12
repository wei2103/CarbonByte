class ActivityTypesController < ApplicationController
  def show
    activity_type = ActivityType.find(params[:id])
    render json: activity_type
  end
end
