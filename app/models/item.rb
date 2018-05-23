class Item < ApplicationRecord
  mount_uploader :item_image, ImageUploader

  belongs_to :seller, class_name: 'User', optional: true
  belongs_to :buyer, class_name: 'User', optional: true

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_many :comments, dependent: :destroy

  has_many :transactions, dependent: :destroy
end
