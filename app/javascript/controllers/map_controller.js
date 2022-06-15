import { Controller } from "stimulus"
import mapboxgl from "!mapbox-gl"

export default class extends Controller {
  static values = {
    trailId: Number,
    apiKey: String,
    array: Array,
  }
  
  connect() {
    this.gpsBind = this.gps.bind(this)
    console.log("CONECTOU")
    mapboxgl.accessToken = 'pk.eyJ1IjoiaGVpdG9yLWNvY2EiLCJhIjoiY2w0N2Q1djh2MGI4czNkcnljcWEybGJpeiJ9.zMcxCyfzHYKdplZPO7OGfQ';

    navigator.geolocation.getCurrentPosition((position) => {
      const lat = position.coords.latitude;
      const long = position.coords.longitude;
      const prepareArray = this.arrayValue.length == 0 ? [[long, lat]] : this.arrayValue
      this.buildMap(prepareArray)
    });
  };

  start() {
    
    if ("geolocation" in navigator) {
      this.interval = setInterval( this.gpsBind, 10000)
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
      
      fetch(url, {
        method: "POST",
        headers: { "Accept": 'application/json', 'Content-Type': 'application/json', "X-CSRF-Token": csrfToken() },
        body: JSON.stringify({lat: lat, long: long})
      })
      .then(response => response.text())
      .then((data) => {
        this.buildMap(data)
      })
    });
  }

  buildMap(array) {
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v10', // style URL
      center: array[array.length - 1 ], // starting position [lng, lat]
      zoom: 12 // starting zoom
    });

    new mapboxgl.Marker()
    .setLngLat(array[array.length - 1 ])
    .addTo(this.map)

    this.map.on('load', () => {
      this.map.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates': array
          }
        }
      });
  
      this.map.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
          'line-join': 'round',
          'line-cap': 'round'
        },
        'paint': {
          'line-color': '#ed6498',
          'line-width': 4
        }
      });
    })
  }
};
