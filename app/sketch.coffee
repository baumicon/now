define [], () ->
  class Sketch
    sketch: (p) =>
      p.setup = () =>
        p.size(1000, 650)

        @c = {
          x1: 100,
          y1: 100,
          w: 100,
          h: 100,
          rot: 0
        }

        p.fill(0)

      p.draw = () =>
        p.background(235)
        p.pushMatrix()
        p.translate(@c.x1+(@c.w/2), @c.y1+(@c.h/2))
        p.rotate(@c.rot)
        p.rect(-1*(@c.w/2), -1*(@c.h/2), @c.w, @c.h)
        p.popMatrix()

      p.touchtransform = (event) =>
        if event.position.x >= @c.x1 && event.position.x < @c.x1+@c.w && event.position.y >= @c.y1 && event.position.y < @c.y1+@c.h
          @c.w = 120 * event.scale
          @c.h = 120 * event.scale
          @c.x1 = event.position.x-(@c.w/2)
          @c.y1 = event.position.y-(@c.h/2)
          @c.rot = p.radians(event.rotation)

      p.touchdrag = (event) =>
        if event.position.x >= @c.x1 && event.position.x < @c.x1+@c.w && event.position.y >= @c.y1 && event.position.y < @c.y1+@c.h
          @c.x1 = event.position.x-(@c.w/2)
          @c.y1 = event.position.y-(@c.h/2)

