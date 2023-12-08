proc Bspline(i, p, u: float, secnod: seq[float]): float =
    # i: Es el índice base.
    # p: Es el grado del B-spline.
    # u: Valor para el que se calcula la función.
    # secnod: Una secuencia de nodos, que son valores que definen los puntos de control de la curva B-spline.
    var d: seq[float] = @[] 
    # aqui creo una secuencia "seq" para almacenar los valores temporales que se calculan durante el proceso
    # para inicializar una lista vacía se usa @[]
    for j in 0..p:  # la idea es iterar de 0 hasta p
        if secnod[i + j] <= u and u < secnod[i + j + 1]:    #tengo cuestiones en como hacer válidos los <=
            d.add(1.0)
        else:
            d.add(0.0)
        # Dentro del bucle, de la línea 10 - 13, se verifica si "u" se encuentra entre los nodos 
        # secnod[i + j] y secnod[i + j + 1]. Si es así, se agrega "1.0" a la secuencia d
        # indicando que la función de B-spline tiene un valor de 1.0 en ese punto
        # Si no, se agrega 0.0, indicando que la función de B-spline es 0.0 en ese punto.
    for r in 1..p:
        for j in 0..p-r:
            # Estos son bucles anidados, línea 18 -19, calculan los valores de N(i,p)(u) 
            # Comienzan con p = 1 y avanzan hasta p para realizar los cálculos.
            # El primer bucle for está como "r" se ejecuta desde 1 hasta p
            # El segundo bucle for como "j" se ejecuta desde 0 hasta p-r. 
            # "p" es el grado del Bspline
            # "r" va desde 1 hasta p. Este bucle se encarga de calcular los valores de d[j] para cada j
            var a = (u - secnod[i + j]) / (secnod[i + j + r] - secnod[i + j])
            d[j] = (1.0 - a) * d[j] + a * d[j + 1]
    return d[0]

# N(2,2)(2.5) en el intervalo [1, 4] con u = 2.5
let i = 2
let p = 2
let u = 2.5
let secnod = @[1.0, 2.0, 3.0, 4.0]

let result = Bspline(i, p, u, secnod)
echo "Resultado de N_{2,2}(2.5) en el intervalo [1, 4] con u = 2.5:", result
