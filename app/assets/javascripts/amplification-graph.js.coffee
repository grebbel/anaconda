jQuery ->  
  # We must wrap this in another document.ready call because the <div>'s measurements are not available right away.
  # This seems to happen with a fluid layout.  
  $(document).ready -> Anaconda.AmplificationGraph.create($(this))
