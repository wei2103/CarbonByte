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

end
