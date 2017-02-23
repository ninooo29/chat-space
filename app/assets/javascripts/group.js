$(document).on('turbolinks:load', function () {
  $("#user-search-field").on("keyup", function(){
    var input = $("#user-search-field").val()
    $(".chat-group-user").remove();
    $.ajax({
      type: 'GET',
      url: '/users.json',
      data: {
        name: input
      },
      dataType:'json'
    })
    .done(function(data){
      var users = data;
      $.each(users, function(i, user){
        $('#user-serch-result').append(buildHTML(user))
      })
    })
    .fail(function(data){
      alert("userがいません");
    })
  })

  $(document).on("click", '.chat-group-user__btn--add' , function(){
    $(this).parent().remove();
    var id = $(this).data("userId");
    var name = $(this).data("userName");
    $('#chat-group-users').append(AddUser(id, name));
  });

  $(document).on('click', '.chat-group-user__btn--remove', function(){
    $(this).parent().remove();
  })

  function AddUser(id, name){
    var html = `
      <div class='chat-group-user clearfix' id="chat-group-user-${id}">
        <input type='hidden' name='group[user_ids][]' value="${id}">
        <p class='chat-group-user__name'>
          ${name}
        </p>
        <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove' data-user-id="${id}">削除</a>
      </div>`;
    return html
  }

  function buildHTML(user){
    var html =
      `<div class="chat-group-user">
        <p class="chat-group-user__name">
          ${user.name}
        </p>
        <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
       </div>`;
    return html;
  }
})
