// Some definitions presupposed by pandoc's typst output.
#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]
#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#let conf(
  title: none,
  authors: (),
  keywords: (),
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  set document(
    title: title,
    author: authors.map(author => author.name),
    keywords: keywords,
  )
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
    ]]
  }

  if authors != none and authors != [] {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[Abstract] #h(1em) #abstract
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
#show: doc => conf(
  cols: 1,
  doc,
)


= Vector Space Axioms
<vector-space-axioms>
Let $F$ be a field, and let $V$ be a set. Then $(V , + , dot.op)$ is a
vector space over $F$ if and only if the following axioms hold:

+ #strong[Closure under addition:] For all $u$, $v in V$, $u + v in V$.

+ #strong[Commutativity of addition:] For all $u$, $v in V$,
  $u + v = v + u$.

+ #strong[Associativity of addition:] For all $u$, $v$, $w in V$,
  $(u + v) + w = u + (v + w)$.

+ #strong[Existence of zero vector:] There exists an element $0 in V$
  such that for all $v in V$, $v + 0 = v$.

+ #strong[Existence of additive inverses:] For all $v in V$, there
  exists an element $- v in V$ such that $v + (- v) = 0$.

+ #strong[Scalar multiplication by 1:] For all $v in V$,
  $1 dot.op v = v$, where $1$ is the multiplicative identity of $F$.

+ #strong[Distributive property over addition:] For all $a$, $b in F$
  and $v in V$, $a (v + w) = (a dot.op v) + (a dot.op w)$.

+ #strong[Distributive property over scalar addition:] For all $a$,
  $b in F$ and $v in V$,
  $(a + b) dot.op v = (a dot.op v) + (b dot.op v)$.
