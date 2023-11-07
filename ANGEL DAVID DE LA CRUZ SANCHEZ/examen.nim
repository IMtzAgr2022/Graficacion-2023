import math, matplotlib.pyplot as plt

proc calculateNiP(Ui, U, Uih: float): float =
  if Ui <= U and U <= Uih:
    return 1.0
  else:
    echo "Intente de otra manera"
    quit()

proc plotGraph(k: seq[float], M: int) =
  var NiPValues: seq[seq[float]] = @[]
  
  for i in 0..<M:
    var NiPRow: seq[float] = @[]
    for U in k:
      let Ui = float(i)
      let Uih = float(i + 1)
      NiPRow.add(calculateNiP(Ui, U, Uih))
    NiPValues.add(NiPRow)
  
  for i in 0..<M:
    plt.plot(k, NiPValues[i], label="i = " & $i)

  plt.xlabel("U")
  plt.ylabel("Ni,p(U)")
  plt.legend()
  plt.show()

# Definición aleatoria del vector de nodos k
let k = @[rand(0.0 .. 10.0), rand(0.0 .. 10.0), rand(0.0 .. 10.0),
           rand(0.0 .. 10.0), rand(0.0 .. 10.0), rand(0.0 .. 10.0)]

# Grado de la forma (definido aleatoriamente)
let n = int(rand(1 .. 10))
let p = int(rand(1 .. 10))
let M = n + p + 1

plotGraph(k, M)