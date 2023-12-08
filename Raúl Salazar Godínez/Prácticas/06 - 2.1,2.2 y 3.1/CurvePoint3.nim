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

# Función que encuentra el índice del intervalo de nodos
proc FindSpan(n: int, p: int, u: float64, U: seq[float64]): int =
    if u == U[n + 1]:
        return n

    var loww, highh, mid: int
    loww = p
    highh = n + 1
    mid = int(ceil(float64(loww + highh) / 2))

    while u < U[mid] or u >= U[mid + 1]:
        if u < U[mid]:
            highh = mid
        else:
            loww = mid
        mid = int(ceil(float64(loww + highh) / 2))
    
    result = mid

# Función que calcula las funciones de base no nulas
proc BasisFuns(i: int, u: float64, p: int, U: seq[float64]): seq[float64] =
    var N: seq[float64] = newSeq[float64](p + 1)
    var left, right: seq[float64] = newSeq[float64](p + 1)
    var temp, saved: float64

    N[0] = 1.0

    for j in 1..p:
        left[j] = u - U[i + 1 - j]
        right[j] = U[i + j] - u
        saved = 0.0

        for r in 0..<j:
            let divisor = right[r + 1] + left[j - r]
            if divisor != 0.0:
                temp = N[r] / divisor
                N[r] = saved + right[r + 1] * temp
                saved = left[j - r] * temp
            else:
                temp = 0.0
                N[r] = 0.0
                saved = 0.0

        N[j] = saved

    result = N

# Función que calcula un punto en la curva B-spline
proc CurvePoint(n: int, p: int, U: seq[float64], P: seq[float64], u: float64): float64 =
    var span: int
    #var N: seq[float64] = newSeq[float64](p + 1)
    var N: seq[float64] = BasisFuns(span, u, p, U)
    span = FindSpan(n, p, u, U)


    var C: float64 = 0.0

    for i in 0..p:
        C += N[i] * P[span - p + i]

    result = C

# Datos de ejemplo
var U: seq[float64] = @[0.0, 0.1, 0.3, 1.0, 1.0, 1.0, 1.0]
var P: seq[float64] = @[0.0, 0.0, 1.0, 2.0, 3.0, 1.0, 4.0, 0.0, 5.0, 0.0]
var n: int = 5
var p: int = 2
var u: float64 = 2.5

# Uso de la función 
var resultado: float64  = CurvePoint(n, p, U, P, u)
echo "Antes de imprimir el resultado"
echo "Resultado:", resultado
echo "Después de imprimir el resultado"

# Datos de ejemplo
    #var U: seq[float64] = @[0.0, 0.1, 0.3, 1.0, 1.0, 1.0, 1.0]
    #var P: seq[float64] = @[0.0, 0.0, 1.0, 2.0, 3.0, 1.0, 4.0, 0.0, 5.0, 0.0]
    #var n: int = 5
    #var p: int = 2
    #var u: float64 = 2.5

# Uso de la función 
    #var resultado: float64 = CurvePoint(n, p, U, P, u)
    #echo "Resultado:", resultado