$(document).on('click', '#new_announcement', function(e) {
  e.preventDefault();

  $('#new_announcement_form').slideToggle();
});

$(document).on('click', '.edit_announcement', function(e) {
  e.preventDefault();

  var $announcement = $(this).parents('div.announcement');

  $announcement.find('.announcement_show').slideUp();
  $announcement.find('.announcement_edit').slideDown();
});

$(document).on('click', '.delete_announcement', function(e) {
  e.preventDefault();

  if (confirm('¿Está seguro que desea eliminar la noticia?')) {
    $.ajax({
      url: '/announcements/' + id,
      type: 'DELETE',
      dataType: 'script'
    });
  }
});

$(document).on('click', '.cancel_edit_announcement', function(e) {
  e.preventDefault();

  var $announcement = $(this).parents('div.announcement');

  $announcement.find('.announcement_show').slideDown();
  $announcement.find('.announcement_edit').slideUp();
});