#ALGORITMO HECHO EN CLASE A2 7/11/2023
import math

# Secuencia de valores de ejemplo
var U: seq[float64] = @[0.0, 0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 7.0, 7.0]

# Comentario sobre n=m-p-1
# Especifica la relación entre n, m, y p, aunque no se utiliza explícitamente en el código.

# Función para encontrar el "span" utilizando búsqueda binaria
proc findSpan(n: int, p: int, u: float64, U: seq[float64]): int =
  # Caso especial: si u es igual al último valor de U, retornar n
  if u == U[n + 1]:
    return n

  # Inicialización de variables para la búsqueda binaria
  var lw: int = p
  var hh: int = n + 1

  # Búsqueda binaria
  var mid: int = toInt(math.floor((lw + hh) / 2))
  echo "The mid ...", mid
  while u < U[mid] or u >= U[mid + 1]:
    if u < U[mid]:
      hh = mid
    else:
      lw = mid
    echo "The other mid...", lw, "<", mid, "<", hh
    mid = toInt(math.floor((lw + hh) / 2))

  # Resultado de la búsqueda binaria
  result = mid

# Llamada a la función con algunos valores de prueba
echo findSpan(8, 2, 2, U)
