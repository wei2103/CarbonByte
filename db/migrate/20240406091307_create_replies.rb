class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
