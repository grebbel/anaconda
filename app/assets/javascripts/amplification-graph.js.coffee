jQuery ->  
  # We must wrap this in another document.ready call because the <div>'s measurements are not available right away.
  # This seems to happen with a fluid layout.  
  $(document).ready ->
    $('.amplification-graph').each ->    
      amplificationChart = new Anaconda.AmplificationGraph($(this))
      amplificationChart.update()      
