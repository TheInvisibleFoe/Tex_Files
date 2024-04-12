// Some definitions presupposed by pandoc's typst output.

#import "reporttemplate.typ": *
#show: ams-article.with(
  title: [Diffraction Grating],
  authors: (
    (
      name: "Sabarno Saha",
      department:[],
      organization: [IISERK],
      url: "theinvisiblefoe.github.io"
    ),
  ),
  bibliography-file: "refs.bib",
)


= Theory
<theory>
Diffraction is the phenomenon where the wave bends around corners while
interference is the phenomenon where two or more waves meet and
interact. We experiment with something called a *diffraction grating*. A diffraction grating is an optical device that diffracts a beam of light via a lot of diffraction slits. This type of division of light is called division by wavefront. 

Now we need a method of denoting light waves on diagrams. We use wavefronts to denote waves of light. The wave fronts are are drawn perpendicular to the waves such that all points on that wave front correspond to the same phase.


// The name diffraction grating is a misnomer as the the
// phenomenon we see here is just N-slit interference rather than
// diffraction. What essentially we have here is a bunch of very small
// slits spaced at a distance $d$ to find which is the aim of our
// experiment.

// Now we come to the phenomenon of interference. There are some important
// conditions that have to be met for interference to occur, a concept
// called Coherence. Physically, it represents the ability of a wave two
// waves to interfere. Coherence dictates visibility in the interference
// pattern. Interference requires the interfering waves to be coherent,
// something that can be achieved by having a constant phase relative phase
// difference between the interfering waves. Now keeping a broader
// discussion of coherence, we proceed to the nice mathematics that lies
// behind interference.

// == N-slit interference
// <n-slit-interference>
// First we have to address how to write a wave mathematically. A very
// general way is to use complex exponentials, which takes care of the fact
// that it includes both the sine and the cosine components of a wave.

// == N-slit diffraction 
== Interference

We
= Experiment 
