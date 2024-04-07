class CreateActivityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_types do |t|
      t.string :name
      t.string :climatiq_id
      t.string :climatiq_unit_of_measurement
      t.string :category

      t.timestamps
    end
  end
end
