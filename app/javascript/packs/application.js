require("@rails/activestorage").start()
require("channels")
require("@rails/ujs").start()
import "bootstrap";
import { mapBox } from '../plugins/init_mapbox';
import { initSweetalert } from '../plugins/init_sweetalert';
// import Swal from "sweetalert2";

mapBox();

const checkboxInputs = document.querySelectorAll('.form-check-input');
checkboxInputs.forEach((input) => {
  input.addEventListener('click', () => {
    input.classList.toggle('active');
  })
})

const mapPopUps = document.querySelectorAll('.mapboxgl-marker');
mapPopUps.forEach(marker => {
  marker.addEventListener('click', event => {
    // when the click happens, the corresponding card should hover
    const id = marker.id
    // find the id of the marker
    // identify the corresponding card by searching for the same id

    // Reset cards select effect
    document.querySelectorAll('.game-card').forEach((card) => {
      card.classList.remove('ghost-hover')
    });

    const card = document.querySelector(`#card-${id}`)
    // inject a pseudo-class into that corresponding card
    card.classList.toggle('ghost-hover')
    card.scrollIntoView();
  })
})


const joinTeamRequest = document.querySelector("#join-button-sweet");
joinTeamRequest.addEventListener('click', event => {
  initSweetalert()
})


// initSweetalert('#join-button-sweet', {
//   title: "Enter the password provided by the team captain",
//   text: "This is a great alert, isn't it?",
//   icon: "success"
// }, (value) => {
//   sconsole.log();
// });

