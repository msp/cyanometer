// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import React from "react"
import ReactDOM from "react-dom"
import moment from "moment"

import { DateField, Calendar } from 'react-date-picker'

import { CyanDisplay } from "web/static/js/cyanDisplay";
import { CyanEnviromentalData } from "web/static/js/cyanEnviromentalData";
import { CyanMeasurements } from "web/static/js/cyanMeasurements";

ReactDOM.render(
  // TODO fix up location
  <CyanDisplay source="/api/locations/1/images"/>, document.getElementById("cyan-display")
)

ReactDOM.render(
  <CyanEnviromentalData source="/api/environmental_datas"/>, document.getElementById("cyan-environmental-data")
)

ReactDOM.render(
  <CyanMeasurements source="http://www.arso.gov.si/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"/>, document.getElementById("cyan-measurements")
)

// setInterval(function() {
//   ReactDOM.render(
//     <HelloWorld date={new Date()} />,
//     document.getElementById('hello-world')
//   );
// }, 500);
