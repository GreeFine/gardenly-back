class PlantTile < ApplicationRecord
  self.primary_key = :uuid
  attr_accessor :data, :key, :sun_exposition, :age, :tile_id
  after_create :check_plant_uniqueness

  belongs_to :plant
  belongs_to :tile

  def check_plant_uniqueness

    self.tile.garden.tiles.each do |tile|
      tile.plants.group(:uuid).count.each do |e|
        puts "Plant DATA ::: #{e[0]} -- #{e[1]} ||| #{self.plant.uuid}"
        if e[1] == 1 && e[0] == self.plant.uuid
          Task.create!(plant_tile: self, garden: self.tile.garden, status: "New", body: nil, public: false, user: self.tile.garden.user)
          return
        end
      end
    end
  end
end
