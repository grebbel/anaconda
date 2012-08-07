jQuery ->
  $('a[rel="external"]').on('click', ->
    window.open($(this).attr('href'))
    false
  )