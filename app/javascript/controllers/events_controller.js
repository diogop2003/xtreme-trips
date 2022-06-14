import { Controller } from "stimulus"

export default class extends Controller {
  static targets =['card']

  connect() {
    console.log("CONECTOU")
  }

  open(event) {
    console.log(event.target.parentNode)
    event.target.parentNode.classList.toggle('event-card-2');
  }

}
