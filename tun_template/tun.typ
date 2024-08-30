#import "@preview/glossarium:0.4.1": make-glossary
#import "@preview/codly:1.0.0": *


#let not_break(content) = {
  block(content,breakable: false, width: 100%)
}

#let pb() = {
  pagebreak(to: "odd")
}


#let config(
  myAuthor: "Name Surname",
  myTitle: "Title",
  myLang: "en",
  pages_numbering: "1",
  creation_day: "NaN",
  creation_month: "NaN",
  creation_year: "NaN",
  associated_with: "nothing",
  digital: true,
  use_glossary: true,
  use_bibliography: true,
  body
) = {

  // GENERAL DOCUMENT SETTINGS
  set document(author: myAuthor, title: myTitle, date: datetime(day:int(creation_day), month: int(creation_month), year: int(creation_year)))
  show math.equation: set text(weight: 400)

  // PAGE & HEADING SETTINGS
  set page(margin: 1.1811in, number-align: center)
  show heading: set block(above: 1.4em, below: 1em)
  show heading: set text(weight: "medium")
  set heading(numbering: (..nums) => nums.pos().map(str).join("."))
  show heading.where(level: 1): it => {
      pagebreak()
      stack(
          spacing: 2em,
          if it.numbering != none {
              align(center)[#text(size: 4.5em,fill: rgb(149, 0, 6),weight: "thin")[#counter(heading).display()]]
          },
          align(center)[#text(size:2em,it.body, weight: "thin")],
          []
      )
  }
  let bgcolor = white
  if(digital){
    bgcolor = rgb(255, 241, 214)
  }
  set page(fill: bgcolor)

  // TEXT SETTINGS
  set par(leading: 0.55em, justify: true)
  show raw: set text(font: "JetBrains Mono", size: 9pt, lang: myLang)
  show par: set block(spacing: 1.25em)
  set par(leading: 0.75em)
  set list(indent: 9pt, body-indent: 9pt)
  set enum(indent: 9pt, body-indent: 9pt)
  set text(font: "EB Garamond", size: 12pt, lang: myLang, hyphenate: false)
  let color = luma(0)
  if(digital){
    color = luma(50)
  }
  show: set text(color)

  // REF & IMAGES SETTINGS
  show ref: set text(fill: blue.darken(70%), weight: "medium")
  show figure.caption: set text(size: 10pt, font: "Optima")

  // DEPENDENCIES SETTINGS
  show: codly-init.with()
  codly(number-format: none, zebra-fill: none, display-icon: false,stroke: none, fill: rgb(255, 248, 235),lang-outset: (x:-2pt,y:5pt))
  if(not digital){
    codly(stroke: 0.1pt + black, fill: white,lang-outset: (x:-2pt,y:5pt),default-color: white, lang-stroke: 0.1pt + black)
  }
  show: make-glossary

  // FIRST PAGE SETTINGS
  set page(numbering: none)
  grid(
      columns: (auto),
      rows: (40pt, 1fr, 20pt),
      // Heading
      [
        #align(center,stack(dir: ttb,
          text(18pt, weight: "light", smallcaps("author")),
          v(11pt),
          text(18pt, weight: "medium", myAuthor)
        ))
      ],
      // Body
      [
        #align(horizon+center,text(40pt, weight: "medium",myTitle))
        #align(horizon+center,text(18pt, weight: "light", smallcaps("associated with")))
        #align(horizon+center,text(20pt, weight: "medium", associated_with))
        #v(240pt)
      ],
      // Footer
      [
          #line(length: 100%)
          #align(center, text(12pt, weight: 400, smallcaps("created: " + creation_day + "/" + creation_month + "/" + creation_year)))
          #align(center, text(12pt, weight: 400, smallcaps("last change: " + datetime.today().display("[day]/[month]/[year]"))))
      ]
  )

  // INDEX SETTINGS
  show outline.entry.where(level: 1): it => {
    linebreak()
    link(it.element.location(), strong(it.body))
    h(1fr)
    link(it.element.location(), strong(it.page))
  }
  outline(
    indent: auto,
    depth: 5
  )

  // PAGE NUMBERINGS FOR THE BODY SETTINGS
  set page(numbering: pages_numbering)
  counter(page).update(1)

  body

  // APPENDIX SETTINGS
  set page(numbering: none)
  if(use_glossary){
    include "./appendix/glossary.typ"
  }
  if(use_bibliography){
    include "./appendix/bibliography.typ"
  }
}
