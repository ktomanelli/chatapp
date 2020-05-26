class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :img_url
      t.string :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
