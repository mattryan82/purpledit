class Post < ApplicationRecord
  has_many :comments
  has_many :votes
  belongs_to :user
  validates :content, presence:true
end
