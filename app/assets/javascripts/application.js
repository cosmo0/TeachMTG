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

// Loads a deck from TappedOut into the site
(function( $ ) {
    $.fn.displayDeck = function(deckId, options) {
        
        var settings = $.extend({
            title: ".deckTitle",
            cardImage: "#cardImage",
            infos: "#deckInfos"
        }, options);

        var caller = this; // conserve a reference to the caller object, because we'll need it inside the ajax callback
        var $img = $(settings.cardImage); // we'll need it later

        $.ajax({
            url: "http://tappedout.net/mtg-decks/" + deckId
        }).done(function (data) {
            var $data = $(data); // convert to jQuery object

            // title of the deck
            if (settings.title != "" && $(settings.title)) {
                $(settings.title).text($data.find(".hero-unit h1").text());
            }

            // load the contents of the deck
            caller.html($data.find(".board-container").removeClass("row"));
            caller.find(".board-col:has(h3:contains('Maybe'))").remove(); // remove "maybeboard"
            caller.find(".board-col").removeClass("span").removeClass("board-col").addClass("span6"); // cleanup columns
            caller.find("a.qty.board").contents().unwrap(); // remove links on quantities

            caller.find("a.card-link").each(function(){ // cleanup card links
                $(this).removeAttr("data-original-title").removeAttr("data-content"); // remove unused attributes
                $(this).attr("href", "http://tappedout.net" + $(this).attr("href")); // fix link
                if ($img) {
                    $(this).hover(function(){
                        // set the image source
                        $img.attr("src", $(this).data("card-img")).attr("alt", $(this).data("card-alt"));
                        // position the image
                        var pos=$(this).offset();
                        $img.css({ left: pos.left + 150, top: pos.top + 5 });
                        // show it
                        $img.show();
                    }, function(){
                        $img.hide();
                    });
                }
            });

            // loads the description of the deck
            if (settings.infos != "" && $(settings.infos)) {
            console.log($data.find(".well:has(.board-container) h3"));
                //$(settings.infos).html(.nextAll());
            }

        });

        return this;
    };
}( jQuery ));