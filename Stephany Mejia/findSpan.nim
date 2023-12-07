import math                                                                                               
var U: seq[float64] = @[0.0,0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0,7.0,7.0,7.0]                                                 
# n=m-p-1                                                                                                          
proc findSpan(n: int, p: int, u: float64, U: seq[float64]): int =
  if u == U[n+1]:
    return n
  var lw: int = p
  var hh: int = n+1                                                                                         
  # /* Do binary search */                                                                                
  var mid: int = toInt(math.floor((lw+hh)/2))
  echo "The mid ...", mid
  while (u < U[mid] or u >= U[mid+1]):
    if (u < U[mid]):
      hh = mid
    else:                                                                                                 
      lw = mid
    echo "The other mid...", lw,"<",mid, "<",hh
    mid = toInt(math.floor((lw+hh)/2))
  result = mid
echo findSpan(8,2,2,U)
