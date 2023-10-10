# MATLAB
Here I share specific problem and the solutions done by myself. Problems are here and I have the solutions attached.

1. Use Monte Carlo Method Calculate Intergral
Compute the surface integral.
$$\iint_S \sin x+y^2+\ln \left|\sqrt{z^2+1}-z\right| d S, \quad S: x^2+y^2+z^2=4$$

There are two numerical approaches to consider. The first approach involves transforming the integral into a double integral and then using the Monte Carlo method to solve the double integral (for example, by randomly sampling $1 \times 10^6$ points, and then multiplying the average value of the sampled function by the area of the double integral region). 

The second approach involves directly sampling points on the surface (i.e. the sphere), which is the hardest part of this problem, and then computing the average function value of the three variables. Try using both methods to approximate the value of the integral and analyze the error.
