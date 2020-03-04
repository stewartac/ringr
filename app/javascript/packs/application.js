require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("@rails/ujs").start()

import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})
