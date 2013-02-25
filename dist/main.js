(function() {

  define(['lib/requires/req_jquery', 'lib/requires/req_hammer', 'lib/requires/req_processing', 'current/sketch'], function($, Hammer, Processing, Sketch) {
    var canvas, hammer, processing, sketch, sketch_obj;
    canvas = document.getElementById("main-canvas");
    hammer = new Hammer(canvas);
    sketch_obj = new Sketch();
    sketch = sketch_obj.sketch;
    processing = new Processing(canvas, sketch);
    debugger;
    hammer.ondragstart = processing.touchdragstart || void 0;
    hammer.ondrag = processing.touchdrag || void 0;
    hammer.ondragend = processing.touchdradend || void 0;
    hammer.onswipe = processing.touchswipe || void 0;
    hammer.ontap = processing.touchtap || void 0;
    hammer.ondoubletap = processing.touchdoubletap || void 0;
    hammer.onhold = processing.touchhold || void 0;
    hammer.ontransformstart = processing.touchtransformstart || void 0;
    hammer.ontransform = processing.touchtransform || void 0;
    hammer.ontransformend = processing.touchtransformend || void 0;
    return hammer.onrelease = processing.touchrelease || void 0;
  });

}).call(this);
