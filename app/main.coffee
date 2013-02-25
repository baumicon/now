require.config({
  paths: {
    'jquery': 'lib/jquery-1.9.1',
    'hammer': 'lib/hammer',
    'processing': 'lib/processing-1.4.1'
  },
  shim: {
    hammer: {
      exports: 'Hammer'
    },
    processing: {
      exports: 'Processing'
    }
  }
})

define([
  'jquery',
  'hammer'
  'processing'
  'sketch'
  ], ($, Hammer, Processing, Sketch) ->

  canvas = document.getElementById "main-canvas"
  hammer = new Hammer(canvas)
  sketch_obj = new Sketch()

  # TODO
  # load images to image cache

  #sketch = new Processing.Sketch(sketch_obj.sketch)
  sketch = sketch_obj.sketch

  #sketch.imageCache.add(image) for image in sketch_obj.images

  processing = new Processing(canvas, sketch)

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
