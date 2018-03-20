class CreateRsslinks < ActiveRecord::Migration[5.1]
  def change
    create_table :rsslinks do |t|
      t.string :url

      t.timestamps
    end
  end
end
