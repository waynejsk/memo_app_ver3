class Memo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  
  belongs_to :user
  has_one_attached :image

  scope :recent, -> { order(created_ad: :desc) }
end
