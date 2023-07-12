class Post < ApplicationRecord
    validates :body, presence: true, length: { minimum: 2, maximum: 40 }
    validates :nickname, presence: true
    validates :avatarUrl, presence: true
    validates :open_id, presence: true

    has_many :likes, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user

end
