class Message < ApplicationRecord
  belongs_to :transaction
  belongs_to :user

  validates_persence_of :body, :transaction_id, :user_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
