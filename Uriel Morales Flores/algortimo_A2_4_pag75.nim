# ALGORITHM A2.4  de pagina 75
# {/* ComputN[O]e the basis function Nip
# 1* Input: p,m,U,i,u *1
# 1* Output: Nip 

proc oneBasisFun(p: int, m: int, U: seq[float64], i: int , u: float64): float64 =
  var Nip: float64
  var N: seq[float64]
  if (i == 0 and u == U[0]) or  (i == m-p-1 and u == U[m]):
    Nip = 1.0
  if (u < U[i] or u >= U[i+p+1]):
    Nip = 0.0;
  for j in 0..p:
    if (u >= U[i+j] and u < U[i+j+1]):
      N.add(1.0)
    else:
      N.add(0.0)

  var temp:   float64
  var Uleft:  float64
  var Uright: float64
  var saved:  float64
  for k in 1..p:
    if (N[0] == 0.0):
      saved = 0.0
    else:
      saved = ((u-U[i])*N[0])/(U[i+k]-U[i])
    for j in 0..<p-k+1:
      Uleft = U[i+j+1]
      Uright = U[i+j+k+1]
      if (N[j+1] == 0.0):
        N[j]=saved
        saved = 0.0
      else:
        temp = N[j+1]/(Uright-Uleft)
        N[j]=saved+(Uright-u)*temp
        saved = (u-Uleft)*temp
  Nip=N[0]
  echo Nip,"\t", N[0]
  result=Nip

var U: seq[float64] = @[0.0,0.0,0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,7.0,7.0]
#proc oneBasisFun(p,m,U,i,u):
var i: int = 1
var p: int = 2
var m: int = 11 
var u: float64 = 1.5
echo "N",i,p,"=",oneBasisFun(p,m,U,i,u)
