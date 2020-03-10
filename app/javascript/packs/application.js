require("@rails/activestorage").start()
require("channels")
require("@rails/ujs").start()
require("turbolinks").start()

import "bootstrap";

import { mapBox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  mapBox();
  const checkboxInputs = document.querySelectorAll('.form-check-input');
  checkboxInputs.forEach((input) => {
    input.addEventListener('click', () => {
      input.classList.toggle('active');
    })
  })

  const iconClick = document.querySelectorAll('.form-check-input');
})


