# Este procedimiento calcula los polinomios de Bernstein de grado 'n' para un valor dado de 'u'.
# Devuelve una secuencia de valores de Bernstein desde B[0] hasta B[n].

proc computeBernsteinPolynomials(n: int, u: float): seq[float] =
  var
    B: seq[float]  # Secuencia dinámica para almacenar los resultados de los polinomios.
    ul, saved, temp: float  # Variables auxiliares para cálculos temporales.

  B.add(1.0)  # Inicializamos la secuencia con el primer valor B[0] = 1.0.

  ul = 1.0 - u  # Calculamos ul, que es 1.0 - u.

  for j in 0..n:  # Iteramos desde 1 hasta 'n' para calcular los polinomios de Bernstein.
    saved = 0.0  # Inicializamos saved en 0.0 para cada iteración.

    for k in 0..<j:  # Iteramos desde 0 hasta j-1 para calcular cada término del polinomio.
      temp = B[k]  # Almacenamos el valor actual de B[k] en temp.
      B.add(saved + ul * temp)  # Actualizamos B[k] con la suma acumulada y la multiplicación por ul.
      saved = u * temp  # Actualizamos saved multiplicando u por el valor temporal.

    B.add(saved)  # Agregamos el último valor calculado a la secuencia.

  result = B  # Devolvemos la secuencia de valores de Bernstein como resultado.

# Ejemplo de uso:
var n = 3  # Grado de los polinomios de Bernstein.
var u = 0.25  # Valor de 'u'.
var B = computeBernsteinPolynomials(n, u)  # Calculamos los polinomios de Bernstein.
echo B  # Imprimimos los valores de los polinomios de Bernstein calculados.

# El resultado es una secuencia (array dinámico) de los valores de los polinomios de Bernstein desde B[0] hasta B[n].
