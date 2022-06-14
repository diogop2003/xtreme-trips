import { Controller } from "stimulus"

export default class extends Controller {
  static targets =['card']

  connect() {
    console.log("CONECTOU")
  }

  open() {
    this.cardTarget.classList.toggle('event-card-2');
  }

}
