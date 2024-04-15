class GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  
  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:notice] = 'Goal was successfully created.'
    else
      render :new
    end
  end

  def update
    if @goal.update(goal_params)
      flash[:notice] = 'Goal updated successfully.'
      redirect_to @goal
    else
      flash.now[:alert] = 'Error updating goal.'
      render :edit
    end
  end


  private

  def goal_params
    params.require(:goal).permit(:target_completion_date, :carbon_emission)
  end


end
