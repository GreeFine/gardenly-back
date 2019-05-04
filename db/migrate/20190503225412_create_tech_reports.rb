class CreateTechReports < ActiveRecord::Migration[5.2]
  def change
    create_table :tech_reports do |t|
      t.string :body

      t.timestamps
    end
  end
end
