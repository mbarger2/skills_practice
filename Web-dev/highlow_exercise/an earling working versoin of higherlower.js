// the working
let num, goodmax;

function create_max(){

    let newmax = Number(document.getElementById("newmax").value);

    let message1 = document.getElementById("max message");
    if(newmax > 1){
        goodmax = Math.ceil(newmax);
        message1.innerHTML = `You have chosen ${goodmax}`;
        num = Math.floor(Math.random()*goodmax)+1;
    }
    else{
        message1.innerHTML = "This is not a valid value. Please try again.";
    }

console.log(num);
}
let guess_array = [];

function do_guess(){
    let guess = Number(document.getElementById("guess").value);

    let message2 = document.getElementById("message");

    if(guess==num){
        message2.innerHTML =`You got it! It took ${guess_array.length + 1} valid guesses with the incorrect ones being ${guess_array}. Thanks for playing!`;
    }
    else if(guess>goodmax || guess<1){
        message2.innerHTML = `That guess is out of range. Please guess a number between 1 and ${goodmax}.`
    }
    else if(guess > num){
        message2.innerHTML = "No, try a lower number.";
        guess_array.push(guess);
    }
    else if(guess < num){
        message2.innerHTML = "No, try a higher number.";
        guess_array.push(guess);
    }
    else{ 
        message2.innerHTML = `That is not a valid guess. Please guess a number between 1 and ${goodmax}.`
    }
    
}