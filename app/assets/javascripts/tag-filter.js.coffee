jQuery ->
  
  # Handles the selection of tag items in the sidebar.
  # Updates the address accordingly
  $('a.tag').live 'click', (event) ->    
    event.preventDefault()
    selection = $(this).parent('li').toggleClass('active').parent('ul').children('li.active').children('a.tag')
    tags = [ ]
    selection.each -> tags.push($(this).data('name'))
    $.address.autoUpdate(false)
    $.address.parameter('page', 1)
    $.address.autoUpdate(true)
    $.address.parameter('tags', tags)
      
  $.address.change -> Anaconda.Tags.updateSelection()
