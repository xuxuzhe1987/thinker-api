class ChangeOpenIdToOpenIdInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :openID, :open_id
  end
end
