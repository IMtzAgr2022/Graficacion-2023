var i: float
proc BSpline(i, p: int, u: float, U: seq[float]): float =
    if i + p > U.len:
        return 0.0

    if u < U[i] or u >= U[i + p]:
        return 0.0

    if p == 0:
        if U[i] <= u and u < U[i + p]:
            return 1.0
        else:
            return 0.0

    #var i = (u - U[i]) / (U[i + p] - U[i]) * (if U[i + p] <= u then BSpline(i, p - 1, u, U) : 0.0)
    #var i = (u - U[i]) / (U[i + p] - U[i]) * (if U[i + p] <= u: BSpline(i, p - 1, u, U) else: 0.0)
    if U[i + p] - U[i] > 0:
        #var i = (u - U[i]) / (U[i + p] - U[i]) * (if U[i + p] <= u: BSpline(i, p - 1, u, U) else: 0.0)
        i = (u - U[i]) / (U[i + p] - U[i]) * BSpline(i, p - 1, u, U)
    else:
        var i = 0.0

    var d = (U[i + p + 1] - u) / (U[i + p + 1] - U[i + 1]) * BSpline(i + 1, p - 1, u, U)
    return i + d

# Ejemplo de uso con U = {0, 0, 0, 1, 1, 1}
let U = @[0.0, 0.0, 0.0, 1.0, 1.0, 1.0]
let p = 2
let u = 0.5
let i = 1

let resultado = BSpline(i, p, u, U)
echo "Resultado de N_(i,p)(", u, ") =", resultado
