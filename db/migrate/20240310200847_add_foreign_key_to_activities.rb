class AddForeignKeyToActivities < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :activities, :activity_types, column: :type_id
    add_foreign_key :activities, :users, column: :user_id
  end
end
