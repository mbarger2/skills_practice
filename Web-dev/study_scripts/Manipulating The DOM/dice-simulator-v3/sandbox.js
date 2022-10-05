let num = get_number("Enter the number of rolls.");

let results = roll_dice(num);

let table = document.getElementById("results");
log_results(num, results, table);

table.classList.remove("hide");