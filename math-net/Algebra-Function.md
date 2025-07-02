
## Absolute value


## Domain and range

the domain is the set of values that we can plug into a function that will result in a real y-value; 

the range is the set of values that the function takes on as a result of plugging in an x value within the domain of the function


### Interval notation

#### Interval notation symbols

- [] - brackets denote a closed interval
- () - parenthesis denote an open interval
- ∪ - union represents the joining together of two sets
- ∩ - intersection represents the overlap between two sets

#### Interval notation: union and intersection


(-∞, 1) ∪ (1, ∞)  
Intersection is used to denote the interval over which two sets overlap.

(-∞, 4] ∩ [2, 22]  
The above reads as "the intersection between the sets (-∞, 4] and [2, 22]," which is [2, 4].


### Set notation


### Even and odd functions

#### How to tell if a function is even or odd

Event function: $f(x)=f(-x)$

Odd function: $f(-x)=-f(x)$

#### Properties of even and odd functions

##### Addition and subtraction properties

##### Multiplication and division properties

## hyperbola

https://www.storyofmathematics.com/hyperbola/

## Parabola

https://www.math.net/parabola

### Standard form of a parabola

$(x−h)^2=4p(y−k)$  

see also [Identity property](./PrimaryMath.md#identity-property)  
calculate y  
$\frac{(x−h)^2}{4p}=y−k$  
$\frac{(x−h)^2}{4p}+k=y−k+k$  
$\frac{(x−h)^2}{4p}+k=y$  
$y=\frac{(x−h)^2}{4p}+k$  

## Inverse function

see also [gfg](https://www.geeksforgeeks.org/inverse-functions/#conditions-for-inverse-function)

Inverse functions are a way to "undo" a function. In the original function, plugging in x gives back y, but in the inverse function, plugging in y (as the input) gives back x (as the output).

To find the inverse of a function, you need to do the opposite of what the original function does to x.

Not all functions have inverses.

---

:pencil: Note

If functions f(x) and g(x) are inverses of each other, then f(x) = y only if g(y) = x. 


$g(f(x)) = x$

---

**Example**

Original function  
$f(x)=3x-5$

First multiply by 3  
Then subtract 5

Inverse function  
$f^{-1}(x)=\frac{x+5}{3}$

First add 5  
Then divide by 3

Details to get inverse function  
$y=3x-5$  
$x=3y-5$  
$x+5=3y$  
$\frac{x+5}{3}=\frac{3y}{3}$  

Get expression for y  
$y=\frac{x+5}{3}$


$x+5=3y$ and $y=\frac{x+5}{3}$, They are the same.


```js
var f = (x) => { return 3 * x - 5 }
var inf = (x) => { return (x + 5) / 3 }
var x = 123
console.log(inf(f(x)))
//123
```

---
**Example**

The logarithmic function is the inverse of the exponential function.

$e^x = y\;$  < >  $\;\ln(y)=x$

$e^6=403.428793492735$  
$\ln(403.428793492735)=6$

```javascript
var y = Math.pow(Math.E,6)
//403.428793492735
var x = Math.log(y)
// 6
```

**Example**  
1\. In the original equation, replace f(x) with y:

$f(x)=5\sqrt{x+4}-3$   

$y=5\sqrt{x+4}-3$  

2\. Replace every x in the original equation with a y and every y in the original equation with an x

$y=5\sqrt{x+4}-3$  

$x=5\sqrt{y+4}-3$  

3\. Solve for y:

$x=5\sqrt{y+4}-3$  

$x+3=5\sqrt{y+4}$  

$\frac{x+3}{5}=\sqrt{y+4}$  

$(\frac{x+3}{5})^2=y+4$  

$y=(\frac{x+3}{5})^2-4$; $-4$ to cancel $+4$ in $y+4$  

4\. Change y to $f^{-1}(x)$:

$f^{-1}(x)=(\frac{x+3}{5})^2-4$


5\. Apply domain restrictions as necessary.

## Even and odd functions

### Even and odd functions: testing algebraically

For a function to be even, the following must be true:

$$f(x) = f(-x)$$

**Example**  
Determine whether $f(x) = 5x^4 + 4x^2 + 2$ is an even function.

For f(x) to be an even function, f(x) must equal f(-x). Plugging -x into f(x) yields:

$f(-x) = 5(-x^4) + 4(-x^2) + 2$  
$=5x^4 + 4x^2 + 2$

Since $f(x) = f(-x)$, $5x^4 + 4x^2 + 2$ is an even function.

<br/><br/>

For a function to be odd, the following must be true:

$$f(-x) = -f(x)$$

**Example**  
Determine whether $f(x) = 5x^5 - 4x^3 + 2x$ is an odd function.

For f(x) to be an odd function, f(-x) must equal -f(x). Plugging -x into f(x) yields:

$f(-x) = 5(-x^5) - 4(-x^3) + 2(-x)$  
$-5x^5+4x^3-2x=-(5x^5-4x^3+2x)$

Since $f(-x) = -f(x)$ , $5x^5 - 4x^3 + 2x$ is an odd function.

If a function does not follow the rule f(x) = f(-x) or f(-x) = -f(x), the function is neither even nor odd.  

Most functions are neither even nor odd, with the only function being both even and odd being f(x) = 0.

<br/>

Note that even functions that are polynomials only have even exponents. Odd functions that are polynomials only have odd exponents.


### Properties of even and odd functions

#### Addition and subtraction properties

- even + even = even
- odd + odd = odd
- odd - odd = odd
- even - even = even
- even + odd = neither even nor odd unless one of the functions is f(x) = 0.

#### Multiplication and division properties

- even × even = even
- odd × odd = even
- even × odd = odd
- even ÷ even = even
- odd ÷ odd = even
- even ÷ odd = odd

