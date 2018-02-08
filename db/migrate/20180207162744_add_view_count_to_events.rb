class AddViewCountToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :view_count, :integer, default: 0
  end
end
