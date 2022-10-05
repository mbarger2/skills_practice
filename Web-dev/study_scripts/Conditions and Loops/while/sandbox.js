let val = 0;

while(val != 1) {
    val = Math.floor(Math.random() * 6) + 1;
    console.log(`You roll the die, it's a ${val}`);
}

console.log("Now let's try to count the number of rolls.");
let count = 0;
val = 0; // reset the data

while(val != 1) {
    val = Math.floor(Math.random() * 6) + 1;
    count++; // add one to count
}

console.log(`It took you ${count} tries to roll a 1.`);