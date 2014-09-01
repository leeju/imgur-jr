$(document).ready(function() {
	login = $('#loginUser');
	buttonLogin = $('#signin-button');
	buttonLoginForm = $('form[id=new_session]')
	
	exitHiddenDiv(login);
  buttonLogin.on('click', loginButtonToggle);

  buttonLoginForm.on('submit', submitLogin);
});

function backgroundFadeIn() {
  $('body').css({"background-color": "black"});
  $('.container').css({"opacity": "0.5", "pointer-events": "none"});
}

function backgroundFadeOut() {
  $('body').css({"background-color": "#20272D"});
  $('.container').css({"opacity": "1", "pointer-events": "auto"});
}

function loginButtonToggle() {
	backgroundFadeIn();
	login.fadeIn('fast');
}

function submitLogin() {
	console.log("Hi");
  event.preventDefault();
  $.ajax('/sessions', {
    method: 'post',
    data: $(this).serialize(),
    dataType: 'json',
    success: function(data) {
      login.fadeOut('fast');
      backgroundFadeOut();
    },
    error: function(xhr, status, error) {
      login.effect("shake");
    }
	})
}

function exitHiddenDiv(element) {
  $(element).mouseup(function(){ return false; });
  $(document).on("mouseup", function() {
    $(element).fadeOut('fast');
    backgroundFadeOut();
  });
}

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
