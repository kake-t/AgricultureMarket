class ProducersController < ApplicationController
  before_action :set_producer, only: %i[show edit update]

  def new
    @producer = Producer.new
    @producer.user_id = current_user.id
  end

  def create
    @producer = Producer.new(producer_params)
    @producer.user_id = current_user.id
    if @producer.save
      redirect_to user_producer_path(@producer.user_id, @producer)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @producer.update(producer_params)
      redirect_to user_producer_path(@producer.user_id, @producer)
    else
      render 'edit'
    end
  end

  private

  def producer_params
    params.require(:producer).permit(
      :area,
      :pesticide,
      :producer_image,
      :producer_image_cache,
      :content
    )
  end

  def set_producer
    @producer = Producer.find(params[:id])
  end
end
