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
    logo: emoji.monkey,
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
We will try to use Bayes Theorem to infer the model parameters.@bailer-jones2017practical
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
Suppose we have a coin and we want to infer the probability of getting a head, say $p$. Let us take $n$, say $n=20$ tosses out of which $r$ are heads. We want to infer the value of $p$ given the data $ bold(theta) = {p} $ Here $r$ is our data and $p$ is the parameter we want to infer.
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
#set align(center)
#image("unif.png", width: 78%)
---
#set align(left)
== Beta Prior
---
The current beta prior we assume is when we expect the coin to be fair. So we take the beta prior to be
$ P(p) = beta(p|10,10) prop p^9(1-p)^(9) $<beta-prior>
Note that it is harder to budge the beta prior than the uniform prior, because we might have prior information that the
coin is fair. So if we get skewed data the posterior distribution still has a preconceived notion that the coin is fair.

We will see this when we compare the two priors.

---
*Prior* : $ P(p) = beta(p|a,b)  = 1/B(a,b) p^a (1-p)^b $<beta-prior> where $0<= p<=1$\

#pause
*Likelihood* : $ P(r|p,n) = binom(n,r) p^r (1-p)^(n-r) $

#pause
*Posterior* : $ P(p|r,n) = beta(p|a+r,b+n-r)/Z  = 1/Z p^(a+r-1) (1-p)^(b+n-r-1) $<beta-posterior>
absorbing the terms not containing $p$ in $Z$.
---
== Beta Prior for 20 coin tosses.
---
#set align(center)
#image("beta.png", width: 78%)
---

== Priors, LL, and Posterior for Beta prior
---
#image("betallpp.png", width: 78%)
---

== Comparison Between Uniform and Beta Priors
---
#image("comp.png", width: 78%)
---
== Bayesian to Frequentist thinking
---
- *Bayesian* : We have a prior distribution for the parameter and we update it using the data to get the posterior distribution.
- *Frequentist* : We , theoretically, have an infinite number of data points and we use the data to estimate the parameter.
---
#image("betarn.png", width: 78%)
---
#set align(left)
= Toy Example 2: Finding Evidence (Z)

---
Generally we are mostly instered in the posterior distribution which can then be normalized to find the normalization constant,
which in this case is the evidence of the Model, $Z$. Integrating over small parameters spaces are possible to find the 
evidence of the model, but it is computationally expensive for higher dimensional parameter vector
$bold(theta)$. We will see how to calculate the evidence of the model using an algorithm called Nested Sampling.

== Nested Sampling
---
Originally proposed by John Skilling in 2004, Nested Sampling is a method to calculate the evidence of the model. The idea is to
transform the multi-dimensional integral to a one-dimensional integral. The algorithm is as follows:
- Initialize the algorithm with a set of live points in the parameter space.
- Find the point with the lowest likelihood and replace it with a new point with a higher likelihood.
- The point with the lowest likelihood is called the "dead point".
- The algorithm stops when the evidence is calculated to a desired accuracy.
---
Some math here ;)

The evidence $P(D|M) = Z(M)$ is given as 
$  Z(M) = integral_(Omega(theta)) L(bold(upright(theta)))pi(bold(upright(theta)))d bold(upright(theta)) $
where $Omega(theta)$ is the prior volume and $L(bold(upright(theta)))$ is the likelihood function.


The evidence can also be interpreted as the normalization constant for the posterior distribution. Instead of computing overall parameter space to find the integral of the posterior. What we do is take the prior landscape deformed by the prior and try to define iso-likelihood contours and integrate over the contours to generate an integral in 2-D space which can be performed by any quadrature rule like rectangular, trapezoid, or Simpsons. So what we do now is define something called a prior mass namely $X(lambda)$,
$ X(lambda) = integral_(L(bold(upright(theta)))> lambda) pi(bold(upright(theta)))d bold(upright(theta)) $ Now we define $L(X(lambda)) = lambda$. Note that the integrand in evidence integration has a vector parameter while this has a scalar parameter. We can see that the lambda ranges from 0 to 1, as the prior mass decreases as lambda goes from 0 to 1, as likelihood is a probability and thus it is less than 1.
$ Z(M) = integral_0^1 L(X)d X $
This can be transformed into a summation. Let us define the lowest likelihood at the $j^(t h)$ iteration, suppose which belongs to the $p^(t h)$ walker  and we denote the lowest likelihood at the $j^(t h)$ we have $ L(X_p) = L_j$ and $w_j = Delta X_j = X_j - X_(j-1)$ so that we have $ Z(M) = sum_(i=1)^N L_j w_j --> integral_0^1L(X)d X $<discreteevidence>
The posterior distribution can be given as $ P_j = (L_j w_j)/(Z) $
//A nice illustration of this can be found in Feroz et. al. @Feroz2013-mb and at Ashton et. al. @Ashton2022-n

