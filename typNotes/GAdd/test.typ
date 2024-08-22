// #import "@preview/bubble:0.1.0": *
#import "template.typ": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules
// #show link: underline

#show: bubble.with(
  title: "Goldstein Addendum",
  subtitle: "PH3101",
  author: "Sabarno Saha",
  // author: "",
  affiliation: "IISER-K",
  date: datetime.today().display(),
  year: "",
  class: "",
  main-color: "#239b56",
  bib: "refs.bib",
)



#set page(numbering: none)
// Edit this content to your liking
// #outline()
#outline(indent: auto)

#pagebreak()
#set page(numbering: "1 / 1")
#counter(page).update(1)
= Introduction

This pdf serves as some personal addendums to 'Classical Mechanics' by Goldstein, Poole, Safko.

= Central Potential

*Chapter -1 Pg-8*

Goldstein claims that the internal forces will be central. This step in the book is unmotivated and generally pulled out of thin air. Central forces allow for potentials 
that only depend on the distance between the particles and not their absolute distances itself.
After some googling by Diptanuj, we have arrived at the following theorem,
#theorem("Central Potential")[
  If two particles exert a mutual conservative force $arrow(F)_(1 2)$ and $arrow(F)_(2 1)$ which is 
  independent of any other degree of freedom of any bigger system they're part of, and obeys NLM3 
  $arrow(F)_(1 2)+arrow(F)_(2 1)=0$ with the forces collinear to the particles relative orientation, then 
  this mutual force can be written in the form,

  $ arrow(F)_(i j) = nabla_j V(|arrow(r)_(1)-arrow(r)_( 2)|) $
  for some appropriate potential $V$.
]
#proof()[
  We prove this by transforming from a general coordinate which has an arbitrary origin to the COM frame. We will show this for two particles which can be easily extended to more particles. Our proof consists of showing that the potential has to angular dependence and then finally proving that the potential only depends on the distance between the particles. 

  So we have that the forces are collinear to the particles relative orientation. Let the position vector of particle $1$ and $2$ is $arrow(r')_1, arrow(r')_2$ respectively. The force exerted on $1$ by $2$ is denoted as $arrow(F)_(1 2)$. Then our hypothesis in the theorem statement just means that 
  $ (arrow(r')_1 - arrow(r')_2) dot.c arrow(F)_(1 2) = 0 $
  
]
