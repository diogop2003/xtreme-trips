import { Controller } from "stimulus"
import mapboxgl from "!mapbox-gl"

export default class extends Controller {
  static targets = ["map"]
  static values = {
    trailId: Number,
    apiKey: String,
    array: Array,
    icon: String,
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
    console.log("CONECTOU START")

    if ("geolocation" in navigator) {
      this.interval = setInterval( this.gpsBind, 2000)
    } else {
      alert("I'm sorry, but geolocation services are not supported by your browser.");
    }
  }

  stop() {
    console.log("CONECTOU STOP")
    clearInterval(this.interval);
  }

  gps() {
    console.log("CONECTOU GPS")
    const url = `/trails/${this.trailIdValue}/checkpoints`
    navigator.geolocation.getCurrentPosition((position) => {
      const lat = position.coords.latitude;
      const long = position.coords.longitude;

      fetch(url, {
        method: "POST",
        headers: { "Accept": 'application/json', 'Content-Type': 'application/json'},
        body: JSON.stringify({lat: lat, long: long})
      })
      .then(response => response.json())
      .then((data) => {
        if(data.length > 1) {
          if(this.userMarker){
            this.userMarker.remove()
          }
          const coordinates = data[data.length - 1]
          const el = document.createElement('i')
          el.className = this.iconValue
          this.userMarker = new mapboxgl.Marker(el)
          .setLngLat(coordinates)
          .addTo(this.map)
          this.map.flyTo({center: coordinates})
          this.map.removeLayer(`route`)
          this.map.removeSource(`route`)
          this.map.addSource('route', {
            'type': 'geojson',
            'data': {
              'type': 'Feature',
              'properties': {},
              'geometry': {
                'type': 'LineString',
                'coordinates': data
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
        }
      })
    });
  }

  buildMap(array) {
    console.log("CONECTOU mapa")
    console.log(typeof array)
    console.log(array[array.length - 1 ])
    this.map = new mapboxgl.Map({
      container: this.mapTarget, // container ID
      style: 'mapbox://styles/mapbox/streets-v10', // style URL
      center: array[array.length - 1 ], // starting position [lng, lat]
      zoom: 12 // starting zoom
    });

    new mapboxgl.Marker()
    .setLngLat(array[0])
    .addTo(this.map)

    const coordinates = array[array.length - 1]
    const el = document.createElement('i')
    el.className = this.iconValue
    this.userMarker = new mapboxgl.Marker(el)
    .setLngLat(coordinates)
    .addTo(this.map)

    this.map.on('load', () => {
      this.routeSource = this.map.addSource('route', {
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
      console.log(this.routeSource)
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