---
The implementation follows from Thapa et. al. @Thapa2018. We start by uniformly sampling $N$ points which are our walkers, $theta_1, ..., theta_N$ from the prior surface in ($N+1$) dimensions. We start by calulating the likelihoods of the walkers $L(theta_i) = L_i$. Now we denote the lowest likelihood as $L_j = L(theta_p)$ in the jth iteration, i.e. the likelihood of the pth walker. Now we store $L_j$ and then assign the weights for our evidence calculation, $w_(j = 1) = 1/(N+1)$ for the 1st iteration and $w_(j eq.not 1) = w_(j-1) K/(K+1)$. Now we add the $L_j w_j$ to the evidence $Z$ according.
So at the jth iteration we have the evidence to be
$ Z = sum_(i=1)^j L_j w_j $
Now we reject the point with the lowest likelihood i.e., we reject the pth point. We then sample another point at the $(j+1)^(t h)$ iteration, using an MCMC algorithm constrained to $L(theta_(n e w))>L_j$, that is the new point point must have likelihood greater than the lowest likelihood of the previous iteration. Now we come to the the stopping criteria, that is when we stop sampling of new points and return the complete evidence. Let us denote $ Z^(r e m)_i = w_j sum_(i=1)^N L(bold(theta)_(j.m)) $<stoppingcriteria>
where $bold(theta)_(j,m)$ denotes the $m^(t h)$ walker in the $j^(t h)$ iteration. We now define the stopping ratio $R_j$ at the jth iteration and we define it to be,
$ R_j = Z^(r e m)_j/Z $
We stop the nested sampling when $R_j < epsilon(~ 10^(-4))$ where $epsilon$ is the tolerance. We denote the last iteration to be $j=j_max$. The final value of our Evidence $Z$ is given as
$ Z = Z_(j_max - 1) + Z^(r e m)_(j_max) $
We calculate $ln Z$ instead of $Z$ to prevent floating point errors. We also calulate log likelihood and log weight functions. So our calculation comes out to be,
$ ln(Z_j) = ln[exp(ln(Z_(j-1)))+ exp(ln(L_j) + ln(w_j))] $
In machine learning algorithms, an approximation is used called the logsumexp approximation

$ log(exp(a) + exp(b))  &= cases(a+ log(1 + exp(b - a)) quad a>=b,b+ log(1 + exp(a - b)) quad a<b)\
&= max{a,b} + ln(1 + exp(-|a-b|))
$
---
#figure(
  image("ferozetal.png", width: 80%, ),
  caption:[NS algorithm by Feroz et. al.]
)

#figure(
  image("nsforphysicalsciences.png", width: 70%, ),
  caption:[NS algorithm illustration]
)
== Problem Description
--- 
_Problem:_\
Suppose we take a particle and let the particle exhibit random motion. We want to infer the parameters of the model that generated the data. 
The model that we will consider is the Kramer's Equation generalized to a high friction limit.
--- 
The Langevin Equation is given by  @Shiraishi2023$ (d x)/(d t) = mu(x)f + k_B T diff_x mu(x) +  sqrt(2 k_B T mu(x)) hat(xi)(t) $<model>


The test model uses the Fokker-Planck Equation which is $ diff_t P(x,t) = -diff_x [mu(x)f P(x,t) - k_B T mu(x) diff_(x) P(x,t)] $ where $P(x, t)$ is the probability distribution at time $t$. $mu(x)$<fp> is the function that describes motility of the particle and $f$ is the applied force on the particle. The paper @Krog2017 does not assume $f$ as a function of coordinates but assumes it to be a constant.

---
Here is a sample track,
#set align(center)
#image("cleanmodels.png", width: 70%)
---
#set align(left)

Let the track the particle follows be denoted by $bold(x)$ which is a vector of data points.
 Let the data points $bold(x)$ be $x_0, x_1, ..., x_N$. Note the random part of the equation is  We can then get the likelihood function to be

$ P(bold(x)|bold(upright(theta)),M_i) &= P((x_0, x_1, ..., x_N)|bold(upright(theta)),M_i)\

