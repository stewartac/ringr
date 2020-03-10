require("@rails/activestorage").start()
require("channels")
require("@rails/ujs").start()

import "bootstrap";

import { mapBox } from '../plugins/init_mapbox';

mapBox();

const checkboxInputs = document.querySelectorAll('.form-check-input');
checkboxInputs.forEach((input) => {
  input.addEventListener('click', () => {
    input.classList.toggle('active');
  })
})
