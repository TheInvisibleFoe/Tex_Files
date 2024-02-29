#import "template.typ": project
#import "@preview/ctheorems:1.1.2": * 
#show: thmrules

#show: project.with(
  title: "Linear Algebra done Horribly 😎",
  authors: (
    (name: "Sabarno Saha", 
    email: "sabarnohere@gmail.com", 
    affiliation: "IISERK", 
    postal: "", 
    phone: ""),
  ),
)

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8"),
  radius: 0em,
  stroke: rgb(black) 
)
#let definition = thmbox(
  "definition",
  "Definition",
  radius: 0em,
  fill: rgb("#e5ffcc"),
  stroke: rgb(black)
)
#let lemma = thmbox(
  "lemma",
  "Lemma",
  radius: 0em,
  stroke: rgb(black)
)
#let proof = thmplain(
"proof",
"Proof",
base: "theorem",
titlefmt: smallcaps,
bodyfmt: body => [
    #body #h(1fr) $square$
  ]
).with(numbering: none)

= Introduction
This is small concise set of notes from the MA2102: Linear Algebra course taught at IISERK. This course was taught by Dr. Soumya Bhattacharya.

We will start from the basic definitions of groups and fields, and then build up to the definition of a *Vector Space*. In Vector spaces we talk about , basis vectors, Direct sums and different theorems most importantly the *rank nullity theorem*. Then we move on to Linear Transformations. After thar we move onto the concept of invariant subspaces and everything-eigen i.e. eigen vectors and eigenvalues. Then we move onto the concept of Dual spaces, which is pretty important in context of QMech. From there we move onto bilinear operators, of which we will be studying the dot and the hermitian product in detail. The final topic of this will be the spectral theorem, which gives us a very powerful way to diagonalize matrices.

== What we will cover
- Vector Spaces
- Linear Operators
- Dual Spaces
- Bilinear Operators
- *The Final Boss:* The Spectral Theorem


== References
- Algebra by Michael Artin
- Introduction to Linear Algebra by Hoffman and Kunze
- Linear Algebra done right by Sheldon Axler(The fourth edition has a public access E-book)
#pagebreak()
= Algebraic Jiu-Jitsu
#definition("Binary operation")[
  A binary operation is a map from $f:S times S -> S$, and $f$ is defined to be a *binary operator*.
]
#definition("Group")[
  

  A set $S$ with a binary operation $ast.circle$ is a group G = $(S,ast.circle)$ if it satisfies the following axioms:\ 
  1. *Assosciativity* \ 
    $a ast.circle(b ast.circle c) = (a ast.circle b) ast.circle c space.nobreak forall space.nobreak a,b,c in S$ \

  2. *Identity*\
    $exists i_s in S $ s.t. $forall s in S$ \ 
    $   
      a ast.circle i_s = i_s ast.circle a  = a
    $

  3. *Inverse*\
    $forall space a in S space exists space  b in S$ \
    $
      a ast.circle b = b ast.circle a = i_s 
    $
]<group>

#definition("Subgroup")[
  Let $(G,ast.circle)$ be a group. If $(H,ast.circle)$ is a group and $H subset G$, then $(H,ast.circle)$ is asubgroup of $(G,ast.circle)$.
]
#theorem[ \ 
  
  Every group has a unique identity operator.
]
#proof[
  Let $(G,ast.circle)$ be a group. Let $i_g,j_g in G$ be two identity operators of the group. We have $i_g = i_g ast.circle j_g = j_g$ by definition. Thus $i_g=j_g$. Thus the identity operator is unique. \
]
#theorem("Unique Inverse")[\
  Let $(G,ast.circle)$ be a group. Let $a in G$. Then $a$ has a unique inverse.
]
#proof[
  We have $a in G$. Let there be two inverses of $a$, $b,c in G$. Thus $a ast.circle b = b ast.circle c = i_g$ and $a ast.circle c =c ast.circle a= i_g$ where $i_g in G$ is the identity in $G$. Then we have 
  $
    b = b ast.circle i_g = b ast.circle (a ast.circle c) = (b ast.circle a) ast.circle c = i_g ast.circle c =c
  $
  Thus $b=c$ i.e. the inverse of $a in G$ is unique.
]
#definition("Abelian Group")[
  Let $(G,ast.circle)$ be a group, s.t. $a,b in G$. If $a ast.circle b = b ast.circle a$, then we say that $ast.circle$ is a commutative operator, and $(G,ast.circle)$ is a commutative or an *abelian group*
]
#definition("Semigroup")[
  A set $S$ with a binary operation $ast.circle$ is a semigroup G = $(S,ast.circle)$ if *Assosciativity* is satisfied.
]
#definition("Monoid")[
   Let $(S,ast.circle)$ be a semigroup. If $S$ has an identity element, then $(S,ast.circle)$ is a monoid.
]
#definition("Ring")[

  A set $R$ with binary operations $+$, $ast$ is called a ring $(R,+,ast)$ if it satisfies the following axioms: 
    1.  $(R,+)$ is an abelian group.
    2. $(R,ast)$ is a monoid.
    3. $ast$ is distributive over $+$ \ 
      $a ast (b+c) = a ast b + a ast c$ and $(b+c) ast a = b ast a + c ast a$
]<ring>
#definition("Commutative Ring")[
  A ring $(R,+,ast)$ is a commutative ring if $ast$ is a commutative operator.
]
#definition("Field")[

  A commutative ring $(F,+,ast)$ is a field is $F^ast := (F\\{0},ast)$ is also an abelian group, where $0 in F$ is the identity operator of the group $(F,+)$
]<field>
Whew, that was a whole lot of jargon. Now, after the whole jiu-jitsu routine is over, we can finally define what we want to actually define what a *Vector Space* is.
#definition("Vector Space")[\
  A vector space $VV$ is a non-empty set defined over a field $FF$ with a binary operation $+$ and a binary function $dot$ such that

  1. The binary operation, called vector addition or simply addition assigns to any two vectors $v,w in V$ a third vector in $VV$ which is commonly written as $v + w$, and called the sum of these two vectors.
  2. The binary function, called scalar multiplication,assigns to any scalar $a in FF$ and any vector $v in VV$, another vector in $VV$, which is denoted $a dot v$.
]
The definition above is from wikipedia. I got bored of defining stuff, so I copied this one 😉. However, we can alternately redefine vector spaces without explicitly defining the previous definitions, given below. I prefer the above method of defining, as it breaks up the definitions into smaller definitions, and makes us familiar with commonly used structures in algebra.

#definition("Vector Space")[ Alternate but ultimately the same definition 

Let $FF$ be a field, and let $V$ be a set. Then $(V , + , dot.op)$ is a
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
  $1 dot.op v = v$, where $1$ is the multiplicative identity of $FF$.

+ #strong[Distributive property over addition:] For all $a$, $b in FF$
  and $v in V$, $a (v + w) = (a dot.op v) + (a dot.op w)$.

+ #strong[Distributive property over scalar addition:] For all $a$,
  $b in FF$ and $v in V$,
  $(a + b) dot.op v = (a dot.op v) + (b dot.op v)$.
]
#pagebreak()
= Vectors Spaces
= Linear  Maps 
= Everything Eigen
= Dual Basis
= Bilinear Forms
= The Final Boss: *The Spectral Theorem*


// Bibliography section
#pagebreak(weak: true)
#set page(header: [])
= Bibliography
#lorem(30)