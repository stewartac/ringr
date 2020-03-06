require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("@rails/ujs").start()

import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';

window.addEventListener('load', () => {
  initMapbox();
})
