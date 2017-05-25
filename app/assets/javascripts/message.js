$(function(){

  function buildHTML(message){
    console.log(message)
    // debugger
    if (message.image) {
      var buildImage =`<img class="chat-message__image" src="${message.image}">`;
    } else {
      var buildImage = '';
    }


    var html = `<li class='chat-message clearfix' data-id=${message.id}>
                  <div class='chat-message__header clearfix'>
                    <p class="chat-message__header--name">${message.name}</p>
                    <p class="chat-message__header--time">${message.time}</p>
                  </div>
                  <p class="chat-message__body">${message.body}</p>${buildImage}
                </li>`

    return html;
  }

  function ReloadScroll(){
    var height = $(".chat-messages").height();
    $(".chat-body").animate({
      scrollTop: height
    }, "slow", "swing");
  };

  function reloadPage(){
    lastId = $('.chat-message').last().data('id')|| 0;
    $.ajax({
      url: window.location.href,
      method: 'GET',
      data: {
        last_id: lastId,
      },
      dataType: 'json',
    })

    .done(function(data){
      debugger
      if (data.length != 0) {
        console.log("clear")
        var messages = data;
        var AddHtml = "";
        $.each(messages, function(i, message){
          AddHtml += buildHTML(message);
        });
        $('.chat-messages').html(AddHtml);
      }
    })
    .fail(function(){
      console.log("fail")
    });
  }

  $(document).on('turbolinks:load', function () {

    $('.new_message').on('submit', function(e) {
      e.preventDefault();
      $('#submit').removeAttr('data-disable-with');
      var formData = new FormData($("#new_message")[0]);
      var href = window.location.href
      $.ajax({
        type: 'post',
        url: href,
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        console.log("aaa")
        var html = buildHTML(data);
        $('.chat-messages').append(html);
        $('#message_body').val('')
        ReloadScroll();
      })
      .fail(function(){
        alert('エラーが発生しました');
      });
    });

  })

  if (window.location.href.match(/messages/)){
    setInterval(reloadPage, 10000);
  };
});
