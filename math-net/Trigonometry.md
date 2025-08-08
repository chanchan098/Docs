https://www.math.net/trigonometry

## Trigonometry

### Trigonometric functions

#### Right triangle definition

The output of a trigonometric function is a ratio of the lengths of two sides of a right triangle.

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/right-triangle.png)

</div>

- Adjacent: the side next to θ that is not the hypotenuse
- Opposite: the side opposite θ.
- Hypotenuse: the longest side of the triangle opposite the right angle.


<br/>

The trigonometric functions are defined based on <u>the ratios of two sides of the right triangle</u>.  
There are six trigonometric functions: sine, cosine, tangent, cosecant, secant, and cotangent.  
These functions are often abbreviated as sin, cos, tan, csc, sec, and cot. Their definitions are shown below  

sine: $sin(\theta)=\frac{opposite}{hypotenuse}$  

cosine: $cos(\theta)=\frac{adjacent}{hypotenuse}$

tangent: $tan(\theta)=\frac{opposite}{adjacent}$

cosecant: $scs(\theta)=\frac{hypotenuse}{opposite}$

secant: $sec(\theta)=\frac{hypotenuse}{adjacent}$

cotangent: $cot(\theta)=\frac{adjacent}{opposite}$

$sin(\frac{\pi}{2}-θ)=cos(θ)$




```
           60° 
          /│ 
      c /  │
      /    │b
    /______│
   30° a
```

角30°所对应的边，等于斜边的一半，因此  
$\because c=1$  
$\therefore b = \frac{c}{2} = \frac{1}{2}$  
$sin(30°)=\frac{b}{c}=\frac{\frac{1}{2}}{1}$   

$sin(30°)=\frac{1}{2}$


---


```
           60° 
          /│ 
      c /  │
      /    │b
    /______│
   30° a
```

$\because c=1;\qquad b=\frac{1}{2};\qquad a^2+b^2=c^2$  
$\therefore a^2+(\frac{1}{2})^2 =1^2;\;a^2+\frac{1}{4} =1;\;a^2=1-\frac{1}{4}$

$a^2=\frac{3}{4};\;a=\sqrt{\frac{3}{4}} =\frac{\sqrt{3}}{\sqrt{4}}$  
$a=\frac{\sqrt{3}}{2}$

$sin(60^\circ)=\frac{a}{c}=\frac{\frac{\sqrt{3}}{2}}{1}$  

$sin(60^\circ)=\frac{\sqrt{3}}{2}$

### Trigonometric identities

#### Reciprocal identities

