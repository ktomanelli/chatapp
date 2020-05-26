class AddContentToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :content, :string
  end
end
