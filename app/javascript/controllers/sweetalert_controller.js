import Swal from 'sweetalert2'
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = { title: String }

  connect(){
    this.redirect = false;
  }


  addItem(event){

    if (this.redirect) return;

    Swal.fire({
      position: 'center',
      icon: 'success',
      title: "hola",
      title:  this.titleValue + "  " + "Se agrego al carrito",
      showConfirmButton: false,
      timer: 1500
    })
  }


signed(event){

  if (this.redirect) return;

  event.stopImmediatePropagation();
  event.preventDefault();

  const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })

  Toast.fire({
    icon: 'success',
    title: 'Signed in successfully'
  })
}

  show(event){

    if (this.redirect) return;


    event.stopImmediatePropagation();
    event.preventDefault();
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-danger me-2 rounded-pill',
        cancelButton: 'btn btn-success ms-2 rounded-pill',
        popup: 'round-4 bg-secondary',
        title: 'text-light',
        htmlContainer: 'text-light',
      },
      buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
      icon: 'warning',
      title: "Are you sure of delete" + " " + this.titleValue + "?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
      showCloseButton: true,
      showClass: {
        popup: 'animate__animated animate__bounceInUp'
      },
      hideClass: {
        popup: 'animate__animated animate__bounceOutUp'
      },
    }).then((result) => {
      if (result.isConfirmed) {
        this.redirect = true;
        this.element.click();
      }
      else{
        swalWithBootstrapButtons.fire({
          icon: 'error',
          title: 'Cancelled!',
          showConfirmButton: false,
          timer: 500,
          hideClass: {
            popup: 'animate__animated animate__bounceOutUp'
          }
        })
      }
    })
  }
}
