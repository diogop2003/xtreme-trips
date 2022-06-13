import { Controller } from "stimulus"
import mapboxgl from "!mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    array: Array,
    marker: Array
  }

  connect() {
    console.log("CONECTOU")
    mapboxgl.accessToken = 'pk.eyJ1IjoiaGVpdG9yLWNvY2EiLCJhIjoiY2w0N2Q1djh2MGI4czNkcnljcWEybGJpeiJ9.zMcxCyfzHYKdplZPO7OGfQ';
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v10', // style URL
      center: this.markerValue, // starting position [lng, lat]
      zoom: 12 // starting zoom
    });

    new mapboxgl.Marker()
      .setLngLat(this.markerValue)
      .addTo(this.map)
    
    this.map.on('load', () => {
      this.map.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates': this.arrayValue
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
    });
 };
};




