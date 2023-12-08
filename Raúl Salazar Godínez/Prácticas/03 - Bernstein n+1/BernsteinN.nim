# función   nombre_función  (parámetros):   tipo de dato que la función devuelve = indica comienzo de la función
proc BernsteinN(n: int, u: float): seq[float] =
# La función toma dos argumentos, "n" y "u"
# "n"= el grado máximo de los polinomios Bernstein que se desean calcular
# "u" = valor en el que se evalua el polinomio
  var B: seq[float] = newSeq[float](n + 1)
  #var B: seq[float] = newSeq[float](float64(n) + 1, 0.0)
  #var B: seq[float] = newSeq[float](int(float64(n) + 1), 0.0)
  # la variable B es una secuencia de flotantes, esta secuencia se inicializa con una longitud de
  # n + 1 y se llena con el valor 0.0. Esto crea un arreglo que contendrá los coeficientes de los polinomios Bernstein.
  B[0] = 1.0    # El primer elemento de la secuencia B en 1.0  porque el polinomio Bernstein de grado 0 siempre es igual a 1
  var ul = 1.0 - u

  for j in 1..n:
    var saved = 0.0
    for k in 0..<j: #va desde k = 0 hasta k = j - 1
      var temp = B[k]
      B[k] = saved + ul * temp
      saved = u * temp
    B[j] = saved

  return B

var n = 5  # Grado del polinomio
var u = 0.25
var B = BernsteinN(n, u)

echo "Los Polinomios Bernstein para u =", B

