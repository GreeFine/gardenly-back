require 'csv'

namespace :plants do
  task :fetch, [:filepath] => :environment do |t, args|
    i = 0
    plants = []
    csv_text = open("app/assets/csv/plants.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      plants[i] = {}
      plants[i].name = row[0]

      i = i + 1
    end

    plants.each do |e|
      puts e.to_s
      puts "\n"
      begin
        plant = Plant.create!(name: e.name)
        begin
          plant.remote_photo_url = e.photo_url
        rescue
          TechReport.create!(body: "PLANT MEDIA:: #{e.name} -- #{e.photo_url}")
        end
        plant.save!
      rescue
        TechReport.create!(body: "PLANT CREATE:: #{e.name}")
      end
    end

  end
end
