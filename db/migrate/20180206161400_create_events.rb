class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
    	t.string :title
    	t.date :date
    	t.string :source
    	
      t.timestamps
    end
  end
end
