class AddEventIdToHides < ActiveRecord::Migration[5.1]
  def change
    add_column :hides, :event_id, :integer
  end
end
