class AddDefaultConstrainsToUsers < ActiveRecord::Migration[7.0]
  def change
     change_column_null :users, :postsCounter, false
    change_column_default :users, :postsCounter, 0
  end
end
