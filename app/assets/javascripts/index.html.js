$(function(){
  function buildPost(post){
    let html = `<p class="h">${post.title}</p>
                <div class="j">${post.content}</div>`
  
    return html;
  }




  $("#new_post").on("submit", function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr("action");
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(post){
      let html = buildPost(post);
      $(".contents").append(html);
      $('form')[0].reset();
      $(".submit-btn").prop("disabled",false);
      location.href = "/posts";
    })
    .fail(function(){
      alert("エラー");
    })
  })
});