jQuery ->
  $('form .association .remove').live('click', ->
    association = $(this).parent('.association')
    $(association).hide()
    $('input.destroy', association).val('true')
    return false
  )
  $('form .association .add').live('click', ->
    association = $(this).parent('.association')
    fragment = $('.template', association).clone().removeClass('template').show().html()
    id = new Date().getTime()
    regexp = new RegExp($(this).data('indexMarker'), 'g')
    fragment = $(fragment.replace(regexp, id))
    $('input:button', fragment).button()
    $(this).before(fragment)
    $('select:first,input:first', fragment)[0].focus()
    return false
  )

