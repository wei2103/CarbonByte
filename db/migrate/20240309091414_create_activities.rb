class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :carbon_emission
      t.references :type, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
