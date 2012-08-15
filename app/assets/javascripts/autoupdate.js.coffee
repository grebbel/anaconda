jQuery ->  
  $('.autoupdate').bind Anaconda.CONTENT_UPDATED_EVENT, (event, options = { }) ->
    interval = options.interval || 10 * 1000
    $(this).autoupdate( { interval: interval } )

  $('.autoupdate').on 'autoupdate', ->
    Anaconda.AmplificationGraph.create($(this))
    Anaconda.bootstrap.enhance($(this))
    Anaconda.Tags.updateSelection($(this))
