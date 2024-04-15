require 'rails_helper'

# RSpec.describe Activity, type: :model do
#   describe '#carbon_emissions_by_activity_type' do
#     let!(:energy_activity) { create(:activity, carbon_emission: 100, activity_type: create(:activity_type, name: 'energy')) }
#     let!(:transport_activity) { create(:activity, carbon_emission: 50, activity_type: create(:activity_type, name: 'transport')) }
#     let!(:another_energy_activity) { create(:activity, carbon_emission: 58, activity_type: energy_activity.activity_type) }

#     it 'returns the carbon emissions grouped by activity type' do
#       expected_result = { "energy" => 158, "transport" => 50 }
#       expect(Activity.group("activity_types.name").joins(:activity_type).sum(:carbon_emission)).to eql(expected_result)
#     end
#   end
# end
