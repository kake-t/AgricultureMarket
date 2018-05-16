module ProducersHelper
  def indicate_pesticide
    if @producer.pesticide == false
      '有り'
    else
      '無し'
    end
  end
end
