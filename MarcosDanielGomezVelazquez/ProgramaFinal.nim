# Creado por Marcos Daniel Gómez Velazquez
# Para cambiar los valores del programa, modificar las variables de abajo
var U: seq[float64] = @[0.0, 0.1, 0.3, 1.0, 1.0, 1.0, 1.2]
var P: seq[seq[float64]] = @[@[2.0, 3.0], @[1.0, 1.0], @[3.0, 1.0], @[1.0, 5.0]]
var n = 5
var p = 2
var u = 0.4
var i = 2
proc findSpan(n, p: int, u: float64, U: seq[float64]): int =
  var lowq, highq, mid: int
  if u == U[n+1]:
    return n
  lowq = p
  highq = n + 1
  mid = (lowq + highq) div 2
  echo "The mid...", mid
  while (u < U[mid] or u >= U[mid+1]):
    if u < U[mid]:
      highq = mid
    else:
      lowq = mid
    mid = (lowq + highq) div 2
    if highq == lowq:
        break
  return mid
echo findSpan(n,p,u,U)

proc BasisFuns(i: int, u: float64, p: int, U: seq[float64]): seq[float64] =
  var N: seq[float64] = newSeq[float64](p+1)
  var left: seq[float64] = newSeq[float64](p+1)
  var right: seq[float64] = newSeq[float64](p+1)
  var saved, temp: float64
  N[0] = 1.0
  for j in 1..p:
    left[j] = u - U[i+1-j]
    right[j] = U[i+j] - u
    saved = 0.0
    for r in 0..<j:
      temp = N[r] / (right[r+1] + left[j-r])
      N[r] = saved + right[r+1] * temp
      saved = left[j-r] * temp
    N[j] = saved
  return N
echo BasisFuns(i,u,p,U)    

proc CurvePoint(n, p: int, U: seq[float64], P: seq[seq[float64]], u: float64): seq[seq[float64]] =
  var span: int = findSpan(n,p,u,U)
  echo span
  var N: seq[float64] = BasisFuns(span,u,p,U)
  var C: seq[seq[float64]] = newSeq[seq[float64]](p+1)
  for i in 0..p:
    C[i].add(P[span-p+i][0] * N[i])
    C[i].add(P[span-p+i][1] * N[i])
  return C
echo CurvePoint(n,p,U,P,u)