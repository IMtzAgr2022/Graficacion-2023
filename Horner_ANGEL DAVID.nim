
proc evaluarPolinomioHorner(x: float, coeficientes: seq[float]): float =
    var resultado: float = 0.0  
    for coef in coeficientes:
        resultado = resultado * x + coef 
    return resultado 
const a = 2.0
const b = 3.0
const c = 4.0
var coeficientesGrado1: seq[float] = @[b, a] 
var xGrado1: float = 2.0  
echo "Para x =", xGrado1, "el valor del polinomio de grado 1 es:", evaluarPolinomioHorner(xGrado1, coeficientesGrado1)
var coeficientesGrado2: seq[float] = @[c, b, a] 
var xGrado2: float = 3.0  
echo "Para x =", xGrado2, "el valor del polinomio de grado 2 es:", evaluarPolinomioHorner(xGrado2, coeficientesGrado2)