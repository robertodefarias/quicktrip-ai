import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat-form"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.defaultPlaceholder = "Pergunte algo sobre sua viagem..."
    this.loadingPlaceholder = "Um momento por favor, estamos gerando seu roteiro QuickTrip..."
  }

  prepareForSubmit() {
    this.inputTarget.value = ""
    this.inputTarget.placeholder = this.loadingPlaceholder
    this.inputTarget.disabled = true
  }

  reset() {
    this.inputTarget.disabled = false
    this.inputTarget.value = ""
    this.inputTarget.placeholder = this.defaultPlaceholder
    this.inputTarget.focus()
  }

  submitOnEnter(event) {
    if (event.key === "Enter" && !event.shiftKey) {
      event.preventDefault()
      this.element.requestSubmit()
    }
  }
}
