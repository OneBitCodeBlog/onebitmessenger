import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    console.log("Conected at MessageChannel")
  },

  received(data) {
    let messageContainer = document.querySelector("div.message-container")
    messageContainer.innerHTML += data
    messageContainer.scrollIntoView(false)
  }
});
