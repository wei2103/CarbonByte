# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds/activity_types.rb

# Seed data for activity types
activity_types_data = [
  {
    name: "Motorcycle",
    climatiq_id: "passenger_vehicle-vehicle_type_motorcycle-fuel_source_na-engine_size_na-vehicle_age_na-vehicle_weight_na",
    climatiq_unit_of_measurement: "km",
    climatiq_unit_type: "distance",
    category: "transport"
  },
  {
    name: "Bus",
    climatiq_id: "passenger_vehicle-vehicle_type_bus-fuel_source_na-distance_na-engine_size_na",
    climatiq_unit_of_measurement: "usd",
    climatiq_unit_type: "money",
    category: "transport"
  },
  {
    name: "Car",
    climatiq_id: "passenger_vehicle-vehicle_type_car-fuel_source_na-engine_size_na-vehicle_age_na-vehicle_weight_na",
    climatiq_unit_of_measurement: "km",
    climatiq_unit_type: "distance",
    category: "transport"
  },
  {
    name: "Fresh Fruit",
    climatiq_id: "consumer_goods-type_fruit_fresh",
    climatiq_unit_of_measurement: "t",
    climatiq_unit_type: "weight",
    category: "food"
  },
  {
    name: "Beef",
    climatiq_id: "consumer_goods-type_meat_products_beef",
    climatiq_unit_of_measurement: "usd",
    climatiq_unit_type: "money",
    category: "food"
  },
  {
    name: "Dairy Products",
    climatiq_id: "consumer_goods-type_dairy_products",
    climatiq_unit_of_measurement: "usd",
    climatiq_unit_type: "money",
    category: "food"
  },
  {
    name: "Electricity",
    climatiq_id: "electricity-supply_grid-source_supplier_mix",
    climatiq_unit_of_measurement: "kWh",
    climatiq_unit_type: "energy",
    category: "energy"
  }
]

# Create ActivityType records
activity_types_data.each do |activity_type_data|
  ActivityType.create!(activity_type_data)
end
