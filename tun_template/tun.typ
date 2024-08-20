#import "@preview/glossarium:0.4.1": make-glossary
#import "@preview/codly:1.0.0": *

#let config(
  author,
  title,
  chapters_numbering,
  pages_numbering,
  body
) = {
  // GENERAL DOCUMENT SETTINGS
  set document(author: author, title: title)
  show math.equation: set text(weight: 400)

  // PAGE & HEADING SETTINGS
  set page(margin: 1.1811in, numbering: pages_numbering, number-align: center)
  show heading: set block(above: 1.4em, below: 1em)
  show heading: set text(weight: "medium")
  set heading(numbering: (..nums) => nums.pos().map(str).join("."))
  show heading.where(level: 1): it => {
      stack(
          spacing: 2em,
          if it.numbering != none {
              align(center)[#text(size: 4.5em,fill: rgb(149, 0, 6),weight: "thin")[#counter(heading).display()]]
          },
          align(center)[#text(size:2em,it.body, weight: "thin")],
          []
      )
  }

  // TEXT SETTINGS
  set par(leading: 0.55em, justify: true)
  set text(font: "EB Garamond", size: 12pt, lang: myLang, hyphenate: false)
  show raw: set text(font: "JetBrains Mono", size: 9pt, lang: myLang)
  show par: set block(spacing: 1.25em)
  set par(leading: 0.75em)
  set list(indent: 9pt, body-indent: 9pt)
  set enum(indent: 9pt, body-indent: 9pt)

  // REF & IMAGES SETTINGS
  show ref: set text(fill: blue.darken(70%), weight: "medium")
  show figure.caption: set text(size: 10pt, font: "Optima")

  #show: codly-init.with()
  #show: make-glossary

  body
}

#let not_break(content) = {
  #block(content,breakable: false, width: 100%)
}
