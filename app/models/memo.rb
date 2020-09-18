class Memo < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  
  belongs_to :user

  scope :recent, -> { order(created_ad: :desc) }
end
