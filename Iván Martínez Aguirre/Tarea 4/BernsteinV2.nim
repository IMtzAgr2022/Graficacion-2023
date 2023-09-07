proc computeBernsteinPolynomials(n: int, u: float): seq[float] =
  var
    B: seq[float] = @[1.0]  # Inicializamos la secuencia con el primer valor B[0] = 1.0.
    saved, temp: float  # Variables auxiliares para cálculos temporales.

  let ul = 1.0 - u  # Calculamos ul, que es 1.0 - u.

  for j in 1..n:  # Corregimos el rango de iteración desde 1 hasta 'n'.
    saved = 0.0  # Inicializamos saved en 0.0 para cada iteración.

    for k in 0..j:  # Iteramos desde 0 hasta j para calcular cada término del polinomio.
      temp = B[k]  # Almacenamos el valor actual de B[k] en temp.
      B.add(saved + ul * temp)  # Actualizamos B[k] con el valor calculado.
      saved = u * temp  # Actualizamos saved multiplicando u por el valor temporal.

  let result = B[0..n]  # Limitamos la secuencia a n + 1 valores.
  result

# Ejemplo de uso:
let n = 3  # Grado de los polinomios de Bernstein.
let u = 0.25  # Valor de 'u'.
let B = computeBernsteinPolynomials(n, u)  # Calculamos los polinomios de Bernstein.

# Mostramos los valores de los polinomios de Bernstein.
for i, value in B:
  echo "B[", i, "] =", value

echo "\nLos valores para B son: ", B
