#Crear un programa que implemente la evaluación de polinomios de cualquier grado en NIM usando la tecnica horner

# función   nombre_función  (parámetros):   tipo de dato que la función devuelve = indica comienzo de la función
proc evaluarPolinomio(polinomio: seq[float], x: float): float =
    
    # evaluarPolinomio mi función toma dos argumentos:
    # polinomio, es una secuencia de coeficientes del polinomio
    # x, es el valor en el que se desea evaluar el polinomio. 
    
    var resultado: float = 0.0
    
    # inicializo la variable "resultado" en 0.0. porque dada la formula "P(x) = (((an * x + an-1) * x + an-2) * x + ... + a2) * x + a1) * x + a0"
    # en cada paso, se debe multiplicar el resultado acumulado por "x" y luego se suma el coeficiente correspondiente del polinomio. 
    # Al inicio el resultado acumulado es 0, por lo que la primera multiplicación (resultado * x) no cambia el resultado, y solo debo sumar a0
    
    for coeficiente in polinomio:
        resultado = resultado * x + coeficiente
    return resultado

#La función "let" me permite definir constantes. Nim es de tipado estático por lo que debería definir el tipo de dato al asignar una variable
# Si yo defino mi polinomio: 4x^3 + 3x^2 - 5x + 7 y lo evaluo en "2"
let coeficientes = @[4.0, 3.0, -5.0, 7.0]
let valorX = 2.0

let resultado = evaluarPolinomio(coeficientes, valorX)
#echo = print 
echo "El resultado de evaluar el polinomio en x = ", valorX, " es: ", resultado


