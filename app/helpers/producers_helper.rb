module ProducersHelper
  def indicate_pesticide
    if @producer.pesticide == false
      '有り'
    else
      '無し'
    end
  end

  def choose_new_or_edit
    if action_name == 'new'
      user_producers_path(@producer.user_id)
    elsif action_name == 'edit'
      user_producer_path(@producer.user_id, @producer)
    end
  end
end
