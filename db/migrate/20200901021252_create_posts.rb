class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name,              null: false
      t.integer :genre_id,         null: false
      t.text :allergies,           null: false
      t.string :store_name,        null: false
      t.integer :price,            null: false
      t.string :address          
      t.text :text,                null: false
      t.references :user,          foreign_key: true
      t.integer :likes_count
      t.timestamps
    end
  end
end
