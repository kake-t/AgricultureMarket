class Item < ApplicationRecord
  mount_uploader :item_image, ImageUploader
end
