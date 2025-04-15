#import "@preview/cetz:0.3.4"

// Define margin and canvas size
#let margin = 0.5
#let canvas-width = 12.96
#let canvas-height = 5.5

// The total page size includes margins on both sides
#set page(
  width: (canvas-width + 2 * margin) * 1cm,
  height: (canvas-height + 2 * margin) * 1cm,
  margin: margin * 1cm
)

#let width = canvas-width
#let height = canvas-height

#let length = 1cm

#let spacing = 0.3
#let h-offset = width + 1.6*spacing
#let radius  = 0.5

#let front-blue = rgb("183a5a") // dark blue for text

#set text(fill: front-blue)

#cetz.canvas(
  length: length,
  {
    import cetz.draw


    // Draw 4 small filled circles (dots) at the corners
    let dot-radius = 0.0
    let dot-color = gray
    draw.circle((0, 0), radius: dot-radius, fill: dot-color, stroke: none)
    draw.circle((width, 0), radius: dot-radius, fill: dot-color, stroke: none)
    draw.circle((0, -height), radius: dot-radius, fill: dot-color, stroke: none)
    draw.circle((width, -height), radius: dot-radius, fill: dot-color, stroke: none)

    // Move origin to top-left: y increases downward, allow negative y
    let text-x = 0.5 // horizontal padding in cm from left edge of canvas
    let text-top-pad = 0.7 // vertical padding in cm from top edge of canvas
    let text-y = -text-top-pad
    let text-gap = 1.5 // increased gap for more vertical separation

    draw.content((text-x, text-y), anchor: "north-west", text(size: 0.75cm, weight: "bold", "Interpretabilidad Mecanicista"))
    draw.content((text-x, text-y - text-gap), anchor: "north-west", text(size: 0.55cm, weight: "bold", "Parte 1: Autoencoders Dispersos"))
    draw.content((text-x, text-y - 2*text-gap), anchor: "north-west", text(size: 0.38cm, weight: "regular", "mech-interp-and-rlhf.github.io/mech-interp"))

    // Place crewmate.png image at 85% horizontally and vertically centered on the CANVAS
    let image-x = 0.85 * width
    let image-y = -height / 2
    draw.content(
      (image-x, image-y),
      image("crewmate.png", height: 3cm),
      anchor: "center"
    )
  }
)

