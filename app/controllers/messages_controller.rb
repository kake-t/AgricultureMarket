class MessagesController < ApplicationController
  before_action do
    @transaction = Transaction.find(params[:transaction_id])
  end

  def index
    @messages = @transaction.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @transaction.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

    @message = Transaction.messages.new
  end

  def create
    @message = Transaction.messages.new(message_params)
    if @message.save
      redirect_to transaction_messages_path(@transaction)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
