module BisectionMethod
use Utils
implicit none
contains
 
integer function MinIterations(a,b,f,errorX)
real*8 :: a,b,errorX,aux
external :: f
aux=(log(abs(b-a))-log(errorX))/log(2)
MinIterations=ceiling(aux)
end function MinIterations

real*8 function Bisection(a,b,f,errorX,errorY,maxIter)
real*8 :: a,b,errorX,errorY,m
integer :: maxIter,i
external :: f

call BolzanoTheorem(a,b,f)

do i=1,maxIter
  m=(a+b)/2
  if(abs(b-a)<errorX.or.abs(f(m))<errorY)then
    exit
  end if

  if(f(m)==0)then
    exit
  else if(f(m)*f(a)<0)then
    b=m
  else
    a=m
  end if
end do

Bisection=m


end function Bisection
end module BisectionMethod