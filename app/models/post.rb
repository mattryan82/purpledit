class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :content, presence:true
end
