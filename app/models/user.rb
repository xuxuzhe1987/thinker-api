class User < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
end
