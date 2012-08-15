Anaconda.Tags = { }
  
Anaconda.Tags.updateSelection = ($e) ->
  $e ||= $
  tags = $.address.parameter('tags')
  tags ||= ''
  tags = tags.split(',')
  $('a.tag').each ->
    $li = $(this).parent('li')
    if $(this).data('name') in tags
      $li.addClass('active') 
    else
      $li.removeClass('active') 
