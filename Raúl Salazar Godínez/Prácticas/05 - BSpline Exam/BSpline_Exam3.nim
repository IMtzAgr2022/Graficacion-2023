
proc BSpline(i, p: int, u: float, U: seq[float]): float =
    # i: es el incide, representa una posición en la secuencia U
    # p: es el grado o nivel de recursión en el algoritmo
    # u: un número que deseo calcular en la función
    # U: representa los puntos de la función

    if i < 0 or i >= U.len: #.len se utiliza para obtener la longitud de una secuencia
        return 0.0
    # si el valor de i está fuera de los límites válidos en la secuencia U
    # si i es "menor que cero" o "mayor o igual a la longitud de U", la función devuelve 0, no se puede calcular la formula en este caso

    if u < U[i] or u >= U[i + p + 1]:
        return 0.0

    # si el valor u está fuera de los límites por los puntos en U
    # Si u es "menor que el valor en la posición i" o "mayor o igual al valor en la posición i + p + 1" 
    # la función también devuelve 0, no se puede calcular la formula en este caso

    if p == 0:
        if U[i] <= u and u < U[i + 1]:
            return 1.0
        else:
            return 0.0

    # si p es igual a cero, es el nivel más bajo de recursió
    # se verifica si u está dentro de un rango específico definido por los nodos en U, si es así, devuelve 1.0, de lo contrario, devuelve 0.0.

    var ladoIzq: float
    if U[i + p] - U[i] > 0: # evita la división por cero
        ladoIzq = (u - U[i]) / (U[i + p] - U[i]) * BSpline(i, p - 1, u, U) #si la diferencia es mayor que cero se calucla
    else:
        ladoIzq = 0.0

    # calculando "lado izquierdo", Si la diferencia entre los nodos en U (U[i + p] - U[i]) es mayor que cero
    # se calcila  "ladoIzq" Si la diferencia es cero, se deja "ladoIzq" en 0.0 para evitar problemas de "nan" not a niuber
    # se reduce p en 1 para avanzar en la recursión y calcular la función en una posición diferente (N(i,p-1))
    
    var ladoDer: float
    if U[i + p + 1] - U[i + 1] > 0: # verificr si la diferencia entre los puntos en U es mayor que cero antes de realizar el cálculo
        ladoDer = (U[i + p + 1] - u) / (U[i + p + 1] - U[i + 1]) * BSpline(i + 1, p - 1, u, U)
    else:
        ladoDer = 0.0

    return ladoIzq + ladoDer # combinar las partes

# Ejemplo de uso con U = {0, 0, 0, 1, 1, 1}
let U = @[0.0, 0.0, 0.0, 1.0, 1.0, 1.0]
let p = 2
let u = 0.5
let i = 1

let resultado = BSpline(i, p, u, U)
echo "Resultado de N(i,p)(", u, ") =", resultado
