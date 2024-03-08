// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require_tree .
//= require turbolinks
//= require rails-ujs

//= require chartkick

$(document).on('turbolinks:load', function () {
	// Hide warnings after 3.5s
	const banner = document.querySelector('.alert')
	if (banner !== null)
		setTimeout(() => {
			banner.style.visibility = 'hidden'
		}, 3500)

	// Display back to top button only when we have scrolled in the page
	const btop = document.querySelector('.back-to-top')
	if (btop !== null) {
		const btopHandler = () => {
			if (window.scrollY > 100) {
				btop.style.opacity = 1
			} else {
				btop.style.opacity = 0
			}
		}
		btopHandler()
		window.addEventListener('scroll', btopHandler)
	}
})
