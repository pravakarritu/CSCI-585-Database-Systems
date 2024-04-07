# I generated the points for the spirograph using this code and added the generated points in the kml file
import math
R, r, a = 0.0006, 0.0001, 0.0008
cos, sin, pi = math.cos, math.sin, math.pi
n, t = 20, 0.0
num_times = pi * n
while t <= num_times:
    x = (R + r) * cos((r / R) * t) - a * cos((1 + r / R) * t) + 34.02067750182853
    y = (R + r) * sin((r / R) * t) - a * sin((1 + r / R) * t) - 118.28542535982619
   # print("<Placemark><name></name><styleUrl>#z1</styleUrl><Point><coordinates>" + str(y) + "," + str(x) + "</coordinates></Point></Placemark>")
    t += 0.01



