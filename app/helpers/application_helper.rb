module ApplicationHelper
  def simple_time_helper(time)
    time.strftime("%Y-%m-%d %H:%M:%S")
  end
end
