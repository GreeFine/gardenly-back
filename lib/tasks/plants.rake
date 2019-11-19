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

  ###################
  ###################
  ###################
  
  task :add_from_cli, [:payload] => :environment do |t, args|
    Rails.logger = Logger.new(STDOUT)

    puts args[:payload]
    tmp_payload = {}
    args[:payload].split("INTERKEY").each do |pair|
      tmp_payload["#{pair.split("KEYVAL").first}"] = pair.split("KEYVAL").last
    end

    name = tmp_payload["name"]
    height = tmp_payload["height"].split("-")
    tmp_payload["height_low"] = height[0].to_i
    height.count == 1 ?
      tmp_payload["height_high"] = height[0].to_i
      : tmp_payload["height_high"] = height[1].to_i

    bloss_start = []
    tmp_payload["blossoming_start"].split("-").each do |e|
      bloss_start << e.to_i
    end
    bloss_end = []
    tmp_payload["blossoming_end"].split("-").each do |e|
      bloss_end << e.to_i
    end
    tmp_payload["blossoming_start"] = bloss_start
    tmp_payload["blossoming_end"] = bloss_end

    tmp_payload["type"] = Type.find_or_create_by(name: tmp_payload["type"]).uuid

    shapes = []
    tmp_payload["shapes"].split("-").each do |e|
      shapes << Shape.find_or_create_by(name: e).uuid
    end
    tmp_payload["shapes"] = shapes

    grounds = []
    tmp_payload["grounds"].split("-").each do |e|
      grounds << GroundType.find_or_create_by(name: e).uuid
    end
    tmp_payload["grounds"] = grounds

    tmp_payload["ph_range_low"] = tmp_payload["ph"].split("-").last.to_f
    tmp_payload["ph_range_high"] = tmp_payload["ph"].split("-").first.to_f

    colors = []
    tmp_payload["colors"].split("-").each do |e|
      colors << Color.find_or_create_by(name: e).uuid
    end
    tmp_payload["colors"] = colors

    periodicities = []
    tmp_payload["periodicities"].split("-").each do |e|
      periodicities << Periodicity.find_or_create_by(name: e).uuid
    end
    tmp_payload["periodicities"] = periodicities

    begin
      plant = Plant.create!(
        name: tmp_payload["name"],
        height_low: tmp_payload["height_low"],
        height_high: tmp_payload["height_high"],
        blossoming_start: tmp_payload["blossoming_start"],
        blossoming_end: tmp_payload["blossoming_end"],
        type_id: tmp_payload["type"],
        shape_ids: tmp_payload["shapes"],
        ground_type_ids: tmp_payload["grounds"],
        ph_range_low: tmp_payload["ph_range_low"],
        ph_range_high: tmp_payload["ph_range_high"],
        rusticity: tmp_payload["rusticity"],
        water_need: tmp_payload["water_need"],
        sun_need: tmp_payload["sun_need"],
        color_ids: tmp_payload["colors"],
        periodicity_ids: tmp_payload["periodicities"],
        model: tmp_payload["model"],
        description: tmp_payload["description"],
        tips: tmp_payload["tips"]
      )
      begin
        plant.remote_photo_url = tmp_payload["photo_url"]
      rescue => error
        TechReport.create!(body: "PLANT MEDIA:: #{tmp_payload["name"]} -- #{tmp_payload["photo_url"]} -- #{error}")
      end
      plant.save!
    rescue => error
      TechReport.create!(body: "PLANT CREATE:: #{tmp_payload["name"]} -- #{error}")
    end
  end

  ###################
  ###################
  ###################

  task :update_from_cli, [:name, :fields, :payload] => :environment do |t, args|
    Rails.logger = Logger.new(STDOUT)

    puts args[:payload]
    tmp_payload = {}
    args[:payload].split("INTERKEY").each do |pair|
      tmp_payload["#{pair.split("KEYVAL").first}"] = pair.split("KEYVAL").last
    end
    tmp_fields = Array(args[:fields].split("-"))
    plant = Plant.find_by(name: args[:name])

    tmp_fields.each do |e|
      e = e.to_i
    end
    puts args[:name]
    puts tmp_payload
    puts tmp_fields
    puts plant

    if tmp_fields.include?("1")
      plant.name = tmp_payload["name"]
    end

    if tmp_fields.include?("2")
      height = tmp_payload["height"].split("-")
      plant.height_low = height[0].to_i
      height.count == 1 ?
        plant.height_high = height[0].to_i
        : plant.height_high = height[1].to_i
    end

    if tmp_fields.include?("3")
      bloss_start = []
      tmp_payload["blossoming_start"].split("-").each do |e|
        bloss_start << e.to_i
      end
      bloss_end = []
      tmp_payload["blossoming_end"].split("-").each do |e|
        bloss_end << e.to_i
      end
      plant.blossoming_start = bloss_start
      plant.blossoming_end = bloss_end
    end

    if tmp_fields.include?("4")
      plant.type_id = Type.find_or_create_by(name: tmp_payload["type"]).uuid
    end

    if tmp_fields.include?("5")
      shapes = []
      tmp_payload["shapes"].split("-").each do |e|
        shapes << Shape.find_or_create_by(name: e).uuid
      end
      plant.shape_ids = shapes
    end

    if tmp_fields.include?("6")
      grounds = []
      tmp_payload["grounds"].split("-").each do |e|
        grounds << GroundType.find_or_create_by(name: e).uuid
      end
      plant.ground_ids = grounds
    end

    if tmp_fields.include?("7")
      plant.ph_range_low = tmp_payload["ph"].split("-").last.to_f
      plant.ph_range_high = tmp_payload["ph"].split("-").first.to_f
    end

    if tmp_fields.include?("8")
      plant.rusticity = tmp_payload["rusticity"]
    end

    if tmp_fields.include?("9")
      plant.water_need = tmp_payload["water_need"]
    end

    if tmp_fields.include?("10")
      plant.sun_need = tmp_payload["sun_need"]
    end

    if tmp_fields.include?("11")
      colors = []
      tmp_payload["colors"].split("-").each do |e|
        colors << Color.find_or_create_by(name: e).uuid
      end
      plant.color_ids = colors
    end

    if tmp_fields.include?("12")
      periodicities = []
      tmp_payload["periodicities"].split("-").each do |e|
        periodicities << Periodicity.find_or_create_by(name: e).uuid
      end
      plant.periodicities = periodicities
    end

    if tmp_fields.include?("13")
      plant.description = tmp_payload["description"]
    end

    if tmp_fields.include?("14")
      plant.tips = tmp_payload["tips"]
    end

    if tmp_fields.include?("15")
      plant.model = tmp_payload["model"]
    end

    if tmp_fields.include?("16")
      puts "IM HERE"
      plant.remote_photo_url = tmp_payload["photo_url"]
    else
      puts "IM NOT HERE"
    end

    begin
      plant.save!
    rescue => error
      TechReport.create!(body: "PLANT CREATE:: #{tmp_payload["name"]} -- #{error}")
    end
  end
end
