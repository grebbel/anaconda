jQuery ->  
  $('.autoupdate').bind Anaconda.CONTENT_UPDATED_EVENT, (event, options = { }) ->
    interval = options.interval || 10 * 1000
    $(this).autoupdate( { interval: interval } )
