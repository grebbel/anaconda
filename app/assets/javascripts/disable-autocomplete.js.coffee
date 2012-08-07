# Disables autocomplete for every input text field by default
jQuery ->
  $('input:text').each(->
    if not $(this).attr('autocomplete')
      $(this).attr('autocomplete', 'off')
  )