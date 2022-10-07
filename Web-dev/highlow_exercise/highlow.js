let num = Math.floor(Math.random()*20)+1;

console.log(num);

function do_guess(){
    let guess = Number(document.getElementById("guess").value);

    let message = document.getElementById("message");

    if(guess==num){
        message.innerHTML ="You got it!";
    }
    else if(guess > num){
        message.innerHTML = "No, try a lower number.";
    }
    else{
        message.innerHTML = "No, try a higher number.";
    }
    
}
