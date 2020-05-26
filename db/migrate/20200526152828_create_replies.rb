class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :message_id
      t.integer :from_id

      t.timestamps
    end
  end
end
