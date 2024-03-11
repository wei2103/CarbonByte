require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

    # Test whether the variable is equal to the expected value
    carbon_emissions_by_category = Activity.group("activity_types.category").joins(:activity_type).sum(:carbon_emission)

    carbon_emissions_by_category == { "energy" => 158, "transport" => 21 }

    # Test whether the variable is equal to the expected value
    carbon_emissions_by_activity_type = Activity.group("activity_types.name").joins(:activity_type).sum(:carbon_emission)

    carbon_emissions_by_activity_type == { "Electricity" => 158, "Motorcycle" => 21 }

    # Test whether the variable is not equal to the expected value
    carbon_emissions_by_activity_type = Activity.group("activity_types.name").joins(:activity_type).sum(:carbon_emission)

    carbon_emissions_by_activity_type != { "Electricity" => 158, "Motorcycle" => 21 }

    # Test whether the variable is not equal to the expected value
    carbon_emissions_by_category = Activity.group("activity_types.category").joins(:activity_type).sum(:carbon_emission)

    carbon_emissions_by_category != { "energy" => 158, "transport" => 21 }
end
