class UpdatePosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :name, :nickname
    add_column :posts, :avatarUrl, :string
  end
end
