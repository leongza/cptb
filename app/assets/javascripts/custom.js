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
$(function() {  
  $( "#sortable" ).sortable({
    axis: 'x',        
    placeholder: "ui-sortable-placeholder"   
  });
  $('.switch').on('switch-change', function (e, data) {
    $(this).parents('form').submit();
//      var $el = $(data.el)
  //      , value = data.value;
    //  console.log(e, $el, value);
      //$.ajax({
//        url: this.href,
  //      type: "put",
    //    dataType: "json",
      //  data: {"verified":value}
//      });
  });
});
