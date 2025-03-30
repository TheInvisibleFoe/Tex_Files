#import "@preview/touying:0.6.1": *
#import themes.university: *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.4" as fletcher: node, edge
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import cosmos.clouds: *
#show: show-theorion

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // align: horizon,
  //config-common(handout: true),
  config-common(frozen-counters: (theorem-counter,)), // freeze theorem counter for animation
  config-info(
    title: [Bayesian Data Analysis],
    subtitle: [Bayesian Inference with applications to SPTs],
    author: [Sabarno Saha],
    date: datetime.today(),
    institution: [IISERK],
    logo: emoji.school,
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

== Outline <touying:hidden>

#components.adaptive-columns(outline(title: none, indent: 1em))

= The Mighty Bayes theorem
---
The mighty Bayes Theorem
#definition(title: "Bayes Theorem")[$ P(A|B) = (P(B|A)P(A))/P(B) $]
Let us slightly modify the above equation to suit our needs. 
---
_Problem Description_ :\
Suppose we get some data $D$ and we want to infer the model parameters $theta$ and the model $M_i$ that generated the data.

#pause
*Aloha! Bayes*\
We will try to use Bayes Theorem to infer the model parameters.
---
Let $M$ be the model and $D$ be the data we obtained. Then Bayes Theorem can be written as
$ overbrace(P(M|D), "Posterior Distribution") = (overbrace(P(D|M),"Likelihood")overbrace(P(M),"Prior"))/
underbrace(P(D),"Evidence") $
---
- *Posterior Distribution [$P(M|D)$]* : The probability of the model given the data.
- *Likelihood [$P(D|M)$]* : The probability of the data given the model.
- *Prior [$P(M)$]* : The probability of the model.
- *Evidence [$P(D)$]* : The probability of the data.

---
Let $M_i in MM$ where $MM$ is the set of models considered for the analysis. Let $bold(theta)$ be 
a vector consisting of the parameters of the model. The _practical_ Bayes Theorem  as
$
  P(bold(theta)|bold(D),M_i) = (P(bold(D)|bold(theta),M_i) P(bold(theta)|M_i)) / (P(bold(D)|M_i))
$<llfunction>

---
- *Posterior Distribution [$P(bold(theta)|bold(D),M_i)$]* : The probability of the parameters given the data and the model.
- *Likelihood [$P(bold(D)|bold(theta),M_i)$]* : The probability of the data given the parameters and the model.
- *Prior [$P(bold(theta)|M_i)$]* : The probability of the parameters given the model.
- *Evidence [$P(bold(D)|M_i)$]* : The probability of the data given the model.
---
= Toy Example 1 : Coin Toss
---
_Problem:_ \
Suppose we have a coin and we want to infer the probability of getting a head, say $p$. Let us take $n$, say $n=20$ tosses out of which $r$ are heads. We want to infer the value of $p$ given the data $ bold(theta) = {p} $. Here $r$ is our data and $p$ is the parameter we want to infer.
---
Now we know that the random variable representing one coin toss $X_c ~ #text("Bernoulli") (p) $. Then after getting 
$r$ heads in $n$ tosses, the likelihood function is a Binomial distribution. The likelihood function is given as
$ P(r|bold(theta),n) = P(r|p,n) = binom(n,r) p^r (1-p)^(n-r) $<likelihood> The Beta Prior is a conjugate prior for the Binomial likelihood function. The posterior distribution for the Uniform Prior is given as
---

---
We will use two priors here :
- *Uniform Prior* : $ P(p) = 1 $ for $0 <= p <= 1 $
- *Beta Prior* : $ P(p) = beta(p|a,b) = (Gamma(a+b)/(Gamma(a)Gamma(b))) p^(a-1) (1-p)^(b-1) $ for $0 <= p <= 1 $
---
The Uniform Prior is used when we have no prior information about the parameter.

 The Beta Prior is used when we have some prior information about the parameter. We assume that the coin is somewhat fair and choose $a = b = n/2 = 10$.
---
== Uniform Prior 
---
Using bayes theorem, we can calculate the posterior distribution for the Uniform Prior to be just proportional to the likelihood function. The posterior distribution is given as
$ P(p|r,n) = 1/Z binom(n,r) p^r (1-p)^(n-r) $<uniform-posterior>
where $Z$ is the evidence or the normalizing constant.

== Uniform Prior for 20 coin tosses.
---
#image("unif.png", width: 100%)
---
== Beta Prior
---
1
---
== Beta Prior for 20 coin tosses.
---
#image("beta.png", width: 100%)
---

== Priors, LL, and Posterior for Beta prior
---
#image("betallpp.png", width: 100%)
---

== Comparison Between Uniform and Beta Priors
---
#image("comp.png", width: 100%)
---
== Bayesian to Frequentist thinking
---
- *Bayesian* : We have a prior distribution for the parameter and we update it using the data to get the posterior distribution.
- *Frequentist* : We , theoretically, have an infinite number of data points and we use the data to estimate the parameter.
---
#image("betarn.png", width: 100%)
--
= Toy Example 2: Finding Evidence (Z)
= Information Theory
== Nested Sampling
== Likelihood Determination
