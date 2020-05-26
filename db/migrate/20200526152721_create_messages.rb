class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :from_id
      t.integer :to_id
      t.integer :chatroom_id

      t.timestamps
    end
  end
end
