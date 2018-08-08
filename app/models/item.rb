class Item < ApplicationRecord
  mount_uploader :item_image, ImageUploader

  belongs_to :seller, class_name: 'User', optional: true
  belongs_to :buyer, class_name: 'User', optional: true

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :item_name, presence: true, length: { maximum: 150 }
  validates :item_image, presence: true
  validates :state, inclusion: { in: [true, false] }
  validates :price, numericality: { only_integer: true }, length: { maximum: 7 }
  validates :item_content, presence: true, length: { maximum: 5000 }
end
