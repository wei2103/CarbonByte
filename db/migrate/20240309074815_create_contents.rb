class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents, id: :integer do |t|

      t.integer :user_id
      t.string :content_type
      t.string :title
      t.text :description
      t.timestamps
    end
    
    add_foreign_key :contents, :users
  end
end