[what's reciprocal](./PrimaryMath.md#reciprocal)

$sin(θ)=\frac{1}{csc(θ)}$  
$scs(θ)=\frac{1}{sin(θ)}$  
$sin(θ)·csc(θ) = 1$  
>example: $sin(θ)=10 \quad csc(θ)=\frac{1}{10}$  
>verification: $10 \times \frac{1}{10}=\frac{10}{1} \times \frac{1}{10}=1$

$cos(θ)=\frac{1}{sec(θ)}$  
$sec(θ)=\frac{1}{cos(θ)}$  
$cos(θ)·sec(θ) = 1$  

$tan(θ)=\frac{1}{cot(θ)}$  
$cot(θ)=\frac{1}{tan(θ)}$  
$tan(θ)·cot(θ) = 1$  

#### Quotient identities


#### Cofunction identities

$sin(\frac{\pi}{2}-\theta)=cos(\theta)$

$cos(\frac{\pi}{2}-\theta)=sin(\theta)$

$tan(\frac{\pi}{2}-\theta)=cot(\theta)$

$csc(\frac{\pi}{2}-\theta)=sec(\theta)$

$sec(\frac{\pi}{2}-\theta)=csc(\theta)$

$cot(\frac{\pi}{2}-\theta)=tan(\theta)$

#### Odd/even identities

$sin(-θ) = -sin(θ)$  
$cos(-θ) = cos(θ)$  
$tan(-θ) = -tan(θ)$  
$csc(-θ) = -csc(θ)$  
$sec(-θ) = sec(θ)$  
$cot(-θ) = -cot(θ)$  

#### Pythagorean identities

$cos^2(θ) + sin^2(θ) = 1$  
$1 + tan^2(θ) = sec^2(θ)$  
$1 + cot^2(θ) = csc^2(θ)$  


### Trigonometric formulas

#### Sum and difference formulas

$sin(x ± y) = sin(x)·cos(y) ± cos(x)·sin(y)$  
$cos(x ± y) = cos(x)·cos(y) ± sin(x)·sin(y)$  
$tan(x ± y)=\frac{tan(x)±tan(y)}{1±tan(x) \times tan(y)}$

#### Double angle formulas

$sin(2θ) = 2·sin(θ)·cos(θ)$  
$cos(2θ) = cos^2(θ) - sin^2(θ) = 1 - 2·sin^2(θ) = 2·cos^2(θ) - 1$  
$tan(2θ) = \frac{2 \times tan(θ)}{1-tan^2(θ)}$

#### Half angle formulas

$$sin(\frac{θ}{2})=\pm\sqrt{\frac{1-cos(θ)}{2}}$$
$$cos(\frac{θ}{2})=\pm\sqrt{\frac{1-cos(θ)}{2}}$$
$$tan(\frac{θ}{2})=\frac{sin(θ)}{1+cos(θ)}=\frac{1-cos(θ)}{sin(θ)}$$

### Non-right triangles

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/triangle.png)

</div>

#### The sine rule

$$\frac{a}{\sin A} = \frac{b}{\sin B} = \frac{c}{\sin C} \quad or \quad \frac{\sin A}{a} = \frac{\sin B}{b} = \frac{\sin C}{c}$$

Example:  
For triangle ABC, a=3, B=70°, C=45°, find A, b, and c,

$A = 180° - B - C = 180° - 70° - 45° = 65°$

$\frac{a}{\sin A} = \frac{b}{\sin B}$  
$\frac{a}{\sin A} \times \sin B = \frac{b}{\sin B} \times \sin B$  
$b = \frac{a \times \sin B}{\sin A}$  
$b = \frac{3 \times \sin (70°)}{\sin (65°)}=3.11$  

<br/>

$\frac{a}{\sin A} = \frac{c}{\sin C}$  
$\frac{a}{\sin A} \times \sin C = \frac{c}{\sin C} \times \sin C$  
$c = \frac{a \times \sin C}{\sin A}$  
$c = \frac{3 \times \sin (45°)}{\sin (65°)}=2.341$  


#### The cosine rule

$$a^2 = b^2 + c^2 - 2bc·cos(A)$$
$$b^2 = a^2 + c^2 - 2ac·cos(B)$$
$$c^2 = a^2 + b^2 - 2ab·cos(C)$$


**Example**  
For triangle ABC, A=45°, b=3, c=5, find a,

$a^2= b^2 + c^2 - 2bc·cos(A)$  
$= 32 + 52 - 2×3×5×cos(45°)$  
$= 12.787$  

$a=\sqrt{12.787}=3.576$

## Trigonometric functions

[Trigonometric functions](./Trigonometry-functions.md)

## Unit circle 

https://www.math.net/unit-circle

A unit circle is a circle with a radius of 1.


### :pencil: Notes

$2\pi =360° \qquad\to by  \qquad (perimeter)2\pi·R = 360° = 2\pi \qquad \{R=1\}$  
$rad=deg \times \frac{\pi}{180} \qquad deg=rad \times \frac{180}{\pi}$

$\pi=180° \qquad\to by \qquad \frac{2\pi}{2}=\pi$

$\frac{\pi}{2}=90°$

### How to use the unit circle

#### Special angles

<div align='center'>

![alt](https://www.math.net/img/a/trigonometry/unit-circle/unit_circle_angles.png)

</div>

## Degrees to radians

$\frac{\Pi}{180°}$



