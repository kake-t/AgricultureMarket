class Message < ApplicationRecord
  belongs_to :negotiation, class_name: 'Transaction', optional: true
  belongs_to :user

  validates_presence_of :body, :transaction_id, :user_id
end
