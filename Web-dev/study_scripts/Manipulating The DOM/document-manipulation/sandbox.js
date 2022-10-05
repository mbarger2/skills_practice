let div = document.querySelector(".container");

let newNode = document.createElement("p");
newNode.innerHTML = "DOM manipulation is <strong>super cool</strong>!";

div.appendChild(newNode);

let p2 = div.getElementsByTagName("p")[1];
div.removeChild(p2);

console.log(newNode.innerText);
console.log(newNode.innerHTML);
console.log(newNode.childNodes);