jQuery ->  
  # Intercepts pagination links and populates the address accordingly.
  # Only works for autoupdate sections.
  $('.autoupdate .pagination a').live 'click', (event) ->
    event.preventDefault()
    query = $(this).attr('href').split(/\?/)[1]
    $.address.queryString(query)
