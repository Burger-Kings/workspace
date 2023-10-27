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

Rails.start()
Turbolinks.start()
ActiveStorage.start()

/* global $ */
$(document).on('turbolinks:load', function() {
  $('.images').slick({
      autoplaySpeed: 3500,
      autoplay: true,
  });
});


$(document).ready(function() {
  setTimeout(function() {
    $('#ctn-preloader').addClass('loaded');
    if ($('#ctn-preloader').hasClass('loaded')) {
      $('#preloader').delay(1000).queue(function() {
        $(this).remove();
      });
    }
  }, 4000);
});


$(function() {
    var windowWidth = $(window).width();
    $('#pagetop').hide();
    $(window).on('scroll', () => {
        if (windowWidth <= 768 && $(window).scrollTop() > 200) { 
            $('#pagetop').fadeIn();
        } else {
            $('#pagetop').fadeOut();
        }
    });
});
