jQuery ->
  
  # Handles Analysis status input changes.
  $('.analyses input.status').live 'change', ->
    status = $(this).val()
    analysisId = $(this).data('analysisId')
    $(this).trigger(Anaconda.STATUS_CHANGED_EVENT, [
      analysisId: analysisId
      status: status
    ])  
  
  # Handles treshold input changes.
  $('.analyses input.treshold').live 'change', -> 
    treshold = Number($(this).val())
    $(this).attr('disabled', 'disabled')
    analysisId = $(this).data('analysisId')
    $(this).trigger(Anaconda.TRESHOLD_CHANGED_EVENT, [
      analysisId: analysisId
      treshold: treshold
    ])  

  # Handles treshold changes.
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

  # Handles CT calculations.
  $('body').on Anaconda.CT_CALCULATED_EVENT, (event, result) ->
    $("#analysis-#{result.analysisId}").each ->
      value = $.format.number(result.ct, '0.00') if result.ct
      $('input.ct', this).val(value)
      $('input.treshold', this).val($.format.number(result.treshold, '0.00')).attr('disabled', null)

  # Handles Analysis selection.
  $('body').on Anaconda.ANALYSIS_SELECTED_EVENT, (event, selected) ->
    $(".analyses #analysis-#{selected.analysisId} input.treshold").focus();


  $('form.analyses.results').live 'reset', ->
    $('.amplification-graph').each ->
      amplificationGraph = $(this).data('amplificationGraph')
      amplificationGraph.reset() if amplificationGraph