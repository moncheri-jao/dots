function spinWords(string) {
	let morethanfive = ' ';
	morethanfive = string.split(" ").map( word => { 
		word.length > 4 ? word = word.split("").reverse().join("") : word = word;
		return word;
	}).join(" ");
	return morethanfive;
}
let b = spinWords("Welcome");
console.log(b);
