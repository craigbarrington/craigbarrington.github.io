console.clear()

const home = Deno.env.get("HOME")

const x = await Deno.mkdir(`${home}/Desktop/testerJS`)
