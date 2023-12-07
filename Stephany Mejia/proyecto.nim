import math
import plotly
import chroma
import sequtils

type
  Vector2 = tuple[x, y: float]
  Point2 = Vector2

# Algoritmo findSpan
proc findSpan(n: int, p: int, u: float64, U: seq[float64]): int =
  if u == U[n + 1]:
    return n

  var low = p
  var high = n + 1
  var mid: int
  
  while u < U[mid] or u >= U[mid + 1]:
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
  
  var left = newSeq[float64](p + 1)
  var right = newSeq[float64](p + 1)
  var saved: float64
  var temp: float64

  for j in 1..p:
    left[j] = u - U[span + 1 - j]  
    right[j] = U[span + j] - u
    
    saved = 0.0
    for r in 0..<j:
      if right[r + 1] == 0.0: 
        temp = 0.0
      else:
        temp = N[r] / (right[r + 1] + left[j - r])
      N[r] = saved + temp * right[r + 1]
      saved = temp * left[j - r]

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
  
# Función para graficar la curva resultante con Plotly
proc plotCurve(n: int, p: int, U: seq[float64], P: seq[Point2]): auto =

  let numPoints = 100
  let deltaU = (U[n + 1] - U[p]) / float64(numPoints - 1)
  
  var xData: seq[float64]
  var yData: seq[float64]

  for i in 0..numPoints - 1:
    let u = U[p] + float64(i) * deltaU
    let point = curvePoint(n, p, U, P, u)
    xData.add(point.x)
    yData.add(point.y)
  
  let scatterTrace = Trace[float64](mode: PlotMode.Lines, `type`: PlotType.Scatter)
  scatterTrace.xs = xData
  scatterTrace.ys = yData
  
  let layout = Layout(title: "CurvePoint",  
                     width: 800, height: 600,
                     xaxis: Axis(title: "x-axis"),
                     yaxis: Axis(title: "y-axis"))
  
  let plot = Plot[float64](layout: layout, traces: @[scatterTrace])
  
  echo plot.save()
  plot.show()

# Ejemplo
var 
  U = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 7.0, 7.0]
  P = @[(0.0, 3.0), (1.0, 2.0), (5.0, 3.0), (7.0, 4.0)]  

# Graficar 
plotCurve(8, 2, U, P)
