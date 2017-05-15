module ApplicationHelper
  def published_time_for_message(message)
    message.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
