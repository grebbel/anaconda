jQuery ->
  $('select.page-size').live('change', ->
    if window.location.search
      window.location = window.location + '&page_size=' + $(this).val() 
    else
      window.location = window.location + '?page_size=' + $(this).val()       
  )