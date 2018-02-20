class DropUsers < ActiveRecord::Migration[5.1]
  def up
    drop_table :users    
  end

end
