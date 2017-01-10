$(function(){
  function buildHTML(message){
    var html = $('< li class="chat-message">').append(message.content);
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
          content: message
        }
      },
      dataType:'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      textField.val('');
    })
  });
});

