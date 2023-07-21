class Post < ApplicationRecord
    validates :body, presence: true
    validates :nickname, presence: true
    validates :avatarUrl, presence: true
    validates :open_id, presence: true

    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user

end
