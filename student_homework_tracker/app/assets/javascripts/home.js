var when_page_is_loaded = function() {

  $('#myTab a').click(function (e) {
    console.log("hi");
    e.preventDefault()
    $(this).tab('show')
  })
  
  $("#myTab a:first").click()  

  $("div.accordion").accordion({
  })

  $("#accordion").accordion({collapsible: true, active: false });

};

$(document).ready(when_page_is_loaded);
$(document).on("page:load", when_page_is_loaded);