import { csrfToken } from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ ]
  static values = {
    trailId: Number
  }

  connect() {
    this.gpsBind = this.gps.bind(this)
  }

  start() {
    if ("geolocation" in navigator) {
      
      console.log(this.trailIdValue)
      this.interval = setInterval( this.gpsBind, 60000)
    } else {
      alert("I'm sorry, but geolocation services are not supported by your browser.");
    }
    
  }

  stop() {
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
