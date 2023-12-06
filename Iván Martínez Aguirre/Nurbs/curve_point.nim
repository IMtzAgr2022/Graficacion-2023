# Define la función FindSpan que determina el índice del tramo de nudo (span) en el vector de nodos U.
proc FindSpan(n, p: int, u: float, U: seq[float]): int =
  # Si el valor u es igual al último valor en el rango de influencia, devuelve el índice máximo.
  if u >= U[n+1]:
    return n

  # Inicializa los índices para la búsqueda binaria.
  var low = p
  var high = n + 1
  var mid: int

  # Realiza la búsqueda binaria para encontrar el tramo del nudo.
  while high > low:
    mid = (high + low) div 2
    if u < U[mid]:
      high = mid
    else:
      low = mid + 1

  # Devuelve el índice del tramo de nudo encontrado.
  return low - 1

# Define la función BasisFuns que calcula las funciones base no nulas para un valor u dado.
proc BasisFuns(i: int, u: float, p: int, U: seq[float]): seq[float] =
  # Inicializa la secuencia de funciones base y los vectores auxiliares 'left' y 'right'.
  var N = newSeq[float](p+1)
  var left = newSeq[float](p+1)
  var right = newSeq[float](p+1)
  N[0] = 1.0

  # Calcula las funciones base utilizando el algoritmo de De Boor-Cox.
  for j in 1 .. p:
    left[j] = u - U[i+1-j]
    right[j] = U[i+j] - u
    var saved = 0.0

    for r in 0 .. j-1:
      var temp = N[r] / (right[r+1] + left[j-r])
      N[r] = saved + right[r+1]*temp
      saved = left[j-r]*temp

    N[j] = saved

  # Devuelve la secuencia de funciones base calculadas.
  return N

# Define la función CurvePoint que calcula un punto en la curva B-Spline/NURBS.
proc CurvePoint(n: int, p: int, u: float, U: seq[float], P: seq[seq[float]]): seq[float] =
  # Encuentra el tramo de nudo y calcula las funciones base para el valor u.
  var
    span = FindSpan(n, p, u, U)
    N = BasisFuns(span, u, p, U)
    C = newSeq[float](len(P[0]))

  # Suma las contribuciones de los puntos de control ponderados por las funciones base para obtener el punto en la curva.
  for i in 0 .. p:
    if span-p+i < P.len:
      for k in 0 ..< len(P[0]):
        C[k] += N[i] * P[span-p+i][k]

  # Devuelve el punto calculado en la curva.
  return C

# Aquí se define el ejemplo de uso con los parámetros específicos de la curva y se ejecuta la función CurvePoint.
let
  n = 5  # El índice del último punto de control.
  p = 2  # El grado de la curva B-Spline/NURBS.
  u = 2.5  # El valor del parámetro en el cual se evaluará la curva.
  U = @[0.0, 0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.0]  # El vector de nodos ajustado.
  P = @[ @[1.0, 0.0], @[0.0, 1.0], @[1.0, 1.0], @[2.0, 0.0], @[3.0, 1.0], @[4.0, 0.0] ] # Los puntos de control de la curva.

# Verifica que la longitud del vector de nodos es correcta.
assert(U.len == n + p + 2, "La longitud del vector de nodos U debe ser n + p + 2 para una definición válida de B-Spline/NURBS.")

# Calcula el punto en la curva y lo muestra.
let C = CurvePoint(n, p, u, U, P)
echo "El punto en la curva es: ", C
