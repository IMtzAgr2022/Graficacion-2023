#proc Berstein (i, n: int) =
#    for j in 0..n:
#        echo j, i 
#Berstein(0,10)

# Crear un programa con base al pseudocódigo, para calcular el valor de un polinomio de Bernstein
# en un punto "u". Un polinomio de Bernstein se utiliza en la evaluación de curvas de Bezier 

# función   nombre_función  (parámetros):   tipo de dato que la función devuelve = indica comienzo de la función
proc Bernstein(i, n:int, u:float): float =

# Aquí defino "i", "n", "u" como enteros porque 
# "i" = índice del término del polinomio 
# "n"= grado del polinomio
# "u" = valor en el que se evalua el polinomio

# IMPORTANTE, el grado de un polinomio de Bernstein está relacionado con el número de puntos 
# en una curva de Bezier, es por eso que "n" lo voy a definir como máximo 20
    
    var puntos: array[0..20, float]
    # El arreglo tiene un rango de índices desde 0 hasta 20, 21 elementos en total, son enteros
    # cada elemento en el arreglo representa el coeficiente de un término en el "polinomio de Bernstein" ("B i,n(u)")

    for i in 0..n:
        puntos[i] = 0
    # Para "i" que va desde 0 hasta "n", indico que el arreglo en "i" inicia en 0 (linea 25)

    puntos[n-i] = 1     # Esto significa que siempre el "grado del polinomio" - "índice del polinomio" siempre es 1
    let resta = 1-u     # Defino una constante resta, que es "(1-u)"

    for k in 1..n:      # "k" es el valor de "1" hasta "n", que en este caso es 21 (contando desde 0 hasta 20)
        for i in k..n:  # "i" esta entre el uno, que es k, hasta n
            # "downto" se utiliza para calcular los términos en orden inverso, ya que los términos dependen de términos anteriores
            puntos[i] = resta * puntos[i] + u * puntos[i - 1]
    # Después de calcular el polinomio de Bernstein, se almacena el resultado en una variable
    #let resultado = puntos[n]
    let i = 2  # Ejemplo: el índice del término del polinomio
    let n = 5  # Ejemplo: el grado del polinomio
    let u = 0.3  # Ejemplo: el valor en el que se evalúa el polinomio

    # Llama a la función Bernstein para calcular el polinomio en u
    let resultado = Bernstein(i, n, u)

    # Imprimir el resultado
    echo "El resultado del polinomio de Bernstein en u = ", u, " es: ", resultado





    ##AttributeError 'bool' object hs no attribute 'mode'
    ##for i, coef in B.pairs:
#  echo "B[", i, "] =", coef