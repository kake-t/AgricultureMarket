class Item < ApplicationRecord
  mount_uploader :item_image, ImageUploader

  belongs_to :saler, class_name: 'User', optional: true
  belongs_to :buyer, class_name: 'User', optional: true
end
