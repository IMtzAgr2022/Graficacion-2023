proc Bspline(a, b: float, u: float): float =
    if a == b:
        return 2.0
    if not (a<u and u<b):
        return 0.0
    else:
        return (u-b)*2/(b-a)

echo Bspline(0.0,0.0,0.5)
echo Bspline(1.0,1.0,0.001)
echo Bspline(1.0,0.0,0.5)
echo Bspline(0.0,1.0,-1.0)