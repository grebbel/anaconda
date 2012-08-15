jQuery ->
  $('select.page-size').live 'change', ->
    window.location = $.address.baseURL() + '?page_size=' + $(this).val()