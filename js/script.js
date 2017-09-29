/* global window, Reveal */

(function() {
	'use strict';

	var header = document.querySelector( 'header' );
	var footer = document.querySelector( 'footer' );
	var splash = document.querySelector( '#splash' );
	var banner = document.querySelector( '#banner' );

	/**
	* Callback invoked upon a `ready` event.
	*
	* @private
	* @param {Event} event - event
	*/
	function onReady( event ) {
		if (
			event.currentSlide === banner ||
			event.currentSlide === splash
		) {
			header.classList.add( 'hidden' );
			footer.classList.add( 'hidden' );
		} else {
			header.classList.remove( 'hidden' );
			footer.classList.remove( 'hidden' );
		}
	}

	/**
	* Callback invoked upon a `slidechanged` event.
	*
	* @private
	* @param {Event} event - event
	*/
	function onChange( event ) {
		if (
			event.currentSlide === banner ||
			event.currentSlide === splash
		) {
			header.classList.add( 'hidden' );
			footer.classList.add( 'hidden' );
		} else if (
			event.previousSlide === banner ||
			event.previousSlide === splash
		) {
			header.classList.remove( 'hidden' );
			footer.classList.remove( 'hidden' );
		}
	}

	Reveal.addEventListener( 'ready', onReady );
	Reveal.addEventListener( 'slidechanged', onChange );
})();
