class CreateUserPreferencesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :activity_types, table_name: :user_preferences do |t|
      # You can add any additional columns here if needed
      t.index [:user_id, :activity_type_id]
      t.index [:activity_type_id, :user_id]
    end
  end
end
