# Definición del procedimiento bernstein que calcula el valor de un polinomio de Bernstein.
# Entrada: i, n, u
# Salida: B
proc bernstein(i: int, n: int, u: float, B: var float) =
  var temp: array[0..100, float]  # Array temporal para almacenar los valores intermedios
  for j in 0..n:
    temp[j] = 0.0  # Inicializar las columnas de la Tabla 1.1 en el array temporal
  temp[n - i] = 1.0  # Establecer un valor específico en el array temporal
  
  let ul = 1.0 - u
  for k in 1..n:
    for j in n-k+1..n:  # Corrección: Asegurarse de que j no sea igual a 0
      temp[j] = ul * temp[j] + u * temp[j - 1]
  
  B = temp[n]

# Punto de entrada del programa.
when isMainModule:
  var i = 2    # Valor de i
  var n = 5    # Valor de n
  var u = 0.75 # Valor de u
  var result: float
  
  # Llamamos al procedimiento bernstein para calcular el resultado.
  bernstein(i, n, u, result)
  
  # Mostramos el resultado por pantalla.
  echo "Resultado:", result
