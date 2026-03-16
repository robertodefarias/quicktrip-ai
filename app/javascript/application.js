import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("turbo:load", () => {
  window.scrollTo(0, 0)

  const messages = document.getElementById("messages")

  if (messages) {
    messages.scrollIntoView({ behavior: "smooth", block: "end" })
  }
})
