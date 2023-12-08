# ALGORITHM A2.1
# int FindSpan(n,p,u,U)
# {/* Determine the knot span index */
# /* Input: n,p,u,U */
# /* Return: the knot span index */

import math

var U: seq[float64] = @[0.0, 0.1, 0.3, 1.0, 1.0, 1.0, 1.0]      # puntos de control random

proc findSpan(n: int, p: int, u: float64, U: seq[float64]): int =
    # n = puntos de control
    # p = grado del polinomio
    # u = punto de evaluación
    # U = secuencia de nodos (definen los puntos donde la función de base o la curva cambian su influencia

    if u == U[n + 1]:   #  Si u es igual al último nodo "U[n + 1]" de la secuencia U
        return n        #  Devolver "n" en este caso tiene sentido, ya que "n" representa el índice del último punto de control
    # si u es igual al último nodo, esto indica que se está evaluando en el extremo derecho de la curva o superficie B-spline

    var loww, highh, mid: int
    loww = p
    highh = n + 1       # "n+1" (la longitud de la secuencia de nodos más 1)
    # /* Do binary search */
    mid = int(ceil(float64(loww + highh) / 2))      # representa la mitad del rango de búsqueda inicial
    #mid = ceil((loww + highh) / 2) #Error: type mismatch: got 'float64' for 'ceil((loww + highh) / 2)' but expected 'int'
    echo "The mid ...", mid

    #El nodo mid "U[mid]"
    while u < U[mid] or u >= U[mid + 1]:
        if u < U[mid]:      # Si "u" es menor que "U[mid]", se actualiza highh a mid
            highh = mid
        else:
            loww = mid
        #mid = ceil((loww + highh) / 2)
        mid = int(ceil(float64(loww + highh) / 2))
    result = mid        #el resultado de la función es el valor de mid, que representa el índice del intervalo de nodos en el que se encuentra el punto de evaluación 

echo findSpan(5, 3, 0.3, U)
# dcon estos valores, "u" se encuentra en el intervalo con índice 5