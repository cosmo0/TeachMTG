// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery_ujs
//= require bootstrap
//= require markdown.converter
//= require markdown.sanitizer
//= require markdown.editor
//= require_tree .

// Avoid `console` errors in browsers that lack a console.
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());

// loads a card image on mouse over
$(function() {
    $(".decklist .card a").hover(function() {
        var caller = $(this);
        // create a HTML element within the .card caller element
        var preview = $('<div id="cardImage"></div>').html('<img src="/assets/images/loading.gif" /><br />Loading card...');
        caller.parents(".card").append(preview);
        // AJAX loading of the card image
        var imgUrl = "/decks/get_image?card=" + encodeURIComponent(caller.data("name"));
        console.log(imgUrl);
        preview.load(imgUrl);
    }, function() {
        // destroys the created HTML element
        $("#cardImage").remove();
    });
})