// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

var trigger = document.getElementById('js-trigger');
if(trigger){
  trigger.addEventListener('click', function(){
    var target = document.getElementById('sidebar');
    target.classList.toggle('open-sidebar');
  }, false);
}

import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 
import '@fortawesome/fontawesome-free/js/all'
import "../stylesheets/likes"
import "../stylesheets/sidebar"
import "../stylesheets/checkbox"
import "sidebar.js" 
import "checkbox.js"
import "slick"

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

//= require jquery
//= require rails-ujs
window.$ = window.jQuery = require('jquery'); 
require('packs/raty')

