class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
      t.integer "book_id"
      t.string  "title" , :limit => 200 , :null =>  false 
      t.integer "position" , :null =>  true , :default => 0
      t.boolean "visible"  , :default => false
      t.timestamps
    end
    add_index("pages", "book_id")
  end
  def down 
    drop_table :pages
  end
end
