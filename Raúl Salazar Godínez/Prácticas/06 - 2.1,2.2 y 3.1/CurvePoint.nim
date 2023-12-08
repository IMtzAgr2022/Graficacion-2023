# ALGORITHM A3.1:
# CurvePoint(n.p.U.P.u.C)
# {/* Compute curve point *1
# 1* Input: n.p.U.P.u *1
# 1* Output: C *1
# span = FindSpan(n,p,u.U);
# BasisFuns(span,u.p,U.N);
# C = 0.0;
# for (i=O; i<=p; i++)
# C = C + N[i]*P[span-p+i];
# }

import math
proc FindSpan(n: int, p: int, u: float64, U: seq[float64]): int =
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
    #echo "The mid ...", mid

    #El nodo mid "U[mid]"
    while u < U[mid] or u >= U[mid + 1]:
        if u < U[mid]:      # Si "u" es menor que "U[mid]", se actualiza highh a mid
            highh = mid
        else:
            loww = mid
        #mid = ceil((loww + highh) / 2)
        mid = int(ceil(float64(loww + highh) / 2))
    result = mid        #el resultado de la función es el valor de mid, que representa el índice del intervalo de nodos en el que se encuentra el punto de evaluación 


# Función que calcula las funciones de base no nulas

proc  BasisFuns(i: int, u: float64, p:int, U: seq[float64]): seq[float64] =
    # evolver una secuencia de valores que representan las funciones de base no nulas en el punto u
    # la función devuelve una secuencia de valores que representan las funciones de base no nulas en el punto u

    var N: seq[float64] = newSeq[float64](p+1)      # secuencia que almacena los valores de las funciones de base no nulas
    var left: seq[float64] = newSeq[float64](p+1)   # almacena terminos intermedios durante los cálculos
    var right: seq[float64] = newSeq[float64](p+1)  
    var temp: float64       # variable temporal, almacena resultados parciales de las iteraciones
    var saved: float64

    N[0]=1.0        # El primer valor de Ninicia con 1.0 (la primera función de base siempre es 1)
    for j in 1..p:  # Iterando desde 1 hasta p 
        left[j] = u - U[i+1-j]
        right[j] = U[i+j] - u
        saved = 0.0

        for r in 0..<j:
            let divisor = right[r+1] + left[j-r]    # cambié un poco la estructura, el divisor (right[r+1] + left[j-r])
            if divisor != 0.0:      # primero verifcio si es diferente de cero el divisor, para no tener resultados NaN y Inf poruqe indican problemas con la división por cero o alguna otra operación que está produce resultados indefinidos
                temp = N[r] / divisor       # 
                N[r] = saved + right[r+1] * temp
                saved = left[j-r] * temp
            else:       # Si el divisor es diferente de cero, se calculan los términos, de lo contrario, los hago a cero
                temp = 0.0
                N[r] = 0.0
                saved = 0.0
            #temp = N[r] / (right[r+1] + left[j-r])
            #N[r] = saved+right[r+1]*temp
            #N[r] = saved + right[r+1] * temp
            #saved = left[j-r] * temp
            echo "j=", j, " r=", r, " temp=", temp, " saved=", saved    # para ver que caraj#s estoy imprimiendo
        N[j] = saved        # se guarda el último valor calculado en la secuencia N
    result = N              # el resultado final de la función es la secuencia N, que contiene los valores de las funciones de base no nulas

proc CurvePoint(n: int, p: int, U: seq[float], P: seq[seq[float]], u: float): seq[float] =

    #var span: int
    #span = FindSpan(n, p, u, U)
    #var N: seq[float64] = BasisFuns(span, u, p, U)
    #var N: seq[float64] = BasisFuns(span, u, p, U)
    var span = FindSpan(n, p, u, U)
    var N = BasisFuns(span, u, p, U)

    # Impresión de los datos de la función
    echo "span:", span
    echo "N:", N
    echo "P:", P

    var C = newSeq[float](len(P[0]))
    # for i in 0..p - 1:    Error: unhandled exception: index -1 not in 0 .. 6 [IndexDefect]
    # for i in 0..<p:       Error: unhandled exception: index -1 not in 0 .. 6 [IndexDefect]
    for i in 0..p:
        if span - p + i < P.len:
            for k in 0 ..< len(P[0]):
                C[k] += N[i] * P[span - p + i][k]
                #C += N[i] * P[span - p + i]
    return C

# Datos de ejemplo
#var U: seq[float] = @[0.0, 0.1, 0.3, 1.0, 1.0, 1.0, 1.0, 2.0, 3.0]
var U: seq[float] = @[0.0, 0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.0]
#var P: seq[float64] = @[0.0, 0.0, 1.0, 2.0, 3.0, 1.0, 4.0]
#var P: seq[seq[float]] = @[ @[0.0, 0.0], @[1.0, 2.0], @[3.0, 1.0], @[4.0, 0.0], @[5.0, 6.0], @[7.0, 8.0] ]
var P: seq[seq[float]] = @[ @[1.0, 0.0], @[0.0, 1.0], @[1.0, 1.0], @[2.0, 0.0], @[3.0, 1.0], @[4.0, 0.0] ]
var n: int = 5
var p: int = 2
var u: float64 = 2.5

# Uso de la función
#var resultado: float64 = CurvePoint(n, p, U, P, u)
#var resultado: seq[float] = CurvePoint(n, p, U, P, u)
var resultado: seq[float] = CurvePoint(n, p, U, P, u)

# Impresión del resultado
echo "El Resultado final es el siguiente:", resultado