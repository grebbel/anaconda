class Anaconda.AmplificationPlot
  
  ct:
    label:
      fill: '#ffffff'
      stroke: '#202020'
      strokeWidth: 0.5
    line:
      stroke: '#202020'
      strokeWidth: 1
      dashes: [4, 2]

  treshold:
    stroke: '#202020'
    strokeWidth: 1
    dashes: [4, 2]
  
  constructor: (@graph, @analysis) ->
    @layer = @graph.amplificationLayer    
    @$overlay = @graph.$overlay
    @group = new Kinetic.Group()
    $('body').on Anaconda.CT_CALCULATED_EVENT, (event, result) =>
      return unless result.analysisId == @analysis.id
      @analysis.ct = result.ct
      @analysis.treshold = result.treshold
      this._displayTreshold()
      this._displayCt(true)
      @graph.stage.draw()
    $('body').on Anaconda.STATUS_CHANGED_EVENT, (event, change) =>
      return unless change.analysisId == @analysis.id
      @analysis.status = change.status
      this._displayCt(true)
      @graph.stage.draw()
            
  update: ->
    this._createAmplificationLine()
    this._displayTreshold()
    this._displayCt() if @analysis.ct
    
  _createAmplificationLine: ->
    horizontalRange = @graph.getHorizontalRange()
    verticalRange = @graph.getVerticalRange()
    cycleRange = @graph.getCycleRange()
    valueRange = @graph.getValueRange()
    amplifications = { }
    @analysis.amplifications.forEach (amplification) -> 
      amplifications[amplification.cycle] = amplification
    points = [ ]
    for cycle in [1..cycleRange.max]
      amplification = amplifications[cycle]
      continue unless amplification
      x = cycleRange.map(cycle, horizontalRange)
      y = valueRange.map(amplification.delta_rn, verticalRange, true)
      points.push(x)
      points.push(y)
    @group.add(new KineticExtensions.SmoothLine(
      points: points
      clippingRegion: [0, 0, @graph.getAvailableWidth(), @graph.getAvailableHeight()]
      stroke: @analysis.target.color
      strokeWidth: 2
    ))

  _displayTreshold:  ->
    unless @tresholdLine
      @tresholdLine = new Kinetic.Line(
        points: [0, 0, @graph.getAvailableWidth(), 0]
        stroke: @treshold.stroke
        strokeWidth: @treshold.strokeWidth
        dashArray: @treshold.dashes
      )
      @layer.add(@tresholdLine)
    y = @graph.getValueRange().map(@analysis.treshold, @graph.getVerticalRange(), true)
    @tresholdLine.setY(y)

  _displayCt: (focus = false)->
    if @analysis.ct
      unless @ctLine
        @ctLine = new Kinetic.Line(
          points: [0, 0, 0, @graph.getAvailableHeight()]
          stroke: @ct.line.stroke
          strokeWidth: @ct.line.strokeWidth
          dashArray: @ct.line.dashes
        )
        @layer.add(@ctLine)
      x = @graph.getCycleRange().map(@analysis.ct, @graph.getHorizontalRange())
      @ctLine.setX(x)
    else 
      if @ctLine
        @layer.remove(@ctLine)
        @ctLine = null
    this._displayCtLabel(focus)

  _displayCtLabel: (focus = false)->
    if @analysis.ct
      cycleRange = @graph.getCycleRange()
      valueRange = @graph.getValueRange()
      horizontalRange = @graph.getHorizontalRange()
      x = cycleRange.map(@analysis.ct, horizontalRange) + @graph.leftMargin
      y = valueRange.map(@analysis.treshold, @graph.getVerticalRange(), true) + @graph.topMargin    
      unless @$ctLabel
        @$ctLabel = $("
          <span class='ct'>
            <span class='caption'></span>
          </span>
        ")
        @$overlay.append(@$ctLabel)
      @$ctLabel.removeClass('negative', 'positive', 'indeterminate', 'undecided').addClass(@analysis.status || 'undecided')
      $('span.caption', @$ctLabel).text($.format.number(@analysis.ct, '0.00'))      
      @$ctLabel.css('left', "#{x - 21}px").css('top', "#{y - 10}px")
      $('span.ct', @$overlay).css('z-index', 0);      
      @$ctLabel.css('z-index', 1) if focus
      @$ctLabel.show()
      @$ctLabel.mouseover ->
        $('span.ct', @$overlay).css('z-index', 0);      
        $(this).css('z-index', 1)
      @$ctLabel.click (event) => $(event.target).trigger(Anaconda.ANALYSIS_SELECTED_EVENT, { analysisId: @analysis.id })
      @$ctLabel.popover(
        content: this._popoverContent()
        placement: 'bottom'
        title: @analysis.target.name
      )
    else
      @$ctLabel.hide() if @$ctLabel      
  
  _popoverContent: ->
      "
      <div class='ct'>
        <table>
          <tr>
            <th>CT</th>
            <td>#{$.format.number(@analysis.ct, '0.00')}</td>
          </tr>
          <tr>
            <th>Treshold</th>
            <td>#{$.format.number(@analysis.treshold, '0.00')}</td>
          </tr>
          <tr>
            <th>Assay</th>
            <td>#{@analysis.assay.name}</td>
          </tr>
        </table>                
      </div>
    "
    