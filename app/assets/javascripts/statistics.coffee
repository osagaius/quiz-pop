$ ->
  $('#dashboard_products a').click = (e) ->
    e.preventDefault() 
    $(this).tab('show')