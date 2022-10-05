let val = Math.floor(Math.random() * 20) + 1;

if (val === 0) {
    console.log("0 is neither even or odd.");
}
else if (val % 2 === 0) {
    console.log(`${val} is even.`);
}
else {
    console.log(`${val} is odd.`);
}

if (val >= 1 && val <= 5) {
    console.log(`${val} is between 1 and 5.`);
}
else {
    console.log(`${val} is greater than 5.`);
}

if (val % 2 === 0 || val === 13) {
    console.log(`${val} is even or 13.`);
}
else {
    console.log(`${val} is odd and not 13.`);
}

if ((val > 5 || val < 10) && val % 3 === 0) {
    console.log(`${val} is 9.`);
}

if (val > 5 || (val < 10 && val % 3 === 0)) {
    console.log(`${val} is 3, 6, 9 or anything greater than 5.`);
}