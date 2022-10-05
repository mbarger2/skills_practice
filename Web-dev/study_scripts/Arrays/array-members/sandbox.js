let nums = [5, 10, 7, 3, 14, 20];

console.log(`The array contains: ${nums}`);

console.log(`The value at index 0 is: ${nums[0]}`);
console.log(`The value at index 4 is: ${nums[4]}`);

let i = nums.indexOf(7);
console.log(`The value 7 is at index: ${i}`);

// look for 7 starting at index 3
i = nums.indexOf(7, 3); 
if(i === -1) {
    console.log("We could not find the value 7 on or after index 3.")
}
else {
    console.log(`The value 7 appears after index 3 at index: ${i}`);
}

nums[1] = 6;
console.log(`The value at index 1 is: ${nums[1]}`);

nums.unshift(12); // push 12 on front, index 0, shifting all others down
nums.push(17); // add 17 to the end of the array at index 7

console.log(nums);

let n = nums.shift();
console.log(`Shifted value ${n} off the front`); 
console.log(`After shift, nums has these values: ${nums}`); 

n = nums.pop();
console.log(`Popped value ${n} off the back`); 
console.log(`After pop, nums has these values: ${nums}`); 

n = nums.splice(1,3);
console.log(`Spliced 3 values from index 1: ${n}`);
console.log(`After splice, nums has these values: ${nums}`); 

let nums2 = [3, 11, 16];
nums = nums.concat(nums2);
console.log(`After concat, nums has these values: ${nums}`); 

for(let x=0; x<nums.length; x++) {
    console.log(`Index: ${x}, Value: ${nums[x]}`);
}
