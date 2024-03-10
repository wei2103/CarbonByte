class ActivityController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    #
    if @activity.save
      redirect_to @activity
    else
      render 'new'
    end
  end

  def calculate_carbon_emission(activity_type_id, value)
    ClimatiqEstimationService.calculate_carbon_emission(activity_type_id, value)
  end

  private
  def activity_params
    params.require(:activity).permit(:activity_type_id, :value, :user_id)
  end
end
