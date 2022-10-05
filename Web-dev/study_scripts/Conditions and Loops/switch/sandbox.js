let val = Math.floor(Math.random() * 20) + 1;

switch(val) {
    case 1:
    case 2:
    case 3:
        console.log(`${val} is between 1 and 3.`);
        break;
    case 4:
        console.log(`${val} is 4.`);
        break;
    default: 
        console.log(`${val} is greater than 4.`);
        break;
}

let day;

switch(new Date().getDay())
{
    case 0:
        day = "Sunday";
        break;
    case 1:
        day = "Monday";
        break;
    case 2:
        day = "Tuesday";
        break;
    case 3:
        day = "Wednesday";
        break;
    case 4:
        day = "Thursday";
        break;
    case 5:
        day = "Friday";
        break;
    case 6:
        day = "Saturday";
        break;
}

console.log(`Today is ${day}`);

let dayofweek = new Date().getDay();

if(dayofweek == 0) {
    day = "Sunday";
}
else if(dayofweek == 1) {
    day = "Monday";
}
else if(dayofweek == 2) {
    day = "Tuesday";
}
else if(dayofweek == 3) {
    day = "Wednesday";
}
else if(dayofweek == 4) {
    day = "Thursday";
}
else if(dayofweek == 5) {
    day = "Friday";
}
else if(dayofweek == 6) {
    day = "Saturday";
}

console.log(`Today is ${day}`);