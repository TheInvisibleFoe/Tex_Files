#import "template.typ": *
#import "@preview/physica:0.9.1": *
#import "@preview/ctheorems:1.1.2": * 
#show: thmrules
#show: super-T-as-transpose // put in a #[...] to limit its scope...
#show: super-plus-as-dagger // ...or use scripts() to manually override

#show: arkheion.with(
  title: "PH3102: QM Assignment 08",
  authors: (
    (name: " Sabarno Saha", email: "22MS037", affiliation: "IISERK"),
  ),
)
#set cite(style: "chicago-author-date")
#show link: underline
#let ar = [$angle.r$]
#let al = [$angle.l$]
#let tc = [$times.circle$]
#let vb(ip) = {$bold(hat(ip))$}
#let br(ip) = {$|#to-string(ip.join(",")) angle.r$}

= A system of two Interacting Spins
#answer[
 There are 2 independent spins $arrow(S)_1$, $arrow(S)_2$ which have two independent Hilbert spaces 
  assosciated with them. Thus this systems having 2 spins will be described by the tensor product of both 
  Hilbert spaces giving us the labelling $|S_1,m_S_1 angle.r$ and $|S_2,m_S_2 ar$. Thus to label all 
  the states of the system we need 4 eigenstates.
  
]
#answer[
  The hamiltonian is given as 
  $ hat(H)  &= J vb(S)_1 dot vb(S)_2 \
            &= J/2[vb(S)_(t o t)^2 - vb(S)_1^2 - vb(S)_2^2]
  $
  Let us write our eigenstates $|S_1, m_S_1 ar tc|S_2, m_S_2 ar$ as the tensor product of the eigenstates with the good quantum numbers. 

]
#answer[
  Since the Spin operators $vb(S)_1$ and $vb(S)_2$ acts on independent Hilbert spaces, the operators are
  independent of each other. We thus have $[op(S)_(1 i),S_(2 j)] = 0 $ where $i,j in{x,y,z}$. This gives us the 
  commutation relations $[vb(S)_(t o t), vb(S)_i] =0, i in {1,2}$. Thus we see that $hat(S)_(t o t), hat(S)_1$ and
  $hat(S)_2$ all commute with the Hamiltonian, giving us 
  $ [H,hat(S)_(t o t)] = [H,hat(S)_1] = [H,hat(S)_2] =0 $. 
  We know that we need 4 operators to form a Complete Set of Commuting Observables(CSCO). Let us define
  $hat(S)_z = hat(S)_(1 z) + hat(S)_(2 z)$. We know that Spin angular momentum also follows total angular momentum
  commutation relations. From the addition of angular momenta relations, we get
  $ &[vb(S)_(t o t)^2, S_z]= 0 \
  => &[H, S_z] = 0 $
  Let us denote our eigenstates as $| s, m_s; s_1, s_1 ar$ where we have 
  $ 
    vb(S)_(t o t)^2|s, m_s; s_1, s_2 ar &= s(s+1)hbar^2|s, m_s; s_1, s_2 ar\
    vb(S)_1^2|s, m_s; s_1, s_2 ar &= s_1(s_1+1)hbar^2|s, m_s; s_1, s_2 ar = 3/4 hbar^2|s, m_s; s_1, s_2 ar\ 
    vb(S)_2^2|s, m_s; s_1, s_2 ar &= s_2(s_2 +1)hbar^2|s, m_s; s_1, s_2 ar = 3/4 hbar^2|s, m_s; s_1, s_2 ar\
    S_z|s, m_s; s_1, s_2 ar &= m_s hbar |s, m_s; s_1, s_2 ar
  $
  We can then write our reformed hamiltonian as 
  $ hat(H) = J/2(vb(S)_(t o t)^2 - 3/2 hbar^2 II) $<refham>
  We can see that the energy eigenvalue is independent of $m_s$, thus the levels with same $m_s$ are degenerate.
  We have already seen before that this is the addition of two spin 1/2 momenta we thus get the 
  eigenstates
  
  #set math.cases(reverse: true)
  #underline("Singlet State")
  $ |0,0 ar = 1/sqrt(2)(ket(arrow.t arrow.b) - ket(arrow.b arrow.t )  quad[E_(S=0) = -3/4 J hbar^2] $
  #underline("Triplet State")
  $ cases(|1","1 ar = ket(arrow.t arrow.t), ket(1","0) = 1/sqrt(2) [ket(arrow.t arrow.b ) + ket(arrow.b arrow.t)], ket(1","-1) = ket(arrow.b arrow.b) )= [E_(S=1) = 1/4 J hbar^2]  $
]
#answer[
  The operator $vb(S)_(t o t)(hat(n)) = n_x S_x + n_y S_y + n_z S_z$. Let us now calculate the expectation value of
  $vb(S)_(t o t)(hat(n))$ in the ground singlet state.
  $ expval(vb(S)_(t o t)(hat(n))) &= n_x bra(0","0)S_x ket(0","0) + n_y bra(0","0) S_y ket(0","0) + n_z bra(0","0)S_z ket(0","0) \ 
  &= n_x/2 bra(0","0)S_+ + S_- ket(0","0) + n_y/(2i) bra(0","0) S_+ - S_- ket(0","0)\ 
  &=0 $
  We can see that the expectation value is independent of the value of the $hat(n)$ and thus is exhibits 
  SU(2) symmetry.
]
#answer[
  We now calculate the magnetisations of the three excited states 
  $ expval(vb(S)_(t o t)(hat(n))) &= n_x bra(1","m)S_x ket(1","m) + n_y bra(1","m) S_y ket(1","m) + n_z bra(1","m)S_z ket(1","m) \ 
   &= n_z bra(1","m) S_z ket(1","m)  $
  The total magnetisation for the triplet excited states are
  #set math.cases(reverse: false)
  $ expval(vb(S)_(t o t))= cases(n_z quad quad &m=1,0 quad  quad& m=0, -n_z quad quad & m=-1 ) $
  Classically ferromagnets are magnets with all dipoles aligned in the same direction. Thus the expectation value in the $hat(z)$ direction is non zero. 
  Thus we have $ket(1","1)$ and $ket(1","-1)$ to be classical ferromagnets.

  To adequately describe the singlet state we would require another operator called the staggered magnetism operator which gives us anti-ferromagnets. This results in the
  singlet states being antiferromagnetic.
]

