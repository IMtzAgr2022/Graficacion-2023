# Algoritmo 1.2 Polinomio de Bernstein

proc Bernstein(i, n: int, u: float): float =
  var temp: seq[float] = newSeq[float](n + 1)

  for j in 0..n:
    temp[j] = 0.0

  temp[n - i] = 1.0
  for k in 1..n:
    for j in n-1 .. k-1:
            temp[j] = float(i) * temp[j] + u * temp[j + 1]
    return temp[n]

# EJEMPLO
when isMainModule:
  let i = 3
  let n = 6
  let u = 0.2
  let resultado = Bernstein(i, n, u)
  echo "El resultado del polinomio de Bernstein es: ", resultado