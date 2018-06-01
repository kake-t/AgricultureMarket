class Producer < ApplicationRecord
  mount_uploader :producer_image, ImageUploader

  belongs_to :user

  validates :area, presence: true
  validates :pesticide, inclusion: { in: [true, false] }
  validates :producer_image, presence: true
  validates :content, presence: true
end
