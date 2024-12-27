# Formulas

## Difference of Squares

https://www.storyofmathematics.com/difference-of-squares/

$a^2 – b^2 = (a + b) (a – b)$

## Perfect Square Trinomial

https://www.storyofmathematics.com/perfect-square-trinomial/

$(a+b)(a+b)=a^2+2ab+b^2$

$(a-b)(a-b)=a^2-2ab+b^2$

$(a \pm b)^2=a^2 \pm 2ab+b^2$

# Expressions and equations

## Expressions vs. Equations

An expression is a combination of variables and numbers that undergo operations such as addition, subtraction, multiplication, division, and more.  
Below are some examples of expressions:
- x + 5
- x - 12
- 7 × 4x - x2
- $\frac{x}{3}$
- (x2)(x + 4)

<br/><br/>

Equations on the other hand, have a relationship. Often it is a relationship between two expressions separated by some kind of symbol, be it an equals sign (=), inequality symbol (<, >, ≥), or some other symbol.  
$x - 4 = 12 - 3x$  
$x + 3x = 12 + 4$  
$4x = 16$  
$x = 4$  

## Equality



# Radical

A radical expression, also referred to as an $n^{th}$ root, or simply radical, is an expression that involves a root.

Radicals are expressed using a radicand (similar to a dividend), a radical symbol, and an index, which is typically denoted as "n."

a radical written without an index is assumed to be a square root.

![alt](https://www.math.net/img/a/algebra/radical/radical/radical.svg)

The above figure, as a whole, makes up a radical. It is read as "the $n^{th}$ root of (x + 2)."

Note that radicals and exponents are closely related, and a radical can be written as the radicand raised to the power of $\frac{1}{n}$

$$\sqrt[n]{x}=x^{\frac{1}{n}}$$

## Properties of radicals

$\sqrt[n]{xy}$ = $\sqrt[n]{x}\times\sqrt[n]{y}$

$\sqrt[n]{\frac{x}{y}}$ = $\frac{\sqrt[n]{x}}{\sqrt[n]{y}}$

---

if $\;x^n=z\;$ then $\;x=\sqrt[n]{z}\;$; z must be ≥ 0 for even n)  
Example: $\;10^2=100$; $10=\sqrt[2]{100}$



$\sqrt[n]{x^n}=x$; (if x ≥ 0 or if n is odd)


$\sqrt[n]{x^n}=|x|$; (when x < 0 and n is even)


$\sqrt[n]{x^m}=(\sqrt[n]{x})^m$

## Simplifying radicals
 
Simplifying square root radicals involves using the following property of radicals:  
$\sqrt{xy}=\sqrt{x} \times \sqrt{y}$

$\sqrt{44}=\sqrt{4} \times \sqrt{11}=2\sqrt{11}$

$\sqrt{96}=\sqrt{16} \times \sqrt{6}=4\sqrt{6}$

$\sqrt{\frac{5}{9}}=\sqrt{\frac{1}{9}} \times \sqrt{5}=\frac{1}{3}\sqrt{5}$ OR $\sqrt{\frac{5}{9}}=\frac{\sqrt{5}}{\sqrt{9}}=\frac{\sqrt{5}}{3}$

## Square root

A square root is a number that can be multiplied by itself to give us the value under the radical symbol (also referred to as the radix).

