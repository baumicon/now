define [], () ->
  class Sketch

    images: [
      'images/paper.jpg'
    ]

    sketch: (p) =>
      p.setup = () =>
        p.size(1000, 650)

        @img = p.loadImage(@images[0])

        @c = {
          scale: 1
          x1: 100,
          y1: 100,
          w: 500,
          h: 525,
          rot: 0
        }

        p.fill(40)

      p.draw = () =>
        p.background(255)

        p.pushMatrix()
        p.translate(@c.x1+250, @c.y1+262)
        p.scale(@c.scale/3)
        p.rotate(@c.rot)
        p.image(@img, -250, -262)
        p.rect(-250, -262, 250, 263)
        #p.rect(-250, -262, @c.w, @c.h)
        p.popMatrix()

      p.touchtransform = (event) =>
        if event.position.x >= @c.x1 && event.position.x < @c.x1+@c.w && event.position.y >= @c.y1 && event.position.y < @c.y1+@c.h
          @c.scale = event.scale
          @c.h = 120 * event.scale
          @c.x1 = event.position.x-(@c.w/2)
          @c.y1 = event.position.y-(@c.h/2)
          @c.rot = p.radians(event.rotation)

      p.touchdrag = (event) =>
        if event.position.x >= @c.x1 && event.position.x < @c.x1+@c.w && event.position.y >= @c.y1 && event.position.y < @c.y1+@c.h
          @c.x1 = event.position.x-(@c.w/2)
          @c.y1 = event.position.y-(@c.h/2)

  return Sketch
