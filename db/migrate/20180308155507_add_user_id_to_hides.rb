class AddUserIdToHides < ActiveRecord::Migration[5.1]
  def change
    add_column :hides, :user_id, :integer
  end
end
