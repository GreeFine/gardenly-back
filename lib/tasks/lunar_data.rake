namespace :lunar_data do
  task :fetch_yearly, [:year] => :environment do |t, args|
    response = RestClient::Request.execute(
      method: :get,
      url: "https://api.usno.navy.mil/moon/phase?year=#{args[:year]}",
    )
    LunarCycle.create!(data: JSON.parse(response), year: args[:year])
  end
end
