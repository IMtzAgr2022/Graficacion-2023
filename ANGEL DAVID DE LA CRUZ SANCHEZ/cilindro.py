import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

# Función para generar una curva de Bézier cúbica
def cubic_bezier(t, p0, p1, p2, p3):
    return (1 - t)**3 * p0 + 3 * (1 - t)**2 * t * p1 + 3 * (1 - t) * t**2 * p2 + t**3 * p3

# Parámetros del cilindro
radius = 1.0
height = 3.0
resolution = 100  # Número de puntos para la resolución del cilindro

# Puntos de control para la curva de Bézier que define el perfil del cilindro
p0 = np.array([radius, 0, 0])
p1 = np.array([radius, radius, 0])
p2 = np.array([-radius, radius, 0])
p3 = np.array([-radius, 0, 0])

# Generar puntos a lo largo del perfil del cilindro utilizando la curva de Bézier
profile_points = []
for t in np.linspace(0, 1, resolution):
    point = cubic_bezier(t, p0, p1, p2, p3)
    profile_points.append(point)

profile_points = np.array(profile_points)

# Crear las coordenadas 3D para el cilindro rotado alrededor del eje Z
theta = np.linspace(0, 2 * np.pi, resolution)
x = np.outer(profile_points[:, 0], np.cos(theta))
y = np.outer(profile_points[:, 0], np.sin(theta))
z = np.outer(profile_points[:, 2], np.ones_like(theta))

# Configurar la figura 3D
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Crear la superficie del cilindro
ax.plot_surface(x, y, z, color='b', rstride=1, cstride=1)

# Configurar etiquetas de ejes
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

# Mostrar el gráfico
plt.show()
