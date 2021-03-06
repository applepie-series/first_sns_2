class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :micropost
  has_many :comment_lists, through: :micropost,  source: :id
  has_many :notifications, dependent: :destroy

  validates :content, presence: true, length: { maximum: 50 }
  
end
