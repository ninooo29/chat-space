json.id   @messages_add.id
json.name @messages_add.user.name
json.body @messages_add.body
json.time published_time_for_message(@messages_add)
json.image @messages_add.image.url
json.notice flash.now[:notice]
