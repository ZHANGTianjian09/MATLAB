# MATLAB
Here I share specific problem and the solutions done by myself. Problems are here and I have the solutions attached.

1. Use Monte Carlo Method calculate intergral

Compute the surface integral.
$$\iint_S \sin x+y^2+\ln \left|\sqrt{z^2+1}-z\right| d S, \quad S: x^2+y^2+z^2=4$$
There are two numerical approaches to consider. The first approach involves transforming the integral into a double integral and then using the Monte Carlo method to solve the double integral (for example, by randomly sampling $1 \times 10^6$ points, and then multiplying the average value of the sampled function by the area of the double integral region). 
The second approach involves directly sampling points on the surface (i.e. the sphere), which is the hardest part of this problem, and then computing the average function value of the three variables. Try using both methods to approximate the value of the integral and analyze the error.

2. Soldier Line-up Problem

Suppose there are 100 points on a two-dimensional plane with coordinates. 
$$\left\{\left(\boldsymbol{x}_i,\boldsymbol{y}_i\right)\right\}_{1 \leq i \leq 100}$$, 
representing the current positions of 100 soldiers on a parade ground. First, assume that these point coordinates fall within the bounded region $[0,1]\times[0,1]$. Their coordinates $F_{100 \times 2}$ are stored in the file "W5603.mat" (copy the file to the current folder, then double-click in the window, or use the MATLAB command load W5623 to open it). Now, the soldiers need to move to specified positions to line up. Assume that the soldiers will walk in straight lines to their respective positions and will not collide with each other.

If you can arrange the positions of the 100 soldiers, allowing them to line up at the 100 coordinates from the previous question (but the order of the soldiers can change), what is the minimum total moving distance?


