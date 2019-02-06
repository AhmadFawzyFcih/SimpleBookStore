class CreateSections < ActiveRecord::Migration[5.1]
  def up
    create_table :sections do |t|
      t.integer  "page_id"
      t.string   "name" , :limit => 300 , :null => false
      t.integer  "position" , :null =>  true , :default => 0
      t.boolean  "visible"  , :default => false
      t.boolean  "content_type" , :default=> 0 
      t.string   "content" , :null => true
      t.timestamps
    end
    add_index("sections", "page_id")
  end
  def down 
    drop_table :sections
  end
end
