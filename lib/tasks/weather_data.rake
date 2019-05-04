namespace :weather_data do
  task :fetch_week_forecast_by_location, [:latitude, :longitude] => :environment do |t, args|
    gridResponse = RestClient::Request.execute(
      method: :get,
      url: "https://api.weather.gov/points/#{args[:latitude]},#{args[:longitude]}",
    )
    weatherResponse = RestClient::Request.execute(
      method: :get,
      url: JSON.parse(gridResponse)["properties"]["forecast"],
    )
    puts weatherResponse
  end

  task :fetch_now_by_location, [:latitude, :longitude] => :environment do |t, args|
    gridResponse = RestClient::Request.execute(
      method: :get,
      url: "https://api.weather.gov/points/#{args[:latitude]},#{args[:longitude]}",
    )
    weatherResponse = RestClient::Request.execute(
      method: :get,
      url: JSON.parse(gridResponse)["properties"]["forecast"],
    )
    pp JSON.parse(weatherResponse)["properties"]["periods"].first
  end
end
