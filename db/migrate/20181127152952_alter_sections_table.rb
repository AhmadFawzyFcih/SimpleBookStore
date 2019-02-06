class AlterSectionsTable < ActiveRecord::Migration[5.1]
  def up
    change_column("sections", "content", :text , :null => false)
  end
  def down 
    change_column("sections", "content", :string , :null => true)
  end
end
