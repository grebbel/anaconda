// Define namespace.
var KineticExtensions = {}

/* 
  Kinetic.Shape subclass that draws a smooth line using spline interpolation.
  This class also allows for defining a clipping region.
*/
KineticExtensions.SmoothLine = Kinetic.Shape.extend({
  
  init: function(config) {
      this.setDefaultAttrs({
          points: [],
          lineCap: 'butt',
          dashArray: [],
          detectionType: 'pixel'
      });
      this.shapeType = "SmoothLine";
      config.drawFunc = this.drawFunc;
      this.clippingRegion = config.clippingRegion;
      this.tension = config.tension || 0.5;
      this._super(config);
  },
  
  _setClippingRegion: function(context) {
    var points = this.clippingRegion;    
    if (Object.prototype.toString.apply(points) === '[object Array]' && points.length == 4) {      
      context.beginPath();
      context.rect(points[0], points[1], points[2], points[3]);
      context.clip();
    }
  },
  
  /* Converts the points structure used by KineticJS to the format used by the context.drawSpline() function. */
  _getSplinePoints: function() {
    var points = [ ]
    for (var i = 0; i < this.attrs.points.length; i++) {
      points.push(this.attrs.points[i].x);
      points.push(this.attrs.points[i].y);
    }
    return points;
  },
  
  drawFunc: function(context) {
    context.lineWidth = this.getStrokeWidth() || 2;
    context.strokeStyle = this.getStroke() || 'black';
    if (this.clippingRegion) {
      context.save();
      this._setClippingRegion(context);
      context.drawSpline(this._getSplinePoints(), this.tension);
      context.restore();
    } else {
      context.drawSpline(this._getSplinePoints(), this.tension);
    }
  }

});
