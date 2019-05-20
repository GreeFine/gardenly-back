require 'csv'

namespace :plants do
  task :fetch, [:filepath] => :environment do |t, args|
    Rails.logger = Logger.new(STDOUT)
    i = 0
    plants = []
    csv_text = open("app/assets/csv/plants.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      plants[i] = {}
      plants[i][:name] = row[0]

      height = row[1].split("-")
      plants[i][:height_low] = height[0].to_i
      height.count == 1 ?
        plants[i][:height_high] = height[0].to_i
        : plants[i][:height_high] = height[1].to_i

      bloss_start = []
      row[2].split(", ").each do |e|
        bloss_start << e.to_i
      end
      bloss_end = []
      row[3].split(", ").each do |e|
        bloss_end << e.to_i
      end
      plants[i][:blossoming_start] = bloss_start
      plants[i][:blossoming_end] = bloss_end

      plants[i][:type] = Type.find_or_create_by(name: row[4]).uuid

      shapes = []
      row[5].split(", ").each do |e|
        shapes << Shape.find_or_create_by(name: e).uuid
      end
      plants[i][:shapes] = shapes

      grounds = []
      row[6].split(", ").each do |e|
        grounds << GroundType.find_or_create_by(name: e).uuid
      end
      plants[i][:grounds] = grounds

      plants[i][:ph_range_low] = row[7].split(", ").last.to_f
      plants[i][:ph_range_high] = row[7].split(", ").first.to_f

      plants[i][:rusticity] = row[8].to_i
      plants[i][:water_need] = row[9].to_i
      plants[i][:sun_need] = row[10].to_i

      colors = []
      row[11].split(", ").each do |e|
        colors << Color.find_or_create_by(name: e).uuid
      end
      plants[i][:colors] = colors

      periodicities = []
      row[12].split(", ").each do |e|
        periodicities << Periodicity.find_or_create_by(name: e).uuid
      end
      plants[i][:periodicities] = periodicities

      plants[i][:photo_url] = row[13]
      plants[i][:description] = row[14]
      plants[i][:tips] = row[15]
      plants[i][:model] = row[16].to_i

      i = i + 1
    end

    plants.each do |e|
      puts e.to_s
      puts "\n"
      begin
        plant = Plant.create!(
          name: e[:name],
          height_low: e[:height_low],
          height_high: e[:height_high],
          blossoming_start: e[:blossoming_start],
          blossoming_end: e[:blossoming_end],
          type_id: e[:type],
          shape_ids: e[:shapes],
          ground_type_ids: e[:grounds],
          ph_range_low: e[:ph_range_low],
          ph_range_high: e[:ph_range_high],
          rusticity: e[:rusticity],
          water_need: e[:water_need],
          sun_need: e[:sun_need],
          color_ids: e[:colors],
          periodicity_ids: e[:periodicities],
          model: e[:model],
          description: e[:description],
          tips: e[:tips]
        )
        begin
          plant.remote_photo_url = e[:photo_url]
        rescue => error
          TechReport.create!(body: "PLANT MEDIA:: #{e[:name]} -- #{e[:photo_url]} -- #{error}")
        end
        plant.save!
      rescue => error
        TechReport.create!(body: "PLANT CREATE:: #{e[:name]} -- #{error}")
      end
    end

  end
end
