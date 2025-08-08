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

### Graph of the sine function

#### General sine equation

The general form of the sine function is
$$y = A·sin(B(x – C)) + D$$

where A, B, C, and D are constants. 

---

**A**—the amplitude of the function; the height from the center of the graph to a maximum or minimum.

In y=sin⁡(x), the center is the x-axis, and the amplitude is 1, or A=1, so the highest and lowest points the graph reaches are 1 and -1, the range of sin⁡(x).  
Compared to y=sin⁡(x), shown in purple below, the function y=2 sin⁡(x) (red) has an amplitude that is twice that of the original sine graph.  
<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/amplitude.png)

</div>

---

**B**—used to determine the period of the function;  
the period of a function is the distance from peak to peak (or any point on the graph to the next matching point) and can be found as $\frac{2\pi}{B}$

In $y=sin⁡(x)$ the period is 2π. We can confirm this by looking at the sine graph.  
Referencing the figure above, we can see that the shape of the sine graph between [-2π, 0] is equivalent to that from [0, 2π] meaning that it repeats itself over an interval of 2π; ie, it has a period of **2π**.

<br/>

Compared to y=sin⁡(x), shown in purple below, which has a period of 2π, y=sin⁡(2x) (red) has a period of $\frac{2\pi}{B}=\frac{2\pi}{2}=\pi$.  
This means that the graph repeats itself every π rather than every 2π.

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/sine-period.png)

</div>

---

**C**—the phase shift of the function; phase shift determines how the function is shifted horizontally.  
If C is negative, the function shifts to the left. If C is positive the function shifts to the right.

Be wary of the sign; if we have the equation $y=sin(x+\frac{\pi}{2})$ then c is $-\frac{\pi}{2}$ not $\frac{\pi}{2}$,  
because this equation in standard form is $y=sin(x-(-\frac{\pi}{2}))$, Thus, we would shift the graph $\frac{\pi}{2}$

<br/>

Using one of the peaks of the sine graph as a reference, we can see that the peak at $(\frac{\pi}{2}, 1)$ has been shifted $\frac{\pi}{2}$ to the left from its original position and is now at (0,1).

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/sine-shift.png)

</div>

---

**D**—the vertical shift of the function; if D is positive, the graph shifts up D units, and if it is negative, the graph shifts down.

Compared to $y=sin⁡(x)$, shown in purple below, which is centered at the x-axis $(y=0)$, $y=sin(x)+5$ (red) is centered at the line $y=5$ (blue).

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/sine-vertical-shift.png)

</div>

Putting together all the examples above, the figure below shows the graph of $y=2sin(2(x+\frac{\pi}{2}))+5$ (red) compared to that of y=sin⁡(x) (purple).

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/sine/sine-putting-together.png)

</div>

## Cosine

### Right triangle definition

$$cos(\theta)=\frac{adjacent}{hypotenuse}$$

**Example:**  
A plane is on a flying over a person. The person records an angle of elevation of 25° when the straight-line distance (hypotenuse of the triangle) between the person and the plane is 14 miles. What is the horizontal distance between the plane and the person?  

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/cosine/example-2.png)

</div>

Given the information above, we can form a right triangle such that x is the horizontal distance between the person and the plane, the straight-line distance between the person and the plane is the hypotenuse, and the vertical distance between the terminal ends of x and the hypotenuse forms the right angle of the triangle.  
We can then find the horizontal distance, x, using the cosine function:

$cos(25^\circ)=\frac{x}{14}$

$x = 14 \times cos(25^\circ) \approx 12.69$

### Unit circle definition

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/cosine/unit-circle.png)

</div>

<br/>

<div align='center'>

