# Definición del procedimiento horner1 que calcula un punto en una curva de base de potencias.
# Entrada: a, n, uO
# Salida: C
proc horner1(a: seq[int], n: int, uO: int, C: var int) =
  C = a[n]
  # Iteramos a través de los coeficientes del polinomio en orden descendente.
  for i in countDown(n - 1, 0):
    # Actualizamos C utilizando la fórmula de Horner.
    C = C * uO + a[i]

# Punto de entrada del programa.
when isMainModule:
  # Coeficientes del polinomio en el orden a0, a1, a2, ..., an
  var coefficients = @[2, 3, 1, 0]
  
  # Grado del polinomio (n)
  var n = coefficients.len - 1
  
  # Valor de uO
  var uO = 2
  
  # Variable para almacenar el resultado del cálculo
  var result: int
  
  # Llamamos al procedimiento Horner1 para calcular el resultado.
  horner1(coefficients, n, uO, result)
  
  # Mostramos el resultado por pantalla.
  echo "Resultado:", result
