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
#pagebreak()
== Deinition of a Vector Space
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
We finally end the part where we have to define a lot of algebraic structures, but they lead to some fun discussions. From here, armed with the defintion of vector spaces we move forward with our crusade into Linear Algebra, by exploring certain properties of Vector spaces.
#pagebreak()
= Vectors Spaces
#definition("Subspace")[

  Let $VV$ be a vector space over a field $FF$. Let $W subset VV$. If 
  $forall space w,w' in W$ we have  $a w+b w' in W space forall a,b in FF$, then $W$ is a subspace of $VV$
]
A comment on Notation: 

We are representing vectors spaces with $VV$ which is notation for $VV := (V,+,dot.circle)$ where $+$ is the binary operation and $dot.circle$ is the binary function called scalar multiplication. Whenever we write $W subset VV$, we mean $W subset V.$ Same goes for elements of the vector space. When we write $w in VV$, we mean $w$ is an element of the underlying set $V$.
#definition("Span")[
  
    Let $s={v_1,v_2, ... ,v_n}$ be a set of vectors. Then the span of $s$ denoted by $ text("span")(s)$ is defined to be
    $
      text("span")(s) = {c_1v_1+c_2v_2 +...+c_n,v_n|forall space c_1,c_2,...,c_n in FF}
    $
]<span>
#propn[
  
    Let $VV$ be a vector space over a field $FF$ and $WW$ be a subspace. Let $S subset VV$ such that $S subset WW$. Then span$(S) subset WW$.
]
#proof[
  We proceed by induction. Let $s = {v_1,v_2,...,v_n}$\
  #underline("Base Case(n=2)") \ 
  Given $v_1,v_2 in WW$, from the definition of a subspace, we have $c_1v_1+c_2v_2 in WW space forall c_1,c_2 in FF$. Thus span(${v_1,v_2}) subset WW$. \
  #underline("Induction Hypothesis") \
  Assume that $c_1v_1+c_2v_2+...+c_n v_n in WW$. We need to show that $c_1v_1+c_2v_2 + ... +c_(n+1)v_(n+1) in WW$. Let $lambda = c_1v_1+c_2v_2+...+c_n v_n$. We have $c_1v_1+c_2v_2+...+c_(n+1) v_(n+1) = lambda + c_(n+1) v_(n+1) in WW$ using our base case. Thus we have shown span($s) subset WW$.\
]
#propn[ 
  Given a subset $S subset VV$. span($S$) is a subspace of $VV$.
]
#proof[
  
  Let $S = {v_1,v_2,...,v_n}$  Let $w,w' in space $span($S)$. Thus $exists a_1,a_2,...,a_n in FF$ and $exists b_1,b_2,...,b_n in FF$ s.t. $w = a_1v_1+a_2v_2+...+a_n v_n$ and $w' = b_1v_1+b_2v_2+...+b_n v_n$. Let $alpha, beta in FF$. $
    alpha w+beta w' &= alpha(a_1 v_1 +...+ a_n v_n) + beta(b_1v_1  + ... + b_n v_n) \
                    &= sum_(i=1)^n (alpha a_i + beta b_i)v_i \ 
                    &= sum_(i=1)^n c_i v_i     space.quad space.quad (#text("where") c_i = (alpha a_i +beta b_i)v_i space)
  $
  Thus $alpha w + beta w' = sum_(i=1)^(n) c_i v_i in $ span$(S)$. Thus span$(S)$ is subspace of $VV$.
]
#definition("Linear Relation")[

  Let $v_1,...,v_n in VV$. If $exists space c_1,...,c_n in FF$ s.t. not all $c_i$'s are zero and if $c_1 v_1+ ... +c_n v_n = 0$. We call this a *linear relation* among the given set of vectors.
]
#definition("Linear Independence")[

  Let $v_1,...,v_n in VV$. If $exists.not$ any linear relation among $v_1,...,v_n$. We say that the set of vectors are *linearly independent*. 

  (Rephrased)

  Let $v_1,...,v_n in VV$. Then if for $c_1,...,c_n in FF$ 
  $
    c_1 v_1 + ... +c_n v_n => c_1=c_2=...=c_n=0
  $ Then $v_1,...,v_n$ are linearly independent.
]
#definition("Basis")[

  A linearly independent ordered set of vectors that span a vector space is called a basis. 
]<basis>
One small convention necessary for the next theorem. We take span$(phi.alt)$ ={0}
#propn[
  Let $VV$ be any vector space with a basis $BB:=(v_1,v_2,...,v_n)$. Then every vector in $VV$ has a *unique* expression of the form 
  $ c_1 v_1 + ...+ c_n v_n $ where $c_1,...,c_n in FF$. 
]
#proof[
    Suppose $exists v in VV$ such that there exists two expressions of the form $v=c_1 v_1 + ... +c_n v_n$ and $v = d_1 v_1 +...+ d_n v_n$. Then we have 
    $
      v-v &= c_1v_1+...+c_n v_n - (d_1v_1+...+d_n v_n) &= 0\
      & => (c_1 - d_1)v_1 + ... +(c_n - d_n)v_n &= 0 \ 
      #text("Since ")& space v_1,...,v_n #text("is a linearly independent set") \
      & => c_i - d_i = 0 space forall space i in NN_n \ 
      & => c_i = d_i 
    $
    Thus two expressions are the same. Thus we have a unique expression of $v$ using $BB$.
]
#propn[
  
    Let $VV$ be a vector space and let $S subset VV$ be an ordered set of vectors. Let $v in VV$ be any vector. Define $S' := (S,v):=(v_1,...,v_n,v)$ where $S = (v_1 ,...,v_n)$. Then we have 
  $
    v in #text("span") (S) <==> #text("span") (S) = #text("span") (S')
  $

]
#proof[
  $(==>$) Given $ v in$ span($S$) and $S' = (S,v)$ 
]
#propn[

