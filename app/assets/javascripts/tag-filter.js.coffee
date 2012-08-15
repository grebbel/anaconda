jQuery ->
  
  # Handles the selection of tag items in the sidebar.
  # Updates the address accordingly
  $('a.tag').live 'click', (event) ->    
    event.preventDefault()
    selection = $(this).parent('li').toggleClass('active').parent('ul').children('li.active').children('a.tag')
    tags = [ ]
    selection.each -> tags.push($(this).data('name'))
    $.address.parameter('tags', tags.join(','))
      
  $.address.change -> Anaconda.Tags.updateSelection()
