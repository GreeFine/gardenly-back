class FixPeriodicitiesAssociations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :plant_periodicities, :periodicities
    add_reference :plant_periodicities, :periodicity, type: :uuid, index: true
  end
end