Let $L = (v_1,...,v_n)$ be a linearly independent set and let $v in A$ be any vector. Then the set $L' = (L,v)$ is a linearly independent set $<==> v in.not $ span$(L)$.
]
#proof[
  We will prove the contrapositive i.e. $v in #text("span") (L) <==> L' $is a linearly dependent set \
  ($==>$) \ 
  We know $v in $ span$(L)$. Thus $exists space c_1,c_2,...,c_n in FF$ s.t. 
  $
  & c_1v_1 + ... +c_n v_n = v \
  & c_1v_1 + ... + c_n v_n -v =0
  $  
  Since coefficient of $v$ is $-1$, we have a linear relation among $L$ and $v$. $L'$ is a linearly dependent set.

  ($<==$) \ 
  $L'$ is a linearly dependent set. Thus $exists c_1,...,c_n,c_(n+1) in FF$ and  $exists c_i , c_i eq.not 0 $ s.t. 
  $
    c_1v_1 + ...  +c_n v_n+ c_(n+1)v_(n+1) = 0 
  $
  Now $c_(n+1) eq.not 0$ or $c_(n+1) eq 0$.

  #underline("Case 1: ") $c_(n+1) = 0$\
  Since $c_(n+1) = 0$, then we have 
  $
   c_1v_1 + ...  +c_n v_n = 0 
  $
  But we know that $L$ is an linearly independent set, thus $c_1 = c_2 = ... = c_n = 0$. But $exists c_i eq.not 0$. Thus $c_(n+1) eq.not 0$.

  #underline("Case 2: ")$c_(n+1) eq.not 0$\ 
  We thus have, 
  $
   c_1&v_1 + ...  +c_n v_n+ c_(n+1)v_(n+1) = 0 \ 
   ==> v &= -1/c_(n+1) ( c_1v_1 + ...  +c_n v_n ) \
   ==> v &= d_1v_1 + ...  +d_n v_n
   $
   Thus $v in $ span$(L)$.

]
#definition("Finite Dimensional Vector spaces")[

  Every vector space $VV$ over a field $FF$, that has spanning set with a finite number of elements is called a Finite Dimensional Vector Space.
]
#propn[
  
  Let $VV$ be a finite dimensional vector spaces and let $S$ be a finite and ordered set that      spans  $VV$. Then $S$ contains a basis of $VV$.
]
#proof[

  Let $S := {v_1,v_2 ,...,v_n}$. If $L$ is linearly independent, we are done. If not $exists $ a linear relation among the elements. Thus $exists c_1,...,c_n  in FF$ and for some  $k, c_k eq.not 0$. Thus 
  $
  v = -c_1/c_k v_1 - ... -c_n/c_k v_k
  $
  Let $S' := S\\{v_k}$. Then $v in $ span$(S')$. By propostion 3.4, span$(S) = $ span$(S') = VV$ Thus we keep repeating this process until we obtain a linearly independent list that still spans $VV$. Thus we can reduce the entire spanning set to a basis $BB$ of $VV$.
]
#propn[

  Let $VV$ be a finite dimensional vector space. Then any linearly independent subset $L subset VV$ is extendable to a basis of $VV$.
]
#proof[
  
  We know that $VV$ is finite dimensional. $exists $ a finite set $S$ s.t. span$(S) = VV$. If $S subset L$, then we have span$(S) subset $ span$(L)$. We also have span$(L) subset VV$
  $
    #text("span") (S) &=VV\
    #text("span") (L) &subset VV \
    #text("span") (S) &subset #text("span") (L) \ 
    ==> VV &subset #text("span") (L) 
  $
  Thus span$(L) = VV$. Thus $L$ is a basis $BB$.

  Otherwise, span$(L) subset $ span$(S)$. Then $exists v in S space s.t. v in.not $ span$(L)$.
  Let us then define $L' := (L,v)$. Since $v in.not $ span$(L)$, $L'$ is a linearly independent set as well by proposition 3.5. The list will terminate as we have finite dimensional spanning set, after a certain point span$(L_("new")) = VV$.
]
#propn[

  Let $S$ and $L$ be two finite subsets of a vector space $VV$ s.t. span$(S) = VV$ and $L$ is linearly independent.Then $|L| <=  |S|$. 
]
#proof[

  Let $|S| = m$ and $|L| =n $ and let $S:=(v_1,...,v_m)$ and $L:=(w_1,...,w_n)$
]
= Linear  Maps 
= Everything Eigen
= Dual Basis
= Bilinear Forms
= The Final Boss: *The Spectral Theorem*


// Bibliography section
#pagebreak(weak: true)
#set page(header: [])
= Bibliography
