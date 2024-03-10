class ClimatiqEstimationService
  include HTTParty
  base_uri 'https://api.climatiq.io'
  headers 'Authorization' => "Bearer #{ENV[CLIMATIQ_API_KEY]}", 'Content-Type' => 'application/json'

  def self.calculate_carbon_emission(activity_id, value)
    activity = Activity.find(activity_id)

    response = post('/v1/estimates', body: {
      emission_factor: {
        activity_id: activity.activity_type.climatiq_id,
        data_version: "^0"
      },
      parameters: {
        activity.activity_type.climatiq_unit_type => value,
        "#{activity.activity_type.climatiq_unit_type}_unit" => activity.activity_type.climatiq_unit_of_measurement
      }
    }.to_json)

    response.parsed_response
  end
end