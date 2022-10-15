class AddDefaultConstrainstToPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :likesCounter, false
    change_column_default :posts, :likesCounter, 0
    change_column_null :posts, :commentsCounter, false
    change_column_default :posts, :commentsCounter, 0
  end
end
