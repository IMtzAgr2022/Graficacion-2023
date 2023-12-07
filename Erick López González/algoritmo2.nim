# Erick López González
# Algoritmo 1.2
proc Bernstein(i:int, n:int, u:float) : float =
    var temp : seq[float] = newSeq[float](n+1)
    for j in 0..n:
        temp[j] = 0.0
    temp[n-i] = 1.0
    var u1 = 1.0 - u
    for k in countup(1,n):
        for j in countdown(n,k):
            temp[j] = u1*temp[j] + u*temp[j-1]
            echo "k:",k,"\tj:",j,"\ttemp[j]=",temp[j]
    return temp[n]

echo "B = ",Bernstein(1,3,0.3)