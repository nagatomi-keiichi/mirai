class Diary < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :relationships

  validates :image, presence: true
  validates :title, presence: true,length: { maximum: 12 }
end
