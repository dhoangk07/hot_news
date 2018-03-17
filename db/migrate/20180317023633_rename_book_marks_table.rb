class RenameBookMarksTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :book_marks, :bookmarks
  end
end
