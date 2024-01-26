import React from "react";
import mapboxgl from "mapbox-gl";
import styles from "./styles.module.scss";

mapboxgl.accessToken =
  "pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4M29iazA2Z2gycXA4N2pmbDZmangifQ.-g_vE53SD2WrJ6tFX7QHmA";

class EquipmentMap extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      lng: 30.3438983,
      lat: 53.9078948,
      zoom: 11,
      geojson: {},
    };
  }

  setStateAsync(state) {
    return new Promise((resolve) => {
      this.setState(state, resolve);
    });
  }

  async componentDidMount() {
    const { lng, lat, zoom } = this.state;

    await this.setStateAsync({
      geojson: {
        type: "FeatureCollection",
        features: this.props.equipment?.map((item) => {
          if (item?.geoData) {
            return {
              type: "Feature",
              geometry: {
                type: "Point",
                coordinates: [item?.geoData?.lat, item?.geoData?.ing],
              },
              serialNum: item?.serialNum,
              machineId: item?.machineId,
              status:
                new Date() - new Date(item?.updatedAt) < 5 * 60 * 1000
                  ? "Активно"
                  : "Неактивно",
              properties: {
                title: item?.name,
                description: `Статус: ${
                  new Date() - new Date(item?.updatedAt) < 5 * 60 * 1000
                    ? "Активно"
                    : "Неактивно"
                }`,
              },
            };
          }
          return;
        }),
      },
    });

    const map = new mapboxgl.Map({
      container: this.mapContainer,
      style: "mapbox://styles/mapbox/streets-v9",
      center: [lng, lat],
      zoom,
    });

    map.on("move", () => {
      const { lng, lat } = map.getCenter();

      this.setState({
        lng: lng.toFixed(4),
        lat: lat.toFixed(4),
        zoom: map.getZoom().toFixed(2),
      });
    });

    /* console.log(!!this.state.geojson.features[0]);
    console.log(this.state.geojson.features); */

    if (this.state.geojson.features && !!this.state.geojson.features[0])
      this.state.geojson.features.forEach(function (marker) {
        // create a HTML element for each feature
        var el = document.createElement("div");
        el.className = [
          styles.marker,
          styles[
            new Date() - new Date(marker?.updatedAt) < 5 * 60 * 1000
              ? "active"
              : "off"
          ],
        ].join(" ");

        //Click on marker
        el.addEventListener("click", () => {
          window.open("/records");
        });

        // make a marker for each feature and add to the map
        new mapboxgl.Marker(el)
          .setLngLat(marker?.geometry?.coordinates)
          .setPopup(
            new mapboxgl.Popup({ offset: 25 }) // add popups
              .setHTML(
                "<h3>" +
                  marker.properties.title +
                  "</h3><p> Маркировка:" +
                  marker.machineId +
                  "</p><p> Серийный (инвентарный номер):" +
                  marker.serialNum +
                  "</p>"
              )
          )
          .addTo(map);
      });
  }

  render() {
    return (
      <div
        style={{ width: "100%", height: "100%" }}
        ref={(el) => (this.mapContainer = el)}
      />
    );
  }
}

export default EquipmentMap;