& = P(x_N| x_(N-1), ..., x_0,bold(upright(theta)),M_i) P(x_(N-1), ..., x_0,bold(upright(theta)),M_i) $
--- 
Simplifying and continuing further we get(we also fix the first step at $x_0$)
$
P(bold(x)|bold(upright(theta)),M_i)&= P(x_0|bold(upright(theta)),M_i)product_(j=1)^(N) P(x_j|x_(j-1), ..., x_1 , bold(upright(theta)),M_i)\
& = product_(j=1)^(N) P(x_j|x_(j-1) , bold(upright(theta)),M_i)\

&= product_(j=1)^(N) 1/(sqrt(2 pi sigma^2_j)) exp[-(x_j - overline(x_j))^2/(2 sigma^2_j) ] $ where mean and variance is given as $ overline(x_j) &= x_(j-1) + [mu(x_(j-1))f + k_B T diff_x mu(x_(j-1))]Delta t \
sigma^2_j &= 2 k_B T mu(x_(j-1)) Delta t $

== Example of Nested Sampling
---
We have obtained a generated track using the *pull,free* using the true parameters $D_0=0.2, alpha = 1, f = -0.3$ and $ sigma^2_(m n) =0$. All the inferred parameters are inferred using nested sampling on the

Inferred Parameters:
#set align(center)
#figure(caption: [Inferred Parameters and their errors (Model: pull,free)],

kind: table,

table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: center,
  table.header(
    [*Names*], [*Inferred Value* $ V plus.minus 3 bold(sigma)$],[True Value]
  ),
  [
    Diffusion Coefficient $D_0$
  ]
  ,
  [$0.150  plus.minus  0.1333$],
  [
    $0.2$
  ],
   [
    Alpha $alpha$
  ]
  ,
  $1.047  plus.minus  0.3068 $,
  [
    $1$
  ],
   [
    Applied Force $f$
  ]
  ,
  $ -0.287  plus.minus  0.2408$,
  [
    $-0.3$
  ],
   [
    Measurement noise $sigma^2_(m n)$
  ]
  ,
  $0.050  plus.minus  0.1562$,
  [
    $0$
  ],
)
)
---
#set align(left)

The inferred parameters are given in the table above. We get the likelihood functions for each parameter. We also plot the track.
#figure(
  image("track.png", width: 60%),
)
#figure(
  image("Krogdatall.png", width: 80%),
)

#box(width: 115%,
```text
 Model 1  (free, clean)  with Model Prob = 0.009
---------------------------------------------------------------------
 ln Evidence = -185.454  +/- 0.12537
    Posterior Parameters
 1. Diffusion Coefficient D_0 = 0.167  +/-  0.0087
 2. Exponent alpha            = 1.034  +/-  0.0234
 3. Applied Force f           = 0.000  +/-  0.0000
 4. Var of Measurement noise  = 0.000  +/-  0.0000
 Maximum Likelihood = -194.276
 Information H = 1.57186
 ```)
---
#box(width: 115%,
```text
 Model 2  (pull, clean)  with Model Prob = 0.725
---------------------------------------------------------------------
 ln Evidence = -181.084  +/- 0.12760
    Posterior Parameters
 1. Diffusion Coefficient D_0 = 0.166  +/-  0.0073
 2. Exponent alpha            = 1.007  +/-  0.0212
 3. Applied Force f           = -0.269  +/-  0.0194
 4. Var of Measurement noise  = 0.000  +/-  0.0000
 Maximum Likelihood = -184.888
 Information H = 1.62827
```)
---
#box(width: 115%,
```
 Model 3  (free, mn)  with Model Prob = 0.005
---------------------------------------------------------------------
 ln Evidence = -185.985  +/- 0.15212
    Posterior Parameters
 1. Diffusion Coefficient D_0 = 0.138  +/-  0.0109
 2. Exponent alpha            = 1.099  +/-  0.0345
 3. Applied Force f           = 0.000  +/-  0.0000
 4. Var of Measurement noise  = 0.028  +/-  0.0077
 Maximum Likelihood = -229.162
 Information H = 2.31412
```)
---

#box(width: 115%,
```text
 Model 4  (pull, mn)  with Model Prob = 0.260
---------------------------------------------------------------------
 ln Evidence = -182.109  +/- 0.16666
    Posterior Parameters
 1. Diffusion Coefficient D_0 = 0.151  +/-  0.0130
 2. Exponent alpha            = 1.025  +/-  0.0370
 3. Applied Force f           = -0.298  +/-  0.0358
 4. Var of Measurement noise  = 0.024  +/-  0.0109
 Maximum Likelihood = -249.447
 Information H = 2.77771

The Highest Model probability for the given data is for the Model (pull, clean)
```
))
---
= References
---
== Bibliography
---
#set align(left)
#bibliography("refs.bib")