= Broken symmetry and a quantum "phase" transition in a toy model

#answer[
  We have already calculated for the above Hamiltonian. The new Hamiltonian has a small modification over the
  previous one. Using @refham, The new Hamiltonian simplifies to
  $ hat(H) &= J(vb(S)_1 dot vb(S)_2) + B(S_1^z + S_2^z) \ 
  & = J/2(vb(S)_(t o t)^2 - 3/2 hbar^2 II) + B S_z
  $
  The eigenstates are the same with different eigenvalues for energy. We can see that the introduction of the magnetic field
  dependence lifts the degeneracy we saw in the previous step. The Energy eigenvalues are given below\

  #underline("Singlet State") #h(3.0em)$ket(0","0) --> E_(0,0) = -3/4 J hbar^2$

  #underline("Triplet States")
  $ s=1 : cases(ket(1","1) &-->E_(1,1)=1/4 J hbar^2+B hbar,ket(1","1) &--> E_(1,1)=1/4 J hbar^2 ,ket(1","-1) &--> E_(1,-1)=1/4 J hbar^2 - B hbar) $
  
]
#answer[
  We have $J>0, B>0$. From the plot it be can be easily seen that the state $ket(1","-1)$ crosses the state
  $ket(0","0)$
  $ 1/4 J hbar^2 -B hbar = -3/4 J hbar^2 => B = J hbar $
  Before the crossing the ground state was $ket(0","0)$, which after crossing become $ket(1","-1)$. This causes 
  symmetry breaking. As we saw in Q1 $ket(0","0)$ has SU(2) symmetry, but $ket(1","-1)$ does not have 
  SU(2) symmetry. Thus the ground state no longer has SU(2) symmetry.

  #answer[
    If we take $J<0$, as shown in the graph, there is no "phase" transition taking place. $ket(1","-1)$ is
    always the ground state. In this case however, the ground state doesnt exhibit SU(2) symmetry.

    #h(1.0em) This can also be expected as 
    again if we consider the staggered magnetism operator, $ket(0","0)$ is an antiferromagnetic state. That means that the state has equal spins in opposite directions.
    However the state $ket(1","-1)$ is ferromagnetic and has a preferred direction. This causes symmetry breaking.
  ]
]




