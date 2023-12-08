proc BSpline(i, p: int, u: float, U: seq[float]): float =
    if p == 0:
        if U[i] <= u and u < U[i + 1]:
            return 1.0
        else:
            return 0.0
        
        var i = (u - U[i]) / (U[i + p] - U[i]) * BSpline(i, p - 1, u, U)
        var d = (U[i + p + 1] - u) / (U[i + p + 1] - U[i + 1]) * BSpline(i + 1, p - 1, u, U)
        return i + d

# Ejemplo de uso con U = {0, 0, 0, 1, 1, 1} 
let U = @[0.0, 0.0, 0.0, 1.0, 1.0, 1.0]
let p = 2
let u = 0.5
let i = 1

let resultado = BSpline(i, p, u, U)
echo "Resultado de N_(i,p)(", u, ") =", resultado
