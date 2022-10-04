let x = 10;
let y = 5;

let val = x + y;
console.log(`${x} + ${y} is ${val}`);
console.log(`x plus y is ${x+y}`);

val = x - y;
console.log(`${x} - ${y} is ${val}`);

val = x * y;
console.log(`${x} * ${y} is ${val}`);

val = x / y;
console.log(`${x} / ${y} is ${val}`);

y = 3;
val = x % y;
console.log(`${x} % ${y} is ${val}`);

console.log(`${x} % ${y} is ${val}`);
//double {{}} is not a thing, despite its use by the lesson
console.log(x + " + " + y + " is " + val);
console.log(x + ' + ' + y + ' is ' + val);

console.log(`In the case of money, x dollars times y dollars 
is equal to $${x*y}`);

console.log(`The following are practices in observing javascripts algebra
in relation to the PEMDAS method of operations:`);
x = 2; y=3; val = x - x * y;
console.log(x + '-' + x + '*' + y +'='+ val);
val = (x - x) * y;
console.log('(' + x + '-' + x + ')' + '*' + y +'='+ val);
val = x**2 - (y+x);
console.log( x + '**2 - (' + y + '+' + x + ')' +'='+ val);
