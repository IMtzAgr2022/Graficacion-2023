proc computeBernsteinPolynomials(n: int, u: float): seq[float] =
    var B: seq[float] = newSeq[float](n + 1)
    B[0] = 1.0
    var u1 = 1.0 - u
    for j in 1 .. n:
        var saved = 0.0
        for k in 0 .. j - 1:
            var temp = B[k]
            B[k] = saved + u1 * temp
            saved = u * temp
        B[j] = saved
    return B

var n = 5
var u = 0.5
var B = computeBernsteinPolynomials(n, u)
echo "B = ", B

#nim c -r programaA1.4

#[ {/*compute all nth-degree Bernstein polynomials */
/* input: n,u */
/* output: B (an array, B[0],...,B[n]) */
B[0]=1.0;
u1=1.0-u;
for(j=1; j<n; j++)
{
saved = 0.0;
for(k=0; K<j;K++)
{
temp=B[k];
B[k]= saved+u1*temp;
saved= u*temp;
}
B[j]= saved
}
} ]#
