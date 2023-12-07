  proc findSpan(n, p: int, u: float, U: seq[float]): int =
  ## Determine the knot span index
  ## Input: n, p, u, U
  ## Return: the knot span index

  if u == U[n + 1]: 
    return n  # Caso especial

  var
    low, high, mid: int

  # Realizar búsqueda binaria
  low = p
  high = n + 1
  mid = (low + high) div 2

  while u < U[mid] or u >= U[mid + 1]:
    if u < U[mid]:
      high = mid
    else:
      low = mid

    mid = (low + high) div 2

  result = mid