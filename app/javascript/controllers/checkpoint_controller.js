import { csrfToken } from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]
  static values = {
    trailId: Number
  }

  connect() {
    this.gpsBind = this.gps.bind(this)
    // this.formTarget
    // this.start()
  }

  start() {
    console.log("ENTREI AQUI")
    
    if ("geolocation" in navigator) {
      
      console.log(this.trailIdValue)
      this.interval = setInterval( this.gpsBind, 1000)
    } else {
      alert("I'm sorry, but geolocation services are not supported by your browser.");
    }
    
  }

  stop() {
    console.log("ENTREI AQUI")
    clearInterval(this.interval);
  }

  gps() {
    const url = `/trails/${this.trailIdValue}/checkpoints`
    navigator.geolocation.getCurrentPosition((position) => {
      const lat = position.coords.latitude;
      const long = position.coords.longitude;
      console.log(`${lat} ${long}`)
      
      fetch(url, {
        method: "POST",
        headers: { "Accept": 'application/json', 'Content-Type': 'application/json', "X-CSRF-Token": csrfToken() },
        body: JSON.stringify({lat: lat, long: long})
      })
        .then(response => response.text())
        .then((data) => {
          console.log(data)
        })
    });
  }
}
