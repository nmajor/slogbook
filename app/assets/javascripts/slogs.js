jQuery(function() {
  $('form').on('click', '.delete_block', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  $('form').on('click', '.add_block', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
  $('.comment_reply').on("click", function(){
    console.log(this);
    $(this).next('.add_comment').show('slow');
  });
});
