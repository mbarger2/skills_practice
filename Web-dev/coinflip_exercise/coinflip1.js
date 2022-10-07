function flip(guess) {
    // random int either 1 or 2
    let result = Math.floor(Math.random()*2)+1;
    // get message paragraph
    let message = document.getElementById("message");

    // compare result of random gen vs. guess
    if(result==1){ //we'll assign 1 as 'heads'
        if(guess == "heads"){
            message.innerHTML = "You guessed heads.<br>The coin flips and comes up heads!<br> Good Guess!";
        }
        else{
            message.innerHTML = "You guessed tails.<br>The coin flips and comes up heads!<br>Try again!";
        }
    }
    else{ //coin flips to show 'tails'
        if(guess == "tails"){
            message.innerHTML = "You guessed tails.<br>The coin flips and comes up tails!<br> Good Guess!";
        }
        else{
            message.innerHTML = "You guessed heads.<br>The coin flips and comes up tails!<br>Try again!"
        }
    }
}

