#Proyecto Final:Graficación Computacional
#Elaboró: Erick López González

import plotly
type
  Vector2 = tuple[x, y: float]
  Point2 = Vector2

var C: Point2
C.x = 0
C.y = 0
# ALGORITHM A2.1 FindSpan  
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

# ALGORITHM A2.2 BasisFuns
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

# ALGORITHM A3.1 CurvePonit 
proc curvePoint(n: int, p: int, U: seq[float64], 
                P: seq[Point2], u: float): Point2 =

  let span = findSpan(n, p, u, U)  
  let N = basisFuns(span, u, p, U)
  var d = Trace[float](mode: PlotMode.LinesMarkers, `type`: PlotType.Scatter)
#  var C: Point2
#  C.x = 0
#  C.y = 0
  
  for i in 0..p:
    let idx = span - p + i
    if idx >= 0 and idx < P.len:
      C.x += P[idx].x * N[i]  
      C.y += P[idx].y * N[i]
# Plot
  d.xs = @[C.x]
  d.ys = @[C.y]
  d.text = @["Point"]

  var layout = Layout(title: "Curve Point", width: 1200, height: 400,
                      xaxis: Axis(title:"Rango"),
                      yaxis:Axis(title: "Resultado"), autosize:false)
  var p = Plot[float](layout:layout, traces: @[d])
  p.show()
  return C

# Example   
var 
  U = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 7.0, 7.0] 
  P = @[(0.0, 0.0), (1.0, 2.0), (5.0, 3.0), (6.0, 4.0)]
  
echo curvePoint(8, 5, U, P, 2.0)
