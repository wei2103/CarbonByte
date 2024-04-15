require 'rails_helper'

# RSpec.describe DashboardController, type: :controller do
#   describe "GET #index" do
#     it "calculates carbon emissions correctly" do
#       # Stub the result of the ActiveRecord query
#       allow(Activity).to receive_message_chain(:group, :joins, :sum).and_return({ "Electricity" => 158, "Motorcycle" => 21 })

#       # Execute the method or action that generates carbon_emissions_by_activity_type
#       carbon_emissions_by_activity_type = Activity.group("activity_types.name").joins(:activity_type).sum(:carbon_emission)

#       # Test whether the variable is equal to the expected value
#       expect(carbon_emissions_by_activity_type).to eq({ "Electricity" => 158, "Motorcycle" => 21 })
#     end
#   end
# end
