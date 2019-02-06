class AlterBooksTable < ActiveRecord::Migration[5.1]
  def up
    change_column("books", "description", :text , :null =>  true)
  end
  def down
    change_column("books", "description", :string , :null =>  true)
  end
end
