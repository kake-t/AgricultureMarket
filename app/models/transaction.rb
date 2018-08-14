class Transaction < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :item
  belongs_to :user

  validates :item_id, uniqueness: { scope: [:user_id] }
end
