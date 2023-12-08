# Este archivo es la fusión de 
# FindSpan (FS)  ALGORITHM A2.1
# BasisFuns (BF) ALGORITHM A2.2

import math

var U: seq[float64] = @[0.0, 0.1, 0.3, 1.0, 1.0, 1.0, 1.0]

proc findSpan(n: int, p: int, u: float64, U: seq[float64]): int =
    if u == U[n + 1]:
        return n
    var loww, highh, mid: int
    loww = p
    highh = n + 1
    mid = int(ceil(float64(loww + highh) / 2))
    echo "The mid ...", mid

    while u < U[mid] or u >= U[mid + 1]:
        if u < U[mid]:
            highh = mid
        else:
            loww = mid
        mid = int(ceil(float64(loww + highh) / 2))
    result = mid
echo findSpan(5, 3, 0.3, U)


var UU: seq[float64] = @[0.0, 0.0, 0.0, 1.0, 1.0, 1.0]
var p: int = 2
var i: int = 1
var u: float64 = 0.5

proc  basisFuns(i: int, u: float64, p:int, UU: seq[float64]): seq[float64] =

    var N: seq[float64] = newSeq[float64](p+1)
    var left: seq[float64] = newSeq[float64](p+1)
    var right: seq[float64] = newSeq[float64](p+1)  
    var temp: float64
    var saved: float64

    N[0]=1.0
    for j in 1..p:
        left[j] = u - UU[i+1-j]
        right[j] = U[i+j] - u
        saved = 0.0

        for r in 0..<j:
            let divisor = right[r+1] + left[j-r]
            if divisor != 0.0:
                temp = N[r] / divisor
                N[r] = saved + right[r+1] * temp
                saved = left[j-r] * temp
            else:
                temp = 0.0
                N[r] = 0.0
                saved = 0.0
            echo "j=", j, " r=", r, " temp=", temp, " saved=", saved
        N[j] = saved
    result = N
echo basisFuns(i, u, 2, UU)
