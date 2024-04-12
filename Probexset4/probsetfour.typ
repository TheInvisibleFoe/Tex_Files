#import "@preview/ctheorems:1.1.2": * 
#show: thmrules

#import "notes.typ"

#set rect(height: 0em)

#set page(
    paper: "a4",
    footer: notes.display(), // Footnotes
    footer-descent: 0pt
)
#let qn = thmbox(
  "question",
  "Question",
  fill: rgb("#e8e8f8"),
  radius: 0em,
  stroke: rgb(black) 
).with(numbering: none)
#let definition = thmbox(
  "definition",
  "Definition",
  radius: 0em,
  fill: rgb("#e5ffcc"),
  stroke: rgb(black)
)
#let propn = thmbox(
  "proposition ",
  "Proposition",
  radius: 0em,
  fill: rgb("#e0e0e0"),
  stroke: rgb(black)
)
#let lemma = thmbox(
  "lemma",
  "Lemma",
  radius: 0em,
  stroke: rgb(black)
)
#let soln = thmplain(
"solution",
"Solution",
base: "question",
titlefmt: smallcaps,
bodyfmt: body => [
    #body #h(1fr) $square$
  ]
).with(numbering: none)
#let proof = thmplain(
"proof",
"Proof",
base: "theorem",
titlefmt: smallcaps,
bodyfmt: body => [
    #body #h(1fr) $square$
  ]
).with(numbering: none)
= Quesrtion
= lolcat 
// #notes.note[Page1][This is page one]
#notes.note[Assignment 4][22MS037]

// #notes.display() // Endnotes

// #pagebreak()

// #notes.note[Page2][This is page two]
// #notes.display() // Endnotes
#qn[1][
  
  dkw5rr4df5y

]