class UpdatePostsOpenId < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :openID, :string
  end
end
