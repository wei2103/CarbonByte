class ChangeContentLinkToStringInContents < ActiveRecord::Migration[7.0]
  def change
    change_column :contents, :content_link, :string
  end
end
