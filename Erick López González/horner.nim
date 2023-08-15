# Tarea 1: Implementar evaluación de polinomios de cualquier grado utilizando la técnica horner en el lenguaje nim
# Erick López González 
proc evaluarpolinomios(coeficientes: seq[float], x: float): float =
    var resultado: float = 0.0
    for coef in coeficientes:
        resultado = resultado * x + coef
    return resultado

# Ejemplo: Evaluar x= 5 el polinomio 4x^3 + 3x^2 - 2x + 1
let coeficientes: seq[float] = @[4.0, 3.0, -2.0, 1.0]  # Coeficientes del polinomio: 4x^3 + 3x^2 - 2x + 1
let x: float = 5.0  #x=5

let resultado = evaluarpolinomios(coeficientes, x)
echo "Utilizando la técnica horner el resultado de evaluar el polinomio en x=", x, " es: ", resultado
