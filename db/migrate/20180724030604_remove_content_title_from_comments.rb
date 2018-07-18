class RemoveContentTitleFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :comment_title, :date
  end
end
