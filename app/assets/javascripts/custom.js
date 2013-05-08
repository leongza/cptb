$(function () {
  
  // Search form.
//$('#cops_search input').keyup(function () {
//  $.get($('#cops_search').attr('action'), 
//    $('#cops_search').serialize(), null, 'script');
//  return false;
//});
  $('#cops th a, #cops .pagination a').on('click', function () {
    $.getScript(this.href);
    return false;
  });
});
