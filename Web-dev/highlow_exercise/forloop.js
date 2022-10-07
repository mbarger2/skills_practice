if(guess_array.length > 0){
    let guess_fill = guess;
    for(let i=0;i<guess_array.length;i++){
        if(guess_fill==guess_array[i]){
            message2.innerHTML = `You have guessed the number ${guess} before.<br>This guess does not count.<br>Please guess again.`
        }
    }
}
else 




7:16;
if(guess_array.length > 0){
    let guess_fill = guess;
    for(let i=0;i<guess_array.length;i++){
        if(guess_fill==guess_array[i]){
            message2.innerHTML = `You have guessed the number ${guess} before.<br>This guess does not count.<br>Please guess again.`;
        }
    }
}
else 

7:25;
if(guess_array.length > 0){
    if(guess_array.indexOf(guess)!=-1){
            message2.innerHTML = `You have guessed the number ${guess} before.<br>This guess does not count.<br>Please guess again.`;
        }
}

7:35
if(guess_array.length > 0){
    if(guess_array.indexOf(guess)!=-1){
            message2.innerHTML = `You have guessed the number ${guess} before.<br>This guess does not count.<br>Please guess again.`;
        }
}
else 

7:40;
//my final solution for this area was using flags :(
    if((guess_array.length > 0) && (guess_array.indexOf(guess)!=-1)){
                
        message2.innerHTML = `You have guessed the number ${guess} before.<br>This guess does not count.<br>Please guess again.`;
        flag = 'red';
    }
else{
flag = 'white';
}