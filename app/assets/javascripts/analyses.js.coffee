jQuery ->
  
  $('.analyses input.status').live 'change', ->
    status = $(this).val()
    analysisId = $(this).data('analysisId')
    $(this).trigger(Anaconda.STATUS_CHANGED_EVENT, [
      analysisId: analysisId
      status: status
    ])  
  
  $('.analyses input.treshold').live 'change', -> 
    treshold = Number($(this).val())
    analysisId = $(this).data('analysisId')
    $(this).trigger(Anaconda.TRESHOLD_CHANGED_EVENT, [
      analysisId: analysisId
      treshold: treshold
    ])  
    
  $('body').on Anaconda.TRESHOLD_CHANGED_EVENT, (event, calculation) ->
    ctCalculations = [
      analysis_id: calculation.analysisId
      treshold: calculation.treshold
    ]
    Anaconda.api.calculateCt(ctCalculations).done (results) ->
      results.forEach (result) ->
        $('body').trigger(Anaconda.CT_CALCULATED_EVENT, {
          analysisId: result.analysis_id
          treshold: result.treshold
          ct: result.ct
        })

  $('body').on Anaconda.CT_CALCULATED_EVENT, (event, result) ->
    selector = "tr#analysis-#{result.analysisId} td.ct"
    if result.ct
      $(selector).text($.format.number(result.ct, '0.00'))
    else
      $(selector).text('')
      
  $('body').on Anaconda.ANALYSIS_SELECTED_EVENT, (event, selected) ->
    $(".analyses #analysis-#{selected.analysisId} input.treshold").focus();
