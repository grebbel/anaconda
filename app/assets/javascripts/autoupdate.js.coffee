jQuery ->
  updateAutomatically = ($e, options = { immediate: false })->
    url = $e.data('url')
    interval = options.interval || $e.data('interval')
    if url && interval > 0      
      getPartial = ->
        $.get(url, { partial: $e.data('partial') })
          .success (response, message, xhr) ->
            eTag = xhr.getResponseHeader('ETag');
            if $e.data('eTag') != eTag
              $e.html($(response).html())
              $('.amplification-graph', $e).each ->    
                amplificationChart = new Anaconda.AmplificationGraph($(this))
                amplificationChart.update()      
              Anaconda.bootstrap.enhance($e)
              $e.data('eTag', eTag)
          .always ->
            $e.removeData('timeout')
            updateAutomatically($e) unless $e.data('suspended')
      if (options.immediate)
        getPartial()
      else
        timeout = $.timeout(interval).done getPartial
        $e.data('timeout', timeout)
  
  $('.autoupdate').each -> 
    updateAutomatically($(this), { immediate: $(this).data('immediate') })
    # When content within this fragment is updated, clear the current timeout timeout and delay the next update.
    $(this).bind Anaconda.CONTENT_UPDATED_EVENT, (event, options) =>
      timeout = $(this).data('timeout')
      if timeout
        timeout.clear() 
        $(this).removeData('timeout')
      updateAutomatically($(this), { interval: 10 * 1000 } )
