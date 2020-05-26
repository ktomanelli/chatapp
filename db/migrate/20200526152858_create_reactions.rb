class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.integer :message_id
      t.integer :from_id
      t.string :img_url

      t.timestamps
    end
  end
end
