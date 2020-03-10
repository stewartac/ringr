require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("@rails/ujs").start()

import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';

window.addEventListener('load', () => {
  initMapbox();
})


const checkboxInputs = document.querySelectorAll('.form-check-input');

checkboxInputs.forEach((input) => {
  input.addEventListener('click', () => {
    input.classList.toggle('active');
  })
})

const iconClick = document.querySelectorAll('.form-check-input');
