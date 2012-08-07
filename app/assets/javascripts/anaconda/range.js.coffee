class Anaconda.Range
  
  constructor: (@min, @max) ->
    
  intervals: (interval, precision = 2)->
    intervals = [ ]
    value = @min
    while value <= @max
      value = Math.round(value * Math.pow(10, precision)) / Math.pow(10, precision)
      intervals.push(value)
      value += interval
    intervals

  range: -> @max - @min
  
  map: (value, range, invert = false) ->
    y = (Math.abs(range.max - range.min) * ((value - @min) / Math.abs(@max - @min)))
    if invert
      range.max - y
    else
      range.min + y
