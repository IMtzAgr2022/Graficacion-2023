proc Bernstein(i, n: int, u: float): float =
    var temp: seq[float] = newSeq[float](n + 1)
    for j in 0..n:
        temp[j] = 0.0
    temp[n-1] = 1.0
    for k in 1..n:
        for j in n-1 .. k-1:
            temp[j] = float(i) * temp[j] + u * temp[j-1]
    return temp[n]

var i = 2
var n = 5
var u = 0.5
var B = Bernstein(i, n, u)
echo "B = ", B
#nim c -r kukis.nim

#[ Bernstein (i, n,u,B)
{/*compute the value of Bernstein polynomial */
/*Input: i,n,u */
/*Outpunt: B*/
for (j=0; j<=n; j++) /*compute the colums*/
temp[j] = 0.0  /*compute the colums*/
temp[n-1]=1.0; /*in a temapary */
for (k=1; j>=k; j--)
temp [j]=u1*temp[j] + u*temp[j-1];
B=temp[n];
} ]#
