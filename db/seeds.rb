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

#admin_user = User.create(email: 'admin@example.com', password: 'password', admin: true)
user = User.create(email: 'user@example.com', password: 'password')

Content.create(
  user: user,
  content_type: 'video',
  content_link: 'https://www.youtube.com/embed/J_iDcKDAwbA',
  title: 'How to Reduce Your Carbon Footprint',
  description: 'Video is about how to Reduce Your Carbon Footprint. A carbon footprint is the total amount of greenhouse gases, including carbon dioxide,
  that are emitted into the atmosphere as a result of our activities.'
)

Content.create(
  user: user,
  content_type: 'article',
  content_link: 'https://www.fssi-ca.com/wp-content/uploads/MvF_footprint.png',
  title: 'What is a carbon footprint?',
  description: 'So, what exactly is a carbon footprint? According to Mike Berners-Lee, a professor at Lancaster University in the UK and author of The Carbon Footprint of Everything, it is “the sum total of all the greenhouse gas emissions that had to take place in order for a product to be produced or for an activity to take place.”
  For most consumers in developed countries, these products and activities tend to fall into four principal categories: household energy use, transport, food, and everything else, which is mostly the products we buy, from utensils to clothes to cars to television sets.
  Each of these activities and products has its own footprint; a person’s carbon footprint is the combined total of the products they buy and use, the activities they undertake, and so on. A person who regularly consumes beef will have a  larger food footprint than his vegan neighbor, but that neighbor’s overall footprint may be larger if she drives an hour to work and back in an SUV each day while our meat-eater bicycles to his office nearby. Both their footprints may pale in comparison to the businesswoman across the street, who flies first-class cross-country twice a month.
  Unsurprisingly, in general terms the size of a person’s carbon footprint tends to increase with wealth. In his book, Berners-Lee writes that the average global citizen has a carbon footprint that is equivalent to the emission of seven tons of carbon dioxide per year. However, that figure is approximately 13 tons for the average Briton and roughly 21 tons per person in the United States.; The “average American takes just a couple of days to match the annual footprint of the average Nigerian or Malian,” he writes.'
)

Content.create(
  user: user,
  content_type: 'infographic',
  content_link: 'https://www.epa.gov/sites/default/files/2017-04/fossil_fuels_1.png',
  title: 'Trends in Global Emissions',
  description: 'Global carbon emissions from fossil fuels have significantly increased since 1900. Since 1970, CO2 emissions have increased by about 90%, with emissions from fossil fuel combustion and industrial processes contributing about 78% of the total greenhouse gas emissions increase from 1970 to 2011. Agriculture, deforestation, and other land-use changes have been the second-largest contributors.[1]
  Emissions of non-CO2 greenhouse gases have also increased significantly since 1900. To learn more about past and projected global emissions of non-CO2 gases, please see the EPA report, Global Anthropogenic Non-CO2 Greenhouse Gas Emissions: 1990-2020.'
)
