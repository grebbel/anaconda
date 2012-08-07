class Anaconda.AmplificationGraph
  
  constructor: (@$e)->
    @analyses = [ $e.data('analysis') ]
    @url = $e.data('url')
    @aspectRatio = $e.data('aspectRatio')
    @$overlay = $('.overlay', $e)
    $(window).resize => this.update()
  
  # Graph ranges
    
  getCycleRange: -> new Anaconda.Range(1, 45)

  getValueRange: -> new Anaconda.Range(-1.0, 1.0)
  
  # Margins

  leftMargin: 30
  
  rightMargin: 10
  
  topMargin: 10

  bottomMargin: 20
  
  getWidth: -> @$e.innerWidth()
  
  getAvailableWidth: -> this.getWidth() - @leftMargin - @rightMargin
  
  getHorizontalRange: -> new Anaconda.Range(0, this.getAvailableWidth())
  
  getHeight: -> this.getWidth() / @aspectRatio
  
  getAvailableHeight: -> this.getHeight() - @bottomMargin - @topMargin
  
  getVerticalRange: -> new Anaconda.Range(0, this.getAvailableHeight())
    
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
  
  update: ->
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
    layer = this._createGraphLayer()
    @analyses.forEach (analysis) => 
      layer.add(this._createAmplificationLine(analysis))
      layer.add(this._createTresholdLine(analysis))
      if analysis.ct
        layer.add(this._createCtLine(analysis))
        #layer.add(this._createCtLabel(analysis))
        this._createCtLabel(analysis)
    layer
    
  _createAmplificationLine: (analysis) ->
    horizontalRange = this.getHorizontalRange()
    verticalRange = this.getVerticalRange()
    cycleRange = this.getCycleRange()
    valueRange = this.getValueRange()
    amplifications = { }
    analysis.amplifications.forEach (amplification) -> 
      amplifications[amplification.cycle] = amplification
    points = [ ]
    for cycle in [1..cycleRange.max]
      amplification = amplifications[cycle]
      x = cycleRange.map(cycle, horizontalRange)
      y = valueRange.map(amplification.delta_rn, verticalRange, true)
      points.push(x)
      points.push(y)
    new Kinetic.Line(
      points: points
      stroke: analysis.target.color
      strokeWidth: 2
    )
    
  _createTresholdLine: (analysis) ->
    y = this.getValueRange().map(analysis.treshold, this.getVerticalRange(), true)
    new Kinetic.Line(
      points: [0, y, this.getAvailableWidth(), y]      
      stroke: @treshold.stroke
      strokeWidth: @treshold.strokeWidth
      dashArray: @treshold.dashes
    )
    
  _createCtLine: (analysis) ->
    x = this.getCycleRange().map(analysis.ct, this.getHorizontalRange())
    new Kinetic.Line(
      points: [x, 0, x, this.getAvailableHeight()]
      stroke: @ct.line.stroke
      strokeWidth: @ct.line.strokeWidth
      dashArray: @ct.line.dashes
    )
    
  _createPopoverMarkup: (analysis) ->
    "
      <div class='ct'>
        <table>
          <tr>
            <th>CT:</th>
            <td>#{$.format.number(analysis.ct, '0.00')} (treshold: #{$.format.number(analysis.treshold, '0.00')})</td>
          </tr>
          <tr>
            <th>Assay:</th>
            <td>#{analysis.assay.name}</td>
          </tr>
        </table>
        <div class='buttons well'>
          <div class='clearfix'>
            <button class='btn btn-success positive'>Positive</button>
            <button class='btn btn-danger negative'>Negative</button>
          </div>
          <div class='clearfix'>
            <button class='btn btn-warning indeterminate'>Indeterminate</button>
          </div>
        </div>
      </div>
    "

  _createCtLabel: (analysis) ->
    cycleRange = this.getCycleRange()
    valueRange = this.getValueRange()
    x = cycleRange.map(analysis.ct, this.getHorizontalRange()) + @leftMargin
    y = valueRange.map(analysis.treshold, this.getVerticalRange(), true) + @topMargin    
    $ct = $("
      <span class='ct #{analysis.status || 'undecided'}'>
        <span class='caption'>#{$.format.number(analysis.ct, '0.00')}</span>
      </span>
    ")
    $ct.css('left', "#{x - 21}px").css('top', "#{y - 10}px")    
    popover = $ct.popover(
      trigger: 'manual'
      placement: 'bottom'
      title: analysis.target.name
      content: this._createPopoverMarkup(analysis)
    )
    popover.on 'click', -> console.log 'click!'
    $ct.click -> $ct.popover('show')
    @$overlay.append($ct)

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
    cycleRange.intervals(2).forEach (cycle) =>
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
    valueRange.intervals(0.2).forEach (value) =>
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
