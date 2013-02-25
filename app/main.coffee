define([
  'lib/requires/req_jquery',
  'lib/requires/req_hammer'
  'lib/requires/req_processing'
  'current/sketch'
  ], ($, Hammer, Processing, Sketch) ->

  canvas = document.getElementById "main-canvas"
  hammer = new Hammer(canvas)
  sketch_obj = new Sketch()
  #sketch = new Processing.Sketch(sketch_obj.sketch)
  sketch = sketch_obj.sketch

  # load images to image cache
#  sketch.imageCache.add(image) for image in sketch_obj.images

  processing = new Processing(canvas, sketch)

  debugger

  hammer.ondragstart = processing.touchdragstart || undefined
  hammer.ondrag = processing.touchdrag || undefined
  hammer.ondragend = processing.touchdradend || undefined
  hammer.onswipe = processing.touchswipe || undefined
  hammer.ontap = processing.touchtap || undefined
  hammer.ondoubletap = processing.touchdoubletap || undefined
  hammer.onhold = processing.touchhold || undefined
  hammer.ontransformstart = processing.touchtransformstart || undefined
  hammer.ontransform = processing.touchtransform || undefined
  hammer.ontransformend = processing.touchtransformend || undefined
  hammer.onrelease = processing.touchrelease || undefined
)