![alt](https://www.math.net/mj/Y29zKFx0aGV0YSk9XGZyYWN7YWRqYWNlbnR9e2h5cG90ZW51c2V9PVxmcmFje3h9ezF9PXg=_100.svg)

</div>

### Reference angles

[Reference angles](#reference-angles)


**Example:**  
Find cos⁡(120°).

1\. θ is already between 0° and 360°  
2\. $120°$ lies in quadrant II  
3\. $180° - 120° = 60°$, so the reference angle is 60°

$cos(60°)=\frac{1}{2}$, 120° is in quadrant II, and cosine is negative in quadrant II, so:
$$cos(120°)=-cos(60°)=-\frac{1}{2}$$

**Example:**  
Find cos⁡(1050°).

1\. $1050° - 360° = 690° - 360° = 330°$ 
2\. 330° lies in quadrant IV
3\. $360° - 330° = 30°$, so the reference angle is 30°

$cos(30°)=\frac{\sqrt{3}}{2}$, 330° is in quadrant IV, and cosine is positive in quadrant IV, so:
$$cos(330°)=cos(30°)=\frac{\sqrt{3}}{2}$$


### Properties of the cosine function

#### Cosine is a cofunction of sine

$cos⁡(θ) = sin⁡(90° - θ)$  
$sin⁡(θ) = cos⁡(90° - θ)$

**Example:**  
$cos⁡(30°) = sin⁡(90° - 30°) = sin⁡(60°)$

Referencing the unit circle shown above, we can plug in values for cos⁡(30°) and sin⁡(60°) and see that:
$$cos⁡(30°) = sin⁡(60°) = \frac{\sqrt{3}}{2}$$

#### Cosine is an even function
An even function is a function in which f(x)=f(-x),

cos⁡(θ) = cos⁡(-θ)

**Example:**  
$$cos⁡(60°) = cos⁡(-60°)$$
$$cos⁡(60°) = cos⁡(300°)$$
$$\frac{1}{2} = \frac{1}{2}$$

Referencing the unit circle, we can see that $cos⁡(60°)=\frac{1}{2}$ and cos⁡(-60°) is equivalent to cos⁡(300°), which is also equal to $\frac{1}{2}$. 

### General cosine equation

The general form of the cosine function is
$$y = A·cos(B(x - C)) + D$$

https://www.math.net/cosine

## Tangent

### Right triangle definition

$$tan(\theta)=\frac{opposite}{hypotenuse}$$

The other two most commonly used trigonometric functions are cosine and sine, and they are defined as follows: 


$$cos(\theta)=\frac{adjacent}{hypotenuse}$$

$$sin(\theta)=\frac{opposite}{hypotenuse}$$

Tangent is related to sine and cosine as:

$$tan(\theta)=\frac{sin(\theta)}{cos(\theta)}$$


**Example:**  
Jack is standing 17 meters from the base of a tree. Given that the angle from Jack's feet to the top of the tree is 49°, what is the height of the tree, h? If the tree falls towards Jack, will it land on him?

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/tangent/example-2.png)

</div>

$tan(49^\circ)=\frac{h}{17}$

$h = 17 × tan⁡(49°) ≈ 19.56$

So, the height of the tree is 19.56 m. If Jack does not move, the tree will land on him if it falls in his direction, since 19.56 > 17.

### Unit circle definition

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/trigonometric-functions/tangent/unit-circle.png)

</div>

### Reference angles

[Reference angles](#reference-angles)

**Example:**  
Find tan⁡(240°).

1\. θ is already between 0° and 360°  
2\. 240° lies in quadrant III  
3\. 240° - 180° = 60°, so the reference angle is 60°  

$tan⁡(60°)=\sqrt{3}$. 240° is in quadrant III where tangent is positive, so: $tan⁡(240°)=tan⁡(60°)=\sqrt{3}$

**Example:**  
Find tan⁡(690°).

1\. $690° - 360° = 330°$  
2\. 330° lies in quadrant IV  
3\. $360° - 330° = 30°$  

$tan⁡(30°) = \frac{\sqrt{3}}{3}$ . 330° is in quadrant IV where tangent is negative, so:

$tan⁡(330°) = -tan⁡(30°) = -\frac{\sqrt{3}}{3}$

### Properties of the tangent function

https://www.math.net/tangent

