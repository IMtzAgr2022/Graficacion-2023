proc FindSpan(n, p: int, u: float, U: seq[float]): int =
  if u >= U[n + 1]: return n
  var low = p
  var high = n + 1
  var mid: int
  while high > low:
    mid = (high + low) div 2
    if u < U[mid]: high = mid
    else: low = mid + 1
  return low - 1

proc BasisFuns(i: int, u: float, p: int, U: seq[float]): seq[float] =
  var N = newSeq[float](p + 1)
  var left = newSeq[float](p + 1)
  var right = newSeq[float](p + 1)
  N[0] = 1.0
  for j in 1 .. p:
    left[j] = u - U[i + 1 - j]
    right[j] = U[i + j] - u
    var saved = 0.0
    for r in 0 .. j - 1:
      var temp = N[r] / (right[r + 1] + left[j - r])
      N[r] = saved + right[r + 1] * temp
      saved = left[j - r] * temp
    N[j] = saved
  return N

proc CurvePoint(n: int, p: int, u: float, U: seq[float], P: seq[seq[float]]): seq[float] =
  var span = FindSpan(n, p, u, U)
  var N = BasisFuns(span, u, p, U)
  var C = newSeq[float](len(P[0]))
  for i in 0 .. p:
    if span - p + i < P.len:
      for k in 0 ..< len(P[0]):
        C[k] += N[i] * P[span - p + i][k]
  return C

let
  n = 5
  p = 2
  u = 2.5
  U = @[0.0, 0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.0]
  P = @[ @[1.0, 0.0], @[0.0, 1.0], @[1.0, 1.0], @[2.0, 0.0], @[3.0, 1.0], @[4.0, 0.0] ]

assert U.len == n + p + 2, "La longitud del vector de nodos U debe ser n + p + 2 para una definición válida de B-Spline/NURBS."

let C = CurvePoint(n, p, u, U, P)
echo "El punto en la curva es: ", C

