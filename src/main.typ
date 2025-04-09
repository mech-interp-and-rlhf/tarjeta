#import "@preview/cetz:0.3.4"
#import "@preview/tiaoma:0.3.0": qrcode

#set page(width: auto, height: auto, margin: 0.5cm)
#let length = 1cm

#cetz.canvas({
  import cetz.draw
let spacing = 0.3
let width   = 4
let h-offset = width + 1.6*spacing
let height  = 5.5
let radius  = 0.5
  let left-color   = rgb("d3ede0")
  let middle-color = rgb("ffe1bb")
  let right-color  = rgb("eddfec")

  let info-rect = (pos, title, url, img: none, tint, ..args) => {
    draw.rect(
      (rel: (-width/2, -height/2), to: pos),
      (rel: (width,     height)),
      stroke: none,
      radius: radius,
      fill:   tint,
      ..args,
    )
    let inner-size = width - 2*spacing
    draw.rect(
      (rel: (-inner-size/2, -inner-size/2), to: pos),
      (rel: (inner-size, inner-size)),
      stroke: none,
      radius: radius,
      fill:   tint.lighten(80%),
    )
    draw.content(
      (pos.at(0), pos.at(1) + 0.39*height),
      text(size: 0.6*length, weight: "bold", fill: tint.darken(80%), title),
    )
    let qr-size = inner-size - 2*spacing
    draw.content(pos, scale(x: qr-size*length, y: qr-size*length, qrcode(
      url,
      options:(
        fg-color: tint.darken(80%),
        // Can't have option-1 too at the same time.
        option-2: 4,
      ))))
    if img != none {
      draw.content(pos, {
        let svg-content = read(img)
        let colored-svg = svg-content
        .replace(
          "#000000",
          tint.darken(80%).to-hex(),
        )
        .replace(
          "#ffffff",
          tint.lighten(50%).to-hex(),
        )
        image(bytes(colored-svg), height: length)
      })
    }
  }

  info-rect(
    (-h-offset, 0),
    [Diapositivas],
    "mech-interp-and-rlhf.github.io/presentacion1",
    left-color,
    img: "document-svgrepo-com-edit.svg",
  )

  info-rect(
    (0, 0),
    [Código],
    "github.com/mech-interp-and-rlhf/mech-interp",
    middle-color,
    img: "github.svg",
  )

  info-rect(
    (h-offset, 0),
    [Sitio Web],
    "mech-interp-and-rlhf.github.io/mech-interp",
    right-color,
    img: "web-internet-online-network-seo-svgrepo-com.svg",
  )

})
