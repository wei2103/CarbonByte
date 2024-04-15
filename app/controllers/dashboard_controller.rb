class DashboardController < ApplicationController
  before_action :authenticate_user!
  require 'csv'
  def index
    @chat_bot = ChatBotService.new
    csv_content = @carbon_emissions_by_activity_type
    puts csv_content
    @prompt = " analyse and provide concise insight, meaningful data on carbon emissions from different activities and categories. this data includes the total carbon emissions (in CO2e units) Here's a summary of the data: \n\n #{csv_content} \n\n Could you analyze this data and provide insights on the following aspects:1. Which activity types or categories contribute the most to carbon emissions?2. Are there any notable trends or patterns in the data?3. Can you identify any correlations between different activity types or categories?4. Based on the data, what actionable steps can be taken to reduce carbon emissions in each category?5. Any other insights or observations you can provide based on the data analysis would be greatly appreciated.\n\n with the above information, could you provide a detailed analysis and insights on the data with 350 words? make sure your input are line by line and seperate to paragraphs"
    @response = @chat_bot.start_chat(@prompt)
    @activities = Activity.all
    @errorsForGoal = []
    @errorsForTimeRange = []
    @active_page = 'home'

    start_date = params[:start_date].present? ? params[:start_date].to_date : 7.days.ago.to_date
    end_date = params[:end_date].present? ? params[:end_date].to_date : Time.current.to_date

    # Check if the form is submitted and the goal already exists
    if params[:target_completion_date].present? && params[:sum_carbon].present?
      existing_goal = Goal.find_by(user_id: current_user.id, target_completion_date: params[:target_completion_date])
      if existing_goal
        existing_goal.update(carbon_emission: params[:sum_carbon])
        flash[:notice] = 'Goal updated successfully.'
      else
        new_goal = Goal.create(
          user_id: current_user.id,
          target_completion_date: params[:target_completion_date],
          carbon_emission: params[:sum_carbon]
        )
        if new_goal.save
          flash[:notice] = 'Goal created successfully.'
        else
          flash[:notice] = 'Error creating goal.'
        end
      end
    elsif params[:target_completion_date].present? && params[:sum_carbon].blank?
      @errorsForGoal = ['*Cannot add a new Goal as Sum of Carbon Emission is required']
    elsif params[:target_completion_date].blank? && params[:sum_carbon].present?
      @errorsForGoal = ['*Cannot add a new Goal as Target Completion Date is required']
    elsif params[:target_completion_date].blank? && params[:sum_carbon].blank?
      @errorsForGoal = ['*Target Completion Date and Sum of Carbon Emission are required']
    end

    if params[:start_date].present? && params[:end_date].blank?
      @errorsForTimeRange = ['*Cannot show the historical data as End Date is required']
    elsif params[:start_date].blank? && params[:end_date].present?
      @errorsForTimeRange = ['*Cannot show the historical data as Start Date is required']
    elsif params[:start_date].blank? && params[:end_date].blank?
      @errorsForTimeRange = ['*Start Date and End Date are required']
    end

    # Check for completed goals
    @all_goals = Goal.where(user_id: current_user.id)
    @completed_goals = []

    @all_goals.each do |goal|
      activities_for_goal = Activity.where("DATE(created_at) = ?", goal.target_completion_date)

      if activities_for_goal.present? # Check if there are any activities for the goal's target completion date
        total_carbon_emission_for_goal = activities_for_goal.sum(:carbon_emission)

        if total_carbon_emission_for_goal <= goal.carbon_emission
          flash[:notice] = 'Congratulations! You have completed a goal.'
          @completed_goals << { goal: goal, completion_date: goal.target_completion_date }
        end
      end
    end

    if @completed_goals.any?
      flash[:notice] = 'Congratulations! You have completed a goal.'
    end

    @completed_goals.each do |completed_goal|
      activities_for_goal = Activity.where("DATE(created_at) = ?", completed_goal[:completion_date])
      total_carbon_emission_for_goal = activities_for_goal.sum(:carbon_emission)
      completed_goal[:total_carbon_emission_for_goal] = total_carbon_emission_for_goal
    end

    @carbon_emissions_by_activity_type = Activity.where(user_id: current_user.id).group("activity_types.name").joins(:activity_type).sum(:carbon_emission)

    @carbon_emissions_by_category = Activity.where(user_id: current_user.id).group("activity_types.category").joins(:activity_type).sum(:carbon_emission)

    @carbon_emission_by_day_of_week_and_category = Activity.where(user_id: current_user.id).joins(:activity_type)
    .where(created_at: start_date.beginning_of_day..end_date.end_of_day)
    .group("DATE_TRUNC('day', activities.created_at)::date", "activity_types.category", "activity_types.name")
    .sum(:carbon_emission)

    if @carbon_emission_by_day_of_week_and_category.empty?
      flash.now[:notice] = 'No historical data available. Please update your activities regularly for a comprehensive historical record.'
    end
  end
  def generate_csv(data, file_path)
    CSV.open(file_path, 'wb') do |csv|
      # Write header row
      csv << ['Activity Type', 'Total Carbon Emission']

      # Check if data is nil or empty
      if data.nil? || data.empty?
        csv << ['No data available']
      else
        # Iterate over data and write rows
        data.each do |activity_type, carbon_emission|
          csv << [activity_type, carbon_emission]
        end
      end
    end
    puts "CSV file has been created: #{file_path}"
    @carbon_emissions_by_category = Activity.where(user_id: current_user.id).group("activity_types.category").joins(:activity_type).sum(:carbon_emission)
  end
end
