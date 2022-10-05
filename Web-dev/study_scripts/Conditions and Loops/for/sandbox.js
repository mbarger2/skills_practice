//     init     test   increment
for(let i = 1; i <= 5; i++) {
    console.log(i);
}

let s1 = "elephant";
for(let i = 0; i < s1.length; i++) {
    console.log(`The character at index ${i} is ${s1.charAt(i)}`);
}

for(let i = s1.length - 1; i >= 0; i--) {
    console.log(`The character at index ${i} is ${s1.charAt(i)}`);
}

let sum = 0;
for(let i = 1; i <= 10; i++) {
    sum += Math.floor(Math.random() * 6) + 1;
}

console.log(`The average of 10 rolls was ${sum / 10}`);