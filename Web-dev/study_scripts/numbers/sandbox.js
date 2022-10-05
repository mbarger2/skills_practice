let val;

val = Math.PI;
console.log(`The value of PI is ${val}`);

val = Math.pow(2, 3);
console.log(`2 to the power of 3 ${val}`);

val = Math.sqrt(16);
console.log(`The square root of 16 is ${val}`);

val = Math.exp(1);
console.log(`E to the 1st power is ${val}`);

val = Math.cos(5);
console.log(`The cosine of 5 is ${val}`);

val = Math.sin(5);
console.log(`The sine of 5 is ${val}`);

val = Math.tan(5);
console.log(`The tangent of 5 is ${val}`);

val = Math.round(3.4);
console.log(`The round of 3.4 is ${val}`);

val = Math.round(-4.7);
console.log(`The round of -4.7 is ${val}`);

val = Math.round(3.45);
console.log(`WRONG: The round of 3.4 is ${val}`);

val = Math.round(3.45,3);
console.log(`INSUFFICIENT TEST: The round of 3.45 is ${val}`);

val = Math.ceil(3.4);
console.log(`The ceiling of 3.45 is ${val}`);

val = Math.ceil(-4.7);
console.log(`The ceiling of -4.7 is ${val}`);

val = Math.floor(3.4);
console.log(`The floor of 3.4 is ${val}`);

val = Math.floor(-4.7);
console.log(`The floor of -4.7 is ${val}`);

val = Math.trunc(3.4);
console.log(`The trunc of 3.4 is ${val}`);

val = Math.trunc(-4.7);
console.log(`The trunc of -4.7 is ${val}`);

val = Math.floor(Math.random() * 20) + 1;
console.log(`A random number between 1 and 20 is ${val}`);

val = Math.floor(Math.random() * 50) + 5;
console.log(`A random number between 5 and 55 is ${val}`);

// Math.pow(x,y)
// Math.sqrt(x)
// Math.exp(x)
// Math.PI
// Math.sin()
// Math.cos()
// Math.tan()
// Math.asin()      arcsin
// Math.acos()      arccos
// Math.atan()      arctan
// Math.cosh()      hyperbolic cos
// Math.sinh()      hyperbolic sin
// Math.tanh()      hyperbolic tan
// Math.LNx
// Math.logxE
// Math.round()     nearest integer (whole number), though fails at .45
// Math.ceil()      rounds up
// Math.floor()     rounds down
// Math.trunc()     drops all decimal portions
// Math.random()    random decimal between 0 and 1
// Math.floor(Math.random()* 20);   random between 0 and 19
// Math.floor(Math.random()* 50)+ 5;   random between 5 and 55