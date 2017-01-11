$(function(){
  function buildHTML(message){
    var name = ('< p class="chat-message__header--name" >').append(message.name);
    var time = ('< chat-message__header--time >').append(message.created_at);
    var header = ('< chat-message__header >').append(name).append(time);
    var message = ('< p class="chat-message__body" >').append(message.body);
    var html = $('< li class="chat-message">').append(header).append(message);
    return html;
  }
  $('.new_message').on('send', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: '/messages.json',
      data: {
        message: {
          body: textField.val()
        }
      },
      dataType:'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      textField.val('');
    })
    .fail(function(){
      console.log("error");
    })
  });
});

