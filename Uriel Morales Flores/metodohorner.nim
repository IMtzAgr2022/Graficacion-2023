# Definición de un procedimiento llamado "horner" que toma un polinomio y un valor "x"
proc horner(polinomio: seq[float], x: float): float =
    var resultado: float = 0.0
    for coef in polinomio:
        resultado = resultado * x + coef
    return resultado
# Definición de los coeficientes del polinomio en una secuencia
var coeficientes = @[2.0, -3.0, 1.0]
# Definición del valor de "x" para evaluar el polinomio
var valorX = 3.0
# Llamada al procedimiento "horner" con los coeficientes y el valor "x"
let resultado = horner(coeficientes, valorX)
# Impresión del resultado de la evaluación del polinomio
echo "Resultado Horner:", resultado

#nim c -r horner.nim
