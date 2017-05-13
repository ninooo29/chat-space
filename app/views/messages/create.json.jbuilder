json.id   @message.id
json.name @message.user.name
json.body @message.body
# json.time published_time_for_message(@message)
json.time @message.created_at
json.image @message.image
json.notice flash.now[:notice]
