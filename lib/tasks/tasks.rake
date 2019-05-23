namespace :tasks do
  task :create => :environment do
    PlantTile.where("created_at > ?", 1.day.ago).each do |pt|
      plant = pt.plant
      garden = pt.tile.garden
      if Task.joins(:plant_tile).where("garden_id = ? AND plant_tiles.plant_id = ?", garden.uuid, plant.uuid).count == 0 && plant.blossoming_start > Time.now.month
        Task.create!(garden: garden, plant_tile: pt, start_date: plant.blossoming_start, end_date: plant.blossoming_end, body: "Il faut fleurir cette plante", public: false)
      end
    end
  end

  task :publish, [:post_create] => :environment do |t, args|
    if args[:post_create]
      Task.where(status: "New", public: false).each do |t|
        t.update(public: true)
      end
    else
      Task.where(status: "New").where("start_date < ?", Time.now.month + 1).each do |t|
        t.update(public: true)
      end
    end
  end
end
