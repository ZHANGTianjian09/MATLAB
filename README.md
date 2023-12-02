# MATLAB
Here I share specific problems and the solutions done by myself. Problems are here and I have the solutions attached.

1. Use Monte Carlo Method calculate intergral

Compute the surface integral.
$$\iint_S \sin x+y^2+\ln \left|\sqrt{z^2+1}-z\right| d S, \quad S: x^2+y^2+z^2=4$$
There are two numerical approaches to consider. The first approach involves transforming the integral into a double integral and then using the Monte Carlo method to solve the double integral (for example, by randomly sampling $1 \times 10^6$ points, and then multiplying the average value of the sampled function by the area of the double integral region). 
The second approach involves directly sampling points on the surface (i.e. the sphere), which is the hardest part of this problem, and then computing the average function value of the three variables. Try using both methods to approximate the value of the integral and analyze the error.

2. Soldier Line-up Problem

Suppose there are 100 points on a two-dimensional plane with coordinates,
representing the current positions of 100 soldiers on a parade ground. First, assume that these point coordinates fall within the bounded region $[0,1]\times[0,1]$. Their coordinates $F_{100 \times 2}$ are stored in the file "W5603.mat" (copy the file to the current folder, then double-click in the window, or use the MATLAB command load W5623 to open it). Now, the soldiers need to move to specified positions to line up. Assume that the soldiers will walk in straight lines to their respective positions and will not collide with each other.

If you can arrange the positions of the 100 soldiers, allowing them to line up at the 100 coordinates from the previous question (but the order of the soldiers can change), what is the minimum total moving distance?

3. Extended Proximal Gradient Descent

Let $\vec{x}$ be a 4-dimensional column vector, $A, B$ be 4 $\times$ 4 matrices, $\vec{b}$ be a 4-dimensional column vector, $\lambda$ = 0.1, solve for $\min _{\vec{x}} \frac{1}{2}\|\|A \vec{x}-\vec{b}\|\|_2^2+\lambda\|\|B \vec{x}\|\|_1$.

4. Specific Knapsack Problem
   
Assuming there is a store with a total of $n$ different items, where the first $m$ items are special items ($1 \leq m < n$). Each item is priced at $c_i$ dollars, where $c_i \in \mathbb{N}^+$ (positive integers), and each item has a performance value of $v_i$ dollars. You currently have $C$ dollars ($C \leq 2000$), and it is required that you must buy exactly one special item. The question is how to make a purchase in order to maximize the total performance value of the items. (It is guaranteed that there is at least one valid solution, and each item can be chosen to buy or not, but there is only one piece of each item, $v_i > 0$).

5. The New Wheat Ear Problem

Now, let's assume a row of wheat field with 100 wheat ears, with the size of the ears following some statistical distribution. The objective is to design an algorithm to harvest the largest possible wheat ears.
The size data of the wheat ears is structured as a sequential list. When accessing each wheat ear's size, one can either choose to harvest this ear or continue to the next one, without the possibility of revisiting previous ears. Once a wheat ear is harvested, no further ears can be chosen. If the last wheat ear is reached without harvesting any, it must be harvested. The data in Q4.mat includes $A_{100 \times 100}$, with each row being a set of wheat ear sizes. The values follow a uniform distribution $U(0,1)$, where each row follows a uniform distribution $U(0, \beta)$, but $\beta$ is unknown. $C_{100 \times 100}$ where each row follows an exponential distribution $E(1)$,
$D_{100 \times 100}$ where each row follows an exponential distribution E($\lambda$) , but $\lambda$ is unknown.
    \item Please use the actual size of the wheat ears you harvested divided by the maximum wheat ear size in that row $m_A, m_B, m_C, m_D$ as the score $p$ for that row. Clearly, $p \in (0,1]$.


