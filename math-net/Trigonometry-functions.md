## Sin


### Right triangle definition

$sin(\theta)=\frac{opposite}{hypotenuse}$

**Example:**  
A wheel chair ramp needs to have an angle of 10° and a rise of 3 feet, what is the length of the ramp?

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/example-2.png)

</div>

$sin(\theta)=\frac{opposite}{hypotenuse}$

Length $= \frac{opposite}{sin(10°)} = \frac{3}{sin(10°)} \approx 17.3 feet$


### Unit circle definition

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/unit-cicle.png)

</div>

<br/><br/>

$$sin(\theta)=\frac{opposite}{hypotenuse}=\frac{y}{1}=y$$


### Reference angles

Any angle in the coordinate plane has a reference angle that is between 0° and 90°. 

It is always the smallest angle (with reference to the x-axis) that can be made from the terminal side of an angle.

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/reference-angle-ii.png)

</div>


Because θ' is the reference angle of θ, both sin⁡(θ) and sin⁡(θ') have the same value.  
For example, 30° is the reference angle of 210°, and if we reference the unit circle, we can see that the sine values of both have a magnitude of 1/2, albeit they have different signs.


<br/><br/>

Below is a table showing the signs of cosine, sine, and tangent in each quadrant.

<div align='center'>

|              | Sine  | Cosine | Tangent |
| ------------ | :---: | :----: | :-----: |
| Quadrant I   |   +   |   +    |    +    |
| Quadrant II  |   +   |   -    |    -    |
| Quadrant III |   -   |   -    |    +    |
| Quadrant IV  |   -   |   +    |    -    |

</div>

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/reference-angle-ii.png)  
$θ'= 180° - θ$

<br/>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/reference-angle-iii.png)  
$θ'= θ - 180°$

<br/>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/reference-angle-iv.png)  
$θ'= 360° - θ$

</div>


**Example:**  
Find $sin⁡(120°)$.

1\. θ is already between 0° and 360°  
2\. 120° lies in quadrant II  
3\. 180° - 120° = 60°, so the reference angle is 60°  

$sin⁡(60°)=\frac{\sqrt{3}}{2}$. 120° is in quadrant II, and sine is positive in quadrant II, so:

$sin(120°)=sin(60°)=\frac{\sqrt{3}}{2}$

<br/>

**Example:**  
Find $sin⁡(690°)$.

1\. $690° - 360° = 330°$  
2\. $330°$ lies in quadrant IV  
3\. $360° - 330° = 30°$, so the reference angle is 30°

$sin⁡(30°)=\frac{1}{2}$ is in quadrant IV where sine is negative, so:  

$sin(330°)=-sin(30°)=\frac{1}{2}$

### Properties of the sine function

#### Sine is a cofunction of cosine

$sin⁡(θ) = cos⁡(90° - θ)$  
$cos⁡(θ) = sin⁡(90° - θ)$

**Example:**  
$sin⁡(60°) = cos⁡(90° - 60°) = cos⁡(30°)$

Referencing the unit circle shown above, we can plug in values for cos⁡(30°) and sin⁡(60°) and see that:  
$sin⁡(60°)=cos⁡(30°)=\frac{\sqrt{3}}{2}$


#### Sine is an odd function

An odd function is a function in which $-f(x)=f(-x)$. It has symmetry about the origin. Thus,

$-sin(θ) = sin⁡(-θ)$


**Example:**  
$$-sin⁡(60°) = sin⁡(-60°)$$
$$-sin⁡(60°) = sin⁡(300°)$$  

$$-\frac{\sqrt{3}}{2}=-\frac{\sqrt{3}}{2}$$

#### Sine is a periodic function

A periodic function is a function, f, in which some positive value, p, exists such that

$$f(x+p) = f(x)$$

for all x in the domain of f, p is the smallest positive number for which f is periodic, and is referred to as the period of f.

<br/>

Trigonometric functions are commonly used to model periodic phenomena due to their periodicity;  
no matter what point we start at on the unit circle, if we travel a distance of 2π (360°) along the unit circle from that point, we will arrive back at our starting point.


<br/>

If we look at the sine function, we will find that it repeats every 2π, so 2π is the period of the sine function. We can write this as:
$$sin⁡(θ+2π) = sin⁡(θ)$$

To account for multiple full rotations, this can also be written as
$$sin⁡(θ+2πn) = sin⁡(θ)$$
where n is an integer.

<br/>

The figure below shows an example of this periodicity.

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/periodic-function.png)

</div>

In blue, we see that $\theta=\frac{\pi}{6}$. $sin(\frac{\pi}{6})=\frac{1}{2}$. If we add 2π to $\frac{\pi}{6}$, we get the angle shown in red, $\theta=\frac{13\pi}{6}$.  

As can be seen in the figure, even though there is a different degree of rotation in both angles, their terminal sides are exactly the same, meaning that $sin(\frac{\pi}{6})=sin(\frac{13\pi}{6})=\frac{1}{2}$.  

We could add another 2π, and would still see that $\frac{25\pi}{6}$ has the same sine value as $\frac{\pi}{6}$ This is the nature of periodic functions.

$\frac{\pi}{6}$, $\frac{13\pi}{6}$, $\frac{25\pi}{6}$ are referred to as coterminal angles; they are angles with the same initial and terminal sides, but with different rotations.

**Examples:**  
1\. $sin(\frac{13\pi}{3})=sin(\frac{\pi}{3}+4\pi)=sin(\frac{\pi}{3})=\frac{\sqrt{3}}{2}$

2\. $sin(-\frac{23\pi}{6})=sin(\frac{\pi}{6}-4\pi)=sin(\frac{\pi}{6})=\frac{1}{2}$
