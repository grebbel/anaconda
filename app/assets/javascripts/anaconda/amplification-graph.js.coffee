class Anaconda.AmplificationGraph
  
  constructor: (@$e)->
    @analyses = $e.data('analyses')
    $e.data('amplificationGraph', this)
    @url = $e.data('url')
    @aspectRatio = $e.data('aspectRatio')
    @$overlay = $('.overlay', $e)
    @analyses.forEach (analysis) ->
      treshold =  analysis.treshold
      status = analysis.status
      ct = analysis.ct      
      analysis.reset = ->
        this.treshold = treshold
        this.status = status
        this.ct = ct        

  # Margins

  leftMargin: 30

  rightMargin: 10

  topMargin: 10

  bottomMargin: 20

  # Dimensions

  getWidth: -> @$e.innerWidth()

  getHeight: -> this.getWidth() / @aspectRatio

  getAvailableWidth: -> this.getWidth() - @leftMargin - @rightMargin

  getAvailableHeight: -> this.getHeight() - @bottomMargin - @topMargin

  getHorizontalRange: -> new Anaconda.Range(0, this.getAvailableWidth())

  getVerticalRange: -> new Anaconda.Range(0, this.getAvailableHeight())

  # Graph ranges
  
  getMaxCycle: ->
    return @maxCycle if @maxCycle
    maxCycle = 0
    @analyses.forEach (analysis)-> 
      if analysis.amplifications
        maxCycle = analysis.amplifications.length if analysis.amplifications.length > maxCycle
    @maxCycle = maxCycle
      
    
  getCycleRange: -> new Anaconda.Range(1, this.getMaxCycle())
    
  defaultValueRange: -> new Anaconda.Range(0, 1.9)
  
  valueRangeMargin: 0.1

  getValueRange: -> 
    @valueRange = this._determineValueRange() unless @valueRange
    @valueRange
  
  # Formatting
    
  grid:
    stroke: '#909090'
    strokeWidth: 0.5
    dashes: [1, 1]
  
  axis:
    stroke: '#202020'
    strokeWidth: 1
    dashes: []

  font:
    family: $('body').css('font-family')
    size: 10
    fill: '#202020'
    
  # Main operations
  
  draw: ->
    this._update()
    $.resize.delay = 1000
    @$e.resize => this._update()
    
  reset: ->
    @analyses.forEach (analysis) ->
      analysis.reset()
    this._update()
  
  # Utility operations
  
  _update: ->
    if not @stage
      @stage = new Kinetic.Stage(
        container: @$e[0]
      )
    @stage.setSize(this.getWidth(), this.getHeight())
    @stage.removeChildren();
    @$overlay.html('')
    @stage.add(this._createGridLayer())
    @stage.add(this._createAmplificationLayer())
    @stage.add(this._createCycleLegendLayer())
    @stage.add(this._createValueLegendLayer())
    @stage.add(this._createAxesLayer())
    
  _determineValueRange: -> 
    range = this.defaultValueRange()
    @analyses.forEach (analysis)-> 
      if analysis.amplifications
        analysis.amplifications.forEach (amplification) ->
          value = amplification.delta_rn
          range.min = value if value < range.min
          range.max = value if value > range.max
    range.min = (Math.round(range.min * 10) / 10) - @valueRangeMargin
    range.max = (Math.round(range.max * 10) / 10) + @valueRangeMargin
    range
    
  # Drawing operations  
  
  _createGraphLayer: ->
    new Kinetic.Layer(
      x: @leftMargin
      y: @topMargin
      width: this.getAvailableWidth()
      height: this.getAvailableHeight()
    )

  _createGridLayer: ->
    layer = this._createGraphLayer()
    verticalRange = this.getVerticalRange()
    valueRange = this.getValueRange()
    intervals = valueRange.intervals(0.1, 1)
    intervals.splice(1, intervals.length).forEach (value, index) =>
      y = valueRange.map(value, verticalRange, true)
      layer.add(new Kinetic.Line(
        points: [0, y, this.getAvailableWidth(), y],
        stroke: @grid.stroke,
        strokeWidth: @grid.strokeWidth
        dashArray: @grid.dashes
      ))
    horizontalRange = this.getHorizontalRange()
    cycleRange = this.getCycleRange()
    for cycle in [2..cycleRange.max]
      x = cycleRange.map(cycle, horizontalRange)
      layer.add(new Kinetic.Line(
        points: [x, 0, x, this.getAvailableHeight()],
        stroke: @grid.stroke,
        strokeWidth: @grid.strokeWidth
        dashArray: @grid.dashes
      ))    
    @gridLayer = layer

  _createAmplificationLayer: ->
    @amplificationLayer = this._createGraphLayer()
    analyses = @analyses.filter (analysis) -> analysis.amplifications
    analyses.forEach (analysis) =>
      plot = new Anaconda.AmplificationPlot(this, analysis)
      plot.update();
      @amplificationLayer.add(plot.group)
    @amplificationLayer
    

  _createCycleLegendLayer: ->
    layer = new Kinetic.Layer(
      x: @leftMargin
      y: this.getHeight() - @bottomMargin + 6
      width: this.getAvailableWidth()
      height: @bottomMargin
    )    
    cycleRange = this.getCycleRange()
    horizontalRange = this.getHorizontalRange()
    intervals = cycleRange.intervals(2)
    cycleRange.intervals(1).forEach (cycle) =>
      x = cycleRange.map(cycle, horizontalRange)
      width = Math.floor((horizontalRange.range() * 1.0 / intervals.length))
      text = new Kinetic.Text(
        x: x - (width / 2)
        y: 0
        text: String(cycle)
        width: width
        fontSize: @font.size
        fontFamily: @font.family
        textFill: @font.fill
        align: "center"
      )
      layer.add(text)
    layer
    
  _createValueLegendLayer: ->
    layer = new Kinetic.Layer(
      x: 0
      y: @topMargin
      width: @leftMargin
      height: this.getAvailableHeight()
    )
    valueRange = this.getValueRange()
    verticalRange = this.getVerticalRange()
    valueRange.intervals(0.1).forEach (value) =>
      y = valueRange.map(value, verticalRange, true)
      text = new Kinetic.Text(
        x: 0
        y: y - (@font.size / 2)
        text: $.format.number(value, '0.0')
        width: @leftMargin - 6
        fontSize: @font.size
        fontFamily: @font.family
        textFill: @font.fill
        align: "right"
      )
      layer.add(text)
    layer

  _createAxesLayer: ->
    layer = this._createGraphLayer()
    # Value axis
    layer.add(new Kinetic.Line(
      points: [0, 0, 0, this.getAvailableHeight()]
      stroke: @axis.stroke,
      strokeWidth: @axis.strokeWidth
      lineCap: 'square'
      dashArray: @axis.dashes
    ))
    # Cycle axis
    layer.add(new Kinetic.Line(
      points: [0, this.getAvailableHeight(), this.getAvailableWidth(), this.getAvailableHeight()]
      stroke: @axis.stroke,
      strokeWidth: @axis.strokeWidth
      lineCap: 'square'
      dashArray: @axis.dashes
    ))

Anaconda.AmplificationGraph.create = ($e) ->
  $('.amplification-graph', $e).each ->
    amplificationChart = new Anaconda.AmplificationGraph($(this))
    amplificationChart.draw()
