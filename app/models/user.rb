class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :user_icon, ImageUploader

  # association
  has_one :producer, dependent: :destroy
  #userが「買った」商品
  has_many :buyed_items, foreign_key: 'buyer_id', class_name: 'Item', dependent: :destroy
  #userが 「現在売っている」商品
  has_many :salling_items, -> { where("buyer_id is NULL") }, foreign_key: 'saler_id', class_name: 'Item', dependent: :destroy
  #userが「既に売った」商品
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: 'saler_id', class_name: 'Item', dependent: :destroy
end
