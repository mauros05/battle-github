// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

document.addEventListener('turbolinks:load', () => {
  // Call your functions here
  console.log("Hi from the console");
  const button = document.getElementById("button")
  const laod = document.getElementById("load")
  button.addEventListener("click", () => {
    load.classList.add("lds-ring")
  })

});
