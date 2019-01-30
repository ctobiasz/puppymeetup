class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :location_string
      t.boolean :purchased

      t.timestamps
    end
  end
end
