class Anaconda.Bootstrap
  constructor: ->
    @popoverOptions = 
      delay: 1000
      animation: true
      placement: 'right'
    
    
  popover: ($e)-> 
    $('.has-popover', $e).popover(@popoverOptions).on 'click', -> $(this).popover('hide')
    
  enhance: ($e)->
    @popover($e)
    
Anaconda.bootstrap = new Anaconda.Bootstrap