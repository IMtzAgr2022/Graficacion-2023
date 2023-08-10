# Definición de una función llamada 'evaluarPolinomioHorner' que toma dos argumentos:
# - 'x', un valor flotante que representa el punto en el que se evalúa el polinomio.
# - 'coeficientes', una secuencia (arreglo dinámico) de valores flotantes que son los coeficientes del polinomio.
# La función utiliza el método de Horner para evaluar el polinomio en el punto dado 'x'.
proc evaluarPolinomioHorner(x: float, coeficientes: seq[float]): float =
    var resultado: float = 0.0  # Variable que almacenará el resultado de la evaluación.
    # Iteramos sobre los coeficientes en orden inverso (método de Horner).
    for coef in coeficientes:
        resultado = resultado * x + coef  # Acumulamos el resultado de la evaluación.
    return resultado  # Devolvemos el resultado final de la evaluación del polinomio.

# Definición de constantes 'a', 'b' y 'c' que representan los coeficientes para los ejemplos de polinomios.
const a = 2.0
const b = 3.0
const c = 4.0

# Ejemplo de uso para un polinomio de grado 1: f(x) = ax + b
var coeficientesGrado1: seq[float] = @[b, a]  # Coeficientes del polinomio de grado 1.
var xGrado1: float = 2.0  # Punto en el que se evaluará el polinomio de grado 1.

# Imprimimos el mensaje y el resultado de evaluar el polinomio de grado 1 en el punto dado.
echo "Para x =", xGrado1, "el valor del polinomio de grado 1 es:", evaluarPolinomioHorner(xGrado1, coeficientesGrado1)

# Ejemplo de uso para un polinomio de grado 2: f(x) = ax^2 + bx + c
var coeficientesGrado2: seq[float] = @[c, b, a]  # Coeficientes del polinomio de grado 2.
var xGrado2: float = 3.0  # Punto en el que se evaluará el polinomio de grado 2.

# Imprimimos el mensaje y el resultado de evaluar el polinomio de grado 2 en el punto dado.
echo "Para x =", xGrado2, "el valor del polinomio de grado 2 es:", evaluarPolinomioHorner(xGrado2, coeficientesGrado2)
