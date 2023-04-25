
console.clear()

const url = "https://api.github.com/users/bard";

const response = await fetch(url);
const data = await response.json();

console.log(`

Login:\t${data.login}
url:\t${data.url}

`);
