class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name 
      t.text :body 
      t.float :rate
      t.integer :genre_id,  nill:false
      t.timestamps
    end
  end
end
