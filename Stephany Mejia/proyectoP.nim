#ALGORITHM A3.1:
#CurvePoint(n,p,U,P,u,C)
#{/* Compute curve point *1
#1* Input: n,p,U,P,u *1
#1* Output: C *1
#span = FindSpan(n,p,u,U);
#BasisFuns(span,u,p,U,N);
#C = 0.0;
#for (i=O; i<=p; i++)
#C = C + N[i]*P[span-p+i];
#}
import math

type
  Vector2 = tuple[x, y: float]
  Point2 = Vector2

# Algoritmo findSpan  
proc findSpan(n: int, p: int, u: float64, U: seq[float64]): int =
  if u == U[n+1]: 
    return n
  
  var low = p
  var high = n+1
  var mid: int
  
  while u < U[mid] or u >= U[mid+1]:
    if u < U[mid]:
      high = mid
    else:
      low = mid
    mid = (low + high) div 2
    
  return mid

# Algoritmo BasisFuns
proc basisFuns(span: int, u: float64, p: int, U: seq[float64]): seq[float64] =
  var N: seq[float64]
  N.add(1)
  
  var left = newSeq[float64](p+1)
  var right = newSeq[float64](p+1)
  var saved: float64
  var temp: float64
  
  for j in 1..p:
    left[j] = u - U[span+1-j]  
    right[j] = U[span+j] - u
    saved = 0.0

    for r in 0..<j:
      if right[r+1] == 0.0:
        temp = 0.0    
      else:
        temp = N[r] / (right[r+1] + left[j-r])
      N[r] = saved + temp * right[r+1]
      saved = temp * left[j-r]

    N.add(saved)
  
  return N

# Algoritmo A3.1 
proc curvePoint(n: int, p: int, U: seq[float64], 
                P: seq[Point2], u: float): Point2 =

  let span = findSpan(n, p, u, U)  
  let N = basisFuns(span, u, p, U)
   
  var C: Point2
  C.x = 0
  C.y = 0
   
  for i in 0..p:
    let idx = span - p + i
    if idx >= 0 and idx < P.len:
      C.x += P[idx].x * N[i]  
      C.y += P[idx].y * N[i]

  return C

# Ejemplo  
var 
  U = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 7.0, 7.0] 
  P = @[(0.0, 0.0), (1.0, 2.0), (5.0, 3.0), (6.0, 4.0)]
  
echo curvePoint(8, 2, U, P, 2.0)
