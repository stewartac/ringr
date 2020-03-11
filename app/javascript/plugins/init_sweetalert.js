import Swal from 'sweetalert2';

const initSweetalert = async () => {
  const { value: password } = await Swal.fire({
    title: 'You need a password to join this team',
    input: 'password',
    inputPlaceholder: 'Enter here or ask the team captain',
    inputAttributes: {
      maxlength: 10,
      autocapitalize: 'off',
      autocorrect: 'off'
    }
  })
  if (password) {
    // Swal.fire(`Entered password: ${password}`)
    const {value: confirm } = await Swal.fire({
      title: 'Congrats!',
      text: "You're in the team",
      icon: "success",
      confirmButtonText: "Woohoo!"
      })
  }
  if (confirm) {
    window.location.replace("4?newmember=1")
  }

}
// // const initSweetalert = (selector, options = {}, callback = () => {}) => {
// //   const swalButton = document.querySelector(selector);
// //   if (swalButton) { // protect other pages
// //     swalButton.addEventListener('click', () => {
// //       swal(options).then(callback); // <-- add the `.then(callback)`
// //     });
// //   }
// // };

export { initSweetalert };
