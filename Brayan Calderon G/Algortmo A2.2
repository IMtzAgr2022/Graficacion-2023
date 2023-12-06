# ALGORITHM A2.2
var U: seq[float64] = @[0.0, 0.0, 0.0, 1.0, 1.0, 1.0];
var p: int = 2;
var i: int = 1;
var u: float64 = 0.5;


# {/* Compute the nonvanishing basis functions
# /* Input: i,u,p,U */
# /* Output: N */
# */
proc  basisFuns(i: int, u: float64, p:int, U: seq[float64]): seq[float64] =
    var N: seq[float64] = newSeq[float64]();
    var left: seq[float64] = newSeq[float64]();
    var right: seq[float64] = newSeq[float64]();
    var temp: float64;
    var saved: float64;
    N[0]=1.0;
    for j in 1..p:
        left[j] = u-U[i+1-j];
        right[j] = U[i+j]-u;
        saved = 0.0;
        for r in 0..<j:
            temp = N[r]/(right[r+1]+left[j-r]);
            N[r] = saved+right[r+1]*temp;
            saved = left[j-r]*temp;
        N[j] = saved;
    result = N

echo basisFuns(i, u, 2, U)
