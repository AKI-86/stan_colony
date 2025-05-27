// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 
import 'bootstrap/dist/css/bootstrap.min.css'
import $ from 'jquery'
global.$ = $
global.jQuery = $

Rails.start()
Turbolinks.start()
ActiveStorage.start()


document.addEventListener("DOMContentLoaded", function () {
  const inputs = document.querySelectorAll('.custom-file-input');
  inputs.forEach(function(input) {
    input.addEventListener('change', function(e) {
      const fileName = e.target.files[0]?.name;
      const label = e.target.nextElementSibling;
      if (label && fileName) label.innerText = fileName;
    });
  });
});


$(document).on('click', '.pagination a', function(e) {
  e.preventDefault();
  var url = $(this).attr('href');
  $.getScript(url);
});