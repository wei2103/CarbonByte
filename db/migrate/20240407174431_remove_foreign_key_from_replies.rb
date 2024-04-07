class RemoveForeignKeyFromReplies < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :replies, :users
  end
end
