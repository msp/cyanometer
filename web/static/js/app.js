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
// import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

const loc = window.location.pathname.match(/location\/(\d+)/i);
const archive = window.location.pathname.match(/archive\/(\d+)/i) || window.location.pathname.match(/archive/i);
const home = window.location.pathname.match(/\//i);
const count = getParameterByName('count') || 3;

// REACT ///////////////////////////////////////////////////////////////////////
import React from "react"
import ReactDOM from "react-dom"
import moment from "moment"

import { DateField, Calendar } from 'react-date-picker'

import { CyanLanding } from "web/static/js/cyanLanding";
import { CyanLandingImages } from "web/static/js/cyanLandingImages";
import { CyanDisplay } from "web/static/js/cyanDisplay";
import { CyanEnviromentalData } from "web/static/js/cyanEnviromentalData";
import { CyanMeasurements } from "web/static/js/cyanMeasurements";

// ELM /////////////////////////////////////////////////////////////////////////
import Elm from './main';


// ROUTES //////////////////////////////////////////////////////////////////////

if (loc) {
  ReactDOM.render(
    <CyanDisplay source={'/api/locations/'+ loc[1]+'/images/'}/>, document.getElementById("cyan-display")
  );

  ReactDOM.render(
    <CyanEnviromentalData source="/api/environmental_datas"/>, document.getElementById("cyan-environmental-data")
  );

  ReactDOM.render(
    <CyanMeasurements source="http://www.arso.gov.si/xml/zrak/ones_zrak_urni_podatki_zadnji.xml"/>, document.getElementById("cyan-measurements")
  );
} else if (archive) {
  const elmDiv = document.querySelector('#cyan-archive');

  if (elmDiv) {
    Elm.Main.embed(elmDiv);
  }
} else {
  ReactDOM.render(
    <CyanLanding source={'/api/landing/' + count} />, document.getElementById("cyan-display")
  );
}

function getParameterByName(name, url) {
  if (!url) {
    url = window.location.href;
  }
  name = name.replace(/[\[\]]/g, "\\$&");
  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
      results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return '';
  return decodeURIComponent(results[2].replace(/\+/g, " "));
}
