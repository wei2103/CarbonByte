class AddClimatiqUnitTypeToActivityTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :activity_types, :climatiq_unit_type, :string
  end
end
