# ALGORITHM A2.2
# BasisFuns(i,u,p,U,N)
# {/* Compute the nonvanishing basis functions */
# /* Input: i,u,p,U */
# /* Output: N */

var U: seq[float64] = @[0.0, 0.0, 0.0, 1.0, 1.0, 1.0]   # secuencia de puntos de control
var p: int = 2  # grado del polinomio
var i: int = 1  # es el índice
var u: float64 = 0.5    # punto en el que estoy evaluando

proc  basisFuns(i: int, u: float64, p:int, U: seq[float64]): seq[float64] =
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
echo basisFuns(i, u, 2, U)

# sobre el "p+1", las secuencias comienzan desde el índice 0,
# cuando defino una secuencia de tamaño "p+1", los índices válidos son 0, 1, 2, ..., p
# Entonces, para almacenar "p+1" elementos, la secuencia debe tener un tamaño de p+1. 
# cuando intenté acceder a N[p+1] en una secuencia de tamaño p, tuve un error de Wíndice fuera de límites" "index out the bounds" porque el índice máximo sería p