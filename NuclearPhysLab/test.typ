// #import "@preview/bubble:0.1.0": *
#import "template.typ": *
#import "@preview/ctheorems:1.1.2": *
#show: thmrules
// #show link: underline

#show: bubble.with(
  subtitle: "Summer Project Report",
  title: "Bayesian Inference of SPT Models",
  author: "Sabarno Saha",
  // author: "",
  affiliation: "IISER-K",
  date: datetime.today().display(),
  year: "Under Dr. Rajesh Singh",
  class: "IIT Madras",
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

This is a simple template that can be used for a report.

= Features
== Colorful items

The main color can be set with the `color` property, which affects inline code, lists, links and important items.

- These bullet
- points
- are colored

+ It also
+ works with
+ numbered lists!

This is an highlight. That can be set in the `template.typ` file.

The package #link("https://github.com/jneug/typst-codelst")[codelst] is used by default, and you can add some more of your liking if you want.


== Customized items


Figures are customized but this is settable in the template file. You can of course reference them @ref.

#figure(caption: [Source tree], kind: image,
box(width: 65%,sourcecode(numbering:none,
```bash
main
├── README.md
├── assets
│   ├── images
│   │   ├── used images
│   └── backup
│       └── backup files
├── makefile
└── src
    ├── headers
    │   ├── files.h
    └── files.c
```))
)<ref>

#pagebreak()

= Enjoy !

#lorem(100)


= Start

= Introduction
Our first project is to reproduce "Bayesian Inference with information model content check for Langevin Equation"@Krog2017. First, we start with a basis of stochastic thermodynamics with an assigned reading from @Shiraishi2023. We begin with basic stochastic processes and then Langevin dynamics. We then focus on a specific stochastic process called the Ornstein-Uhlenbeck process. Then we derive the Euler-Maruyuma integrator for the same process using CLT. In parallel to this project we will also be replicating the paper "Fast Bayesian Inference of optical trap stiffness and particle diffusion"

some stuff llolololol
= Stochastic Processes

#definition("Wiener Process")[
    The pdf of the Wiener process $hat(W)(t)$ is defined to be
    $ P(hat(W)(t+Delta t)=x|hat(W)(t)=x') = 1/(sqrt(2 pi Delta t)) e^(-(x-x')^2/(2 Delta t)) $
    with $P(hat(W)(t) = x) = delta(x)$ where $delta(x)$ is the Dirac Delta function.
]

#definition("Lolcat")[
  The lolcat is fuking ficked up
  A white gaussian is any stochastic variable $hat(xi)(t)$ which satisfies the following properties:
  + $ angle.l hat(xi)(t) angle.r = 0 $
  + $ angle.l hat(xi)(t)hat(xi)(t') angle.r prop delta(t-t') $
]
