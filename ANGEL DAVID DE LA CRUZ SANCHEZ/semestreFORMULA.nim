nim
import math, strutils, sequtils, plot

proc solve(u: seq[int]): float =
 ## Resuelve la ecuación v₁ ≤ u < v₁m, donde u es un vector con los valores (0,0,0,1,1,1).
 ## Devuelve el valor de v₁.

 # Calculamos el valor de v₁.
 var v1 = 0.0
 for i in 0..<u.len:
    v1 += u[i] / (i + 1)

 # Devolvemos el valor de v₁.
 return v1

# Creamos un vector con los valores (0,0,0,1,1,1).
var u = @[0, 0, 0, 1, 1, 1]

# Calculamos el valor de v₁.
var v1 = solve(u)

# Imprimimos el resultado.
echo "v₁ =", v1

# Creamos una gráfica.
var plot = newPlot(600, 400)

# Añadimos los puntos de la gráfica.
for i in 0..<u.len:
 plot.addPoint((i, u[i]))

# Dibujamos la gráfica.
plot.draw()