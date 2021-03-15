class Diary < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :relationships
  validates :image, presence: true
end
