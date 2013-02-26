(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define([], function() {
    var Sketch;
    return Sketch = (function() {

      function Sketch() {
        this.sketch = __bind(this.sketch, this);
      }

      Sketch.prototype.sketch = function(p) {
        var _this = this;
        p.setup = function() {
          p.size(1000, 650);
          _this.c = {
            x1: 200,
            y1: 100,
            w: 100,
            h: 100,
            rot: 0
          };
          return p.fill(0);
        };
        p.draw = function() {
          p.background(225);
          p.pushMatrix();
          p.translate(_this.c.x1 + (_this.c.w / 2), _this.c.y1 + (_this.c.h / 2));
          p.rotate(_this.c.rot);
          p.rect(-1 * (_this.c.w / 2), -1 * (_this.c.h / 2), _this.c.w, _this.c.h);
          return p.popMatrix();
        };
        p.touchtransform = function(event) {
          if (event.position.x >= _this.c.x1 && event.position.x < _this.c.x1 + _this.c.w && event.position.y >= _this.c.y1 && event.position.y < _this.c.y1 + _this.c.h) {
            _this.c.w = 120 * event.scale;
            _this.c.h = 120 * event.scale;
            _this.c.x1 = event.position.x - (_this.c.w / 2);
            _this.c.y1 = event.position.y - (_this.c.h / 2);
            return _this.c.rot = p.radians(event.rotation);
          }
        };
        return p.touchdrag = function(event) {
          if (event.position.x >= _this.c.x1 && event.position.x < _this.c.x1 + _this.c.w && event.position.y >= _this.c.y1 && event.position.y < _this.c.y1 + _this.c.h) {
            _this.c.x1 = event.position.x - (_this.c.w / 2);
            return _this.c.y1 = event.position.y - (_this.c.h / 2);
          }
        };
      };

      return Sketch;

    })();
  });

}).call(this);
