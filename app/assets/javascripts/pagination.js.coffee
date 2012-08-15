jQuery ->
  
  # Intercepts pagination links and populates the address accordingly.
  $('.pagination a').live 'click', (event) ->
    event.preventDefault()
    query = $(this).attr('href').split(/\?/)[1]
    $.address.queryString(query)
