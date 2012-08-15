jQuery.fn.autoupdate = (options = { }) ->

  # Defines the actual worker function
  updateAutomatically = ($e, options = { }) ->
    timeout = $e.data('timeout')    
    timeout.clear() if timeout
    url = $e.data('url') 
    url += '?' + $.address.queryString() if $.address.queryString()
    interval = options.interval || $e.data('interval')  
    if url && interval > 0      
      getPartial = ->
        $.get(url, { partial: $e.data('partial') })
          .success (response, message, xhr) =>
            eTag = xhr.getResponseHeader('ETag');
            if $e.data('eTag') != eTag
              $e.html($(response).html())
              Anaconda.AmplificationGraph.create(this)
              Anaconda.bootstrap.enhance(this)
              Anaconda.Tags.updateSelection(this)
              $e.data('eTag', eTag)
          .always ->
            $e.removeData('timeout')
            updateAutomatically($e) unless $e.data('suspended')
      if (options.immediate)
        getPartial()
      else
        timeout = $.timeout(interval).done(getPartial)
        $e.data('timeout', timeout)

  # Execute the worker function for each element
  $(this).each ->
    updateAutomatically($(this), options)
