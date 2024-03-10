class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new

    @activity.type_id = activity_params[:activity_type_id]
    @activity.user_id = current_user.id
    @activity.value = activity_params[:value].to_i

    @activity.carbon_emission = ClimatiqEstimationService.calculate_carbon_emission(activity_params[:activity_type_id], activity_params[:value].to_i).to_i

    if @activity.save
      redirect_to user_path(current_user.id), notice: 'Activity was successfully created.'
    else
      # render current user path
      redirect_to user_path(current_user.id), notice: 'Activity was not created.'
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:activity_type_id, :value)
  end
end
