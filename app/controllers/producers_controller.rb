class ProducersController < ApplicationController
  def new
    @producer = Producer.new
  end
end
