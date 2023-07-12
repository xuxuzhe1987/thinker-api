class AddRateToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :rate, :integer, default: 0
  end
end
