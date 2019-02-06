class CreateBooks < ActiveRecord::Migration[5.1]
  def up
    create_table :books do |t|
      t.integer "user_id" , :null =>  false
      t.string  "name" , :limit => 200 , :null =>  false 
      t.string  "description" , :null =>  true
      t.text  "cover_image" , :null =>  true
      t.integer "position" , :null =>  true , :default => 0
      t.boolean "visible"  , :default => false
      t.timestamps
    end
    add_index("books", "user_id")
  end

  def down
    drop_table :books
  end
end