![alt](https://www.math.net/img/a/algebra/radical/square-root/sqrt.svg)

In the figure above, z is the square root of x.

We can also write this as "z raised to the power of 2 is equal to x" as follows:  
$z^2=x$

Example:
Solve: $2x^2 \times -8 = 0$  
$2(x^2-4)=0$  
$x^2-4=0$  
$\sqrt{x^2}=\sqrt{4}$  
$x=\pm\sqrt{4}=\pm2$

# Solving equations

## Completing the square

see also [Perfect Square Trinomial](#perfect-square-trinomial)

Generally, the goal behind completing the square is to create a perfect square trinomial from a quadratic.  
A perfect square trinomial is a trinomial that will factor into the square of a binomial.

The square of $x + n$ is $x^2 + 2nx + n^2$. As you can see, the coefficient of x is $2n$.  
For a quadratic of the form $x^2 + bx + c$, the coefficent of $x$ is already $b$, so we only need to figure out the value of the constant $c$. 

If $2n = b$, then $n = \frac{b}{2}$. Therefore, the binomial used to complete the square is: $x \pm \frac{b}{2}$  
If we square this binomial, the perfect square trinomial needed to complete the square will equal:

$(x+\frac{b}{2})^2=x^2+bx+(\frac{b}{2})^2$  
OR  
$(x-\frac{b}{2})^2=x^2-bx+(\frac{b}{2})^2$  

<br/>

1 Write the given equation in the standard form of the quadratic equation:  
$ax^2+bx+c=0$

Example  

$2x^2=7x-6$  
$2x^2-7x+6=0$

<br/>

2 *Factor out* and divide both sides by the coefficient of $x^2$ if it does not already equal 1:

$2x^2-7x+6=0$

$2(x^2-\frac{7}{2}x+3)=0$

$x^2-\frac{7}{2}x+3=0$

Note: Dividing both sides by 2 cancels out 2 on the left side of the equation. On the right, $\frac{0}{2}=0$.  

<br/>

3 Move the constant to the other side of the equation.

$x^2-\frac{7}{2}x=-3$

<br/>

4 Add $(\frac{b}{2})^2$ to both sides of the equation (to keep them equivalent):

$x^2-\frac{-7}{2}x=-3$

$b=\frac{-7}{2}; \quad \frac{b}{2}=-\frac{7}{4}; \quad (\frac{b}{2})^2=(-\frac{7}{4})^2$

$x^2-\frac{7}{2}x+(\frac{-7}{4})^2=-3+(\frac{-7}{4})^2$

$x^2-\frac{7}{2}x+(\frac{-7}{4})^2=-3+\frac{49}{16}=\frac{-3}{1}+\frac{49}{16}=\frac{-48}{16}+\frac{49}{16}$

$x^2-\frac{7}{2}x+(\frac{-7}{4})^2=\frac{1}{16}$

Factor the side with $x^2+bx+(\frac{b}{2})^2 \quad to \quad (x+\frac{b}{2})^2$

$x^2-\frac{7}{2}x+(\frac{-7}{4})^2=\frac{1}{16}$

$(x-\frac{7}{4})^2=\frac{1}{16}$

Solve for x:

$\sqrt{(x-\frac{7}{4})^2}=\sqrt{\frac{1}{16}}$

$x-\frac{7}{4}=\pm\frac{1}{4}$

$x=\frac{7}{4}\pm\frac{1}{4}$

$x=2 \quad or \quad x=\frac{3}{2}$


## Discriminant

$b^2-4ac$

If the discriminant is less than 0, then the quadratic has no real solution.

# Exponents

## Exponents

An exponent is a number that tells us how many times the base it is attached to is used as a factor.

this context, and we can read $5^3$ as "five to the power of three," which works out to:

$5^3=5\times5\times5=125$

<br/>

In the case of a negative exponent,  
we can rearrange the expression by taking the reciprocal, then raising it to a positive exponent, as long as the base is a non-zero real number.

$5^{-3}=\frac{1}{5^3}=\frac{1}{125}$

<br/>

If an exponent is not an integer, and is positive, we take the $n^{th}$ root of the base, where n is the exponent.

$5^{\frac{1}{3}}=\sqrt[3]{5}$

### Exponent properties

Any non-zero base raised to the power of 0 is 1.  
$123456789^0 = 1$

<br/>

$0^0$ is a special case that does not have a definite answer; it is most commonly said to equal 1, or is said to be undefined.

<br/>

0 taken to any power greater than 0 is 0. 0 taken to a negative exponent is undefined.  
$0^12345678=0$  
$0^{-5}=\frac{1}{0^5}=\frac{1}{0}=undefined$

<br/>

Any number taken to the power of 1 equals itself. 1 taken to the power of any number equals 1.  
$n^1 = n$  
$1^n = 1$
