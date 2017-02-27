$(function(){

  function buildHTML(message){
    var buildImage = "";
    if(message.image) {
      buildImage = '<img class="chat-message__image" src= ' +message.image + '>'
    }

    var html =  '<li class="chat-message">' +
                  '<div class="chat-message__header clearfix">' +
                    '<p class="chat-message__header--name">' + message.name + '</p>' +
                    '<p class="chat-message__header--time"">' + message.created_at + '</p>' +
                  '</div>' +
                  '<p class="chat-message__body">' + message.body + '</p>' + buildImage +
                '</li>';
    return html;
  }

  function ReloadScroll(){
    var height = $(".chat-messages").height();
    $(".chat-body").animate({
      scrollTop: height
    }, "slow", "swing");
  };


  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    $('#submit').removeAttr('data-disable-with');
    var formData = new FormData($("#new_message")[0]);;

    $.ajax({
      type: 'POST',
      url: './messages',
      data: formData,
      dataType:'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data.message);
      $('.chat-messages').append(html);
      $('#message_body').val('')
      ReloadScroll();
    })
    .fail(function(){
      alert('エラーが発生しました');
    });
  });


  if (window.location.href.match(/messages/)){
    setInterval(reloadPage, 10000);
    function reloadPage(){
      $.ajax({
        type: 'GET',
        url: 'messages',
        dataType: 'json'
      })
      .done(function(data){
        var messages = data;
        var AddHtml = "";
        $.each(messages, function(i, message){
          AddHtml += buildHTML(message);
        });
        $('.chat-messages').html(AddHtml);
      });
    }
  };
});
