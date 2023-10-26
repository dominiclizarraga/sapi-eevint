import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['list']

  close () {
    this.listTarget.classList.add('hidden')
    this.element.remove()
  }
}
