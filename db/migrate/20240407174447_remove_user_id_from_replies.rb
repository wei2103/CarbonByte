class RemoveUserIdFromReplies < ActiveRecord::Migration[7.0]
  def change
    remove_column :replies, :user_id, :bigint
  end
end
