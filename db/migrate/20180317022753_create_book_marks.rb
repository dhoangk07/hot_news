class CreateBookMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :book_marks do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end