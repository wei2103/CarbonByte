class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.date :target_completion_date
      t.integer :carbon_emission

      t.timestamps
    end
  end
end
