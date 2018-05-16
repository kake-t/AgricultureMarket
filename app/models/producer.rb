class Producer < ApplicationRecord
  mount_uploader :producer_image, ImageUploader

  belongs_to :user
end
