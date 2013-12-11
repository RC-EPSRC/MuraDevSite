$(document).ready(function () {

    headerFunctions();

    copyrightDate();

    $('#content .secondary p.filter').on('click', 'a', function (e) {
        var activeClass = $(this).attr('class').replace(' active', '');
        $('#content .secondary p.filter a').removeClass('active');
        $(this).addClass('active');
        $('#content .secondary div.filter div').fadeOut(0);
        $('#content .secondary div.filter div.' + activeClass).fadeIn(animateTime / 4, easing);

        e.preventDefault();
    });

    $('header').on('click', '.menu', function (e) {
        $('header .mobile').fadeToggle();
        e.preventDefault();
    });

    $('.listing-filter').off('click').on('click', 'h2', function () {
        $(this).toggleClass('open');
        $(this).parent().find('> fieldset').fadeToggle();
    });


    $('#clonebag-latestupdates').append($('#latestupdates .slides'));
    $('#clonebag-keyfacts').append($('#keyfacts .slides'));

    setTimeout(function () {
        $('.large-image.feature').each(function () {
            if ($(this).is(':visible')) {
                var imgHeight = $('img', this).height();
                $('.copy', this).height(imgHeight - 1);
            }
        });
    }, 250);

});

// Equal height columns
function setEqualHeight(columns) {
    var tallestcolumn = 0;
    columns.each(function () {
        currentHeight = $(this).height();
        if (currentHeight > tallestcolumn) {
            tallestcolumn = currentHeight;
        }
    });
    columns.css('height', tallestcolumn);
}


function setHeaderButtons() {

    if ((($(window).width()) > (960 + 80 + 80) && ($(window).width()) < 1200) || (($(window).width()) > (1200 + 60 + 60))) {
        $('#slider .flex-direction-nav').show(0);
    } else if ((($.browser.msie && $.browser.version == '8.0') || ($.browser.msie && $.browser.version == '7.0') || ($.browser.msie && $.browser.version == '6.0')) && (($(window).width()) > (960 + 80 + 80))) {
        $('#slider .flex-direction-nav').show(0);
    } else {
        $('#slider .flex-direction-nav').hide(0);
    }
}

var smallLength = $('.small-image.feature').length;

function fireFunctions(size) {

    size = size.toString().replace('"', '').replace('"', '');

    if (size == 'core') {

        $('body').removeClass().addClass('max768');
        $('#content .tertiary .slide div').removeAttr('style');
        $('#content .primary h1').removeAttr('style');
        $('#content .primary .small-image.feature h2').removeAttr('style');

        $('#slider h2').adaptiveText({
            'minWidth': 1,
            'maxWidth': 767,
            'minFontSize': 20,
            'maxFontSize': 96,
            'compressor': 1
        });

        $('header').on('click', '.search', function (e) {
            $('header fieldset').fadeToggle();
            e.preventDefault();
        });

        var primaryNav = $('header .primary ul').not('.sub-nav ul').clone();
        var secondaryNav = $('header .secondary ul').clone().addClass('secondary');

        $('<nav class="mobile"></nav>').prependTo('header .wrap');
        $(primaryNav).prependTo('header .mobile');
        $(secondaryNav).prependTo('header .mobile');

        $('header .mobile').hide(0);

        $('<a href="#" class="menu"><strong>Menu</strong> <span></span></a>').insertAfter('header .logo');
        $('<a href="#" class="search">Search</a>').insertAfter('header .logo');

        $('.large-image.feature .copy').removeAttr('style');
        $('.small-image.feature.three').show(0);

        $('nav.tertiary').off('click').on('click', 'h2', function () {
            $(this).parent().find('> ul').fadeToggle();
        });

        $('aside').off('click').on('click', 'h2', function () {
            $(this).next().fadeToggle();
            $(this).toggleClass('open');
        });

        var overviewDiv = $('.event-tabs div.overview').clone();
        var locationDiv = $('.event-tabs div.location').clone();
        var agendaDiv = $('.event-tabs div.agenda').clone();

        overviewDiv.appendTo('.event-tabs ul .overview');
        locationDiv.appendTo('.event-tabs ul .location');
        agendaDiv.appendTo('.event-tabs ul .agenda');

        $('.event-tabs ul li').off('click').on('click', 'span', function () {
            $(this).parent().find('div').fadeToggle();
        });
    } else {
        $('header .mobile').remove();
        $('header .menu').remove();
        $('header .search').remove();
        $('nav.tertiary ul').removeAttr('style');
        $('.event-tabs ul li div').remove();
        $('.event-tabs div').removeAttr('style');
        $('.event-tabs ul li').removeClass('active');
        $('.event-tabs ul li.overview').addClass('active');
        $('header fieldset').removeAttr('style');
        $('#slider h2').removeAttr('style');
    }

    if (size == 'grid990') {

        $('body').removeClass().addClass('min768');
        $('#content .tertiary .slide div').removeAttr('style');
        $('#content .primary h1').removeAttr('style');
        $('#content .primary .small-image.feature h2').removeAttr('style');
        setEqualHeight($('#content .primary .small-image.feature h2'));

        $('#slider h2').removeAttr('style');

        $('.large-image.feature').each(function () {
            var imgHeight = $('img', this).height();
            $('.copy', this).height(imgHeight - 1);
        });

        if (smallLength == '3') {
            $('.small-image.feature.three').hide(0);
        }
    } else {
        $('.small-image.feature.three').show(0);
    }

    if ((size == 'grid990') || (size == 'grid1140')) {


    } else {

    }

    if (size == 'grid1140') {

        $('body').removeClass().addClass('min1200');
        $('#content .tertiary .slide div').removeAttr('style');
        $('#content .primary h1').removeAttr('style');
        $('#content .primary .small-image.feature h2').removeAttr('style');
        // setEqualHeight($('#content .tertiary .slide div'));
        // setEqualHeight($('#content .primary h1'));
        setEqualHeight($('#content .primary .small-image.feature h2'));

        $('#slider h2').removeAttr('style');

        $('.large-image.feature').each(function () {
            var imgHeight = $('img', this).height();
            $('.copy', this).height(imgHeight - 1);
        });

    } else {

    }

}


// Set the copyright date
function copyrightDate() {
    var theDate = new Date();
    $('#copyright p span').text(theDate.getFullYear());
}

// FUNCTIONS FOR INITALISING SLIDERS

function initialiseLatestUpdatesSlider() {

    $('#latestupdates .slides').flexslider({
        controlNav: false,
        directionNav: true,
        touch: true,
        slideshowSpeed: 7500,
        animationSpeed: 750,
        animation: 'slide',
        selector: '.luwrap > .slide',
        slideshow: false
    });

}

function initialiseKeyFactsSlider() {
    $('#keyfacts .slides').flexslider({
        controlNav: false,
        directionNav: true,
        touch: true,
        slideshowSpeed: 7500,
        animationSpeed: 750,
        animation: 'slide',
        selector: '.kfwrap > .slide',
        slideshow: false
    });

}

// FUNCTION TO BUILD THE DESKTOP SLIDERS

var core = true;

$(document).ready(function () {

    var docWidth = $(document).width();
    if (docWidth >= 768) {
        core = false;
    }
    fireFunctionsIE(core);
});

$(window).resize(function () {
    var docWidth = $(document).width();
    if (docWidth >= 768) {
        if (core) {
            fireFunctionsIE(false);
        }
        core = false;
    } else {
        if (!core) {
            fireFunctionsIE(true);
        }
        core = true;
    }
});


function fireFunctionsIE(core) {
    if (core) {
        addMobileSliders();

        $('.event-tabs div').removeAttr('style');


    } else {
        addDesktopSliders();

        $('.event-tabs div').removeAttr('style');
        $('.event-tabs ul li').removeClass('active');
        $('.event-tabs ul li.overview').addClass('active');

        $('header fieldset').removeAttr('style');

        $('.event-tabs ul li').off('click').on('click', 'span', function () {
            var activeClass = $(this).parent().attr('class');
            $(this).parent().attr('class').replace('active', '');
            $('.event-tabs ul li').removeClass('active');
            $(this).parent().addClass('active');
            $('.event-tabs div').hide(0);
            $(this).parent().parent().parent().find('div.' + activeClass).fadeIn();
        });



        $('#slider h2').removeAttr('style');


    }

    fontResizing(core);

}

function addDesktopSliders() {
    // slider(s) - remove any existing version and add in desired html

    $('#latestupdates *').remove();
    $('#latestupdates').append($('#clonebag-latestupdates').clone().html());
    var count = 0;
    var set = 1;
    $('#latestupdates .slides div.luitem').each(function (key, value) {
        count++;
        $(this).addClass('desktopset' + set);
        if (count == 4) {
            count = 0;
            set++;
        }
    });
    for (i = 1; i <= set; i++) {
        $('.desktopset' + i).wrapAll('<div class="slide" />');
    }
    initialiseLatestUpdatesSlider();



    $('#keyfacts *').remove();
    var kf = $('#clonebag-keyfacts').clone().html();
    $('#keyfacts').html(kf);
    var countB = 0;
    var setB = 1;
    $('#keyfacts .slides div.kfitem').each(function (key, value) {
        countB++;
        $(this).addClass('desktopsetB' + setB);
        if (countB == 4) {
            countB = 0;
            setB++;
        }
    });
    for (i = 1; i <= setB; i++) {
        $('.desktopsetB' + i).wrapAll('<div class="slide" />');
    }
    initialiseKeyFactsSlider();
}

// FUNCTION TO BUILD THE MOBILE SLIDERS

function addMobileSliders() {
    // slider(s) - remove any existing version and add in desired html

    $('#latestupdates *').remove();
    $('#latestupdates').append($('#clonebag-latestupdates').clone().html());
    $('#latestupdates .slides div.luitem').each(function (key, value) {
        $(this).wrap('<div class="slide" />');
    });
    initialiseLatestUpdatesSlider();

    $('#keyfacts *').remove();
    $('#keyfacts').append($('#clonebag-keyfacts').clone().html());
    $('#keyfacts .slides div').each(function (key, value) {
        $(this).wrap('<div class="slide" />');
    });
    initialiseKeyFactsSlider();
}

var hoveringClass = '';

var hoverDurationToOpen = 100;
var timeToOpenKey = '';

var currentlyOpen = false;

var nonHoverDurationToClose = 100;
var timeToCloseKey = '';

var easing = 'easeInOutQuad',
    animateTime = 100;

// FUNCTION FOR OPENING PRIMARY NAV    
// BT,11.12.13: nb: triggerClass actually contains the li Id (Mura's default value from dspPrimaryNav) 
function openArea(triggerClass, animate) {
    
    var theHover = $('.primary .sub-nav.' + triggerClass);
    
    $('header .primary .nav a').removeClass('hover');
    $('header .primary .sub-nav').hide(0);

    $('#' + triggerClass + ' a').addClass('hover');

    if (animate) {

        theHover.fadeIn(animateTime / 4, easing);

        currentlyOpen = true;

    } else {

        theHover.show(0);
        //$(this).css('background-color', '#8E388B');
        currentlyOpen = true;

    }
}

// FUNCTION FOR CLOSING PRIMARY NAV

function closeArea(triggerClass) {
    //$('#primary-nav ul li > a').removeAttr('style');  // think this needs reversing?

    $('header .primary .sub-nav').fadeOut(animateTime / 6, easing);
    $('header .primary .nav a').removeClass('hover');
    $('header .primary .nav li a[data-class="active"]').removeAttr('data-class').attr('class', 'active');

    currentlyOpen = false;
    hoveringClass = ""

}

function headerFunctions() {
    $('header .primary .nav li a').hover(function () {
        //var triggerClass = $(this).parent().attr('class');
		// BT,11.12.13; Mura outputs an Id for the nav li elems by default, so use this instead
		var triggerClass = $(this).parent().attr('id');
        primaryOpen(triggerClass);

    }, function () {

        primaryClose();

    });

    $('header .primary .nav li').on('focus', 'a', function () {
        var triggerClass = $(this).parent().attr('class');

        primaryOpen(triggerClass);
    }).on('blur', 'a', function () {

        primaryClose();

    });

    $('header .primary .nav li a').attr('tabindex', 15);

    $('header .primary .sub-nav').hover(function () {

        secondaryOpen();

    }, function () {

        secondaryClose();

    });

    $('header .primary').on('focus', '.sub-nav', function () {

        secondaryOpen();

    }).on('blur', '.sub-nav', function () {

        secondaryClose();

    });

}

function primaryOpen(triggerClass) {

    if (triggerClass != hoveringClass) {

        if (currentlyOpen) {
            clearTimeout(timeToCloseKey);   // as theyve just started a new hover - cancel off the timeout to close the area
            openArea(triggerClass, false);
        } else {
            timeToOpenKey = setTimeout(function () {
                $('header .primary .nav li a.active').removeAttr('class').attr('data-class', 'active');
                openArea(triggerClass, true);
            }, hoverDurationToOpen);
        }

        hoveringClass = triggerClass;

    } else {
        clearTimeout(timeToCloseKey);   // as they've just started a new hover - cancel off the timeout to close the area
        $('header .primary .nav li a.active').removeAttr('class').attr('data-class', 'active');
        openArea(triggerClass, false);
    }

}

function primaryClose() {

    clearTimeout(timeToOpenKey);    // cancel off a counter for whether to open the item they were hovering over

    if (currentlyOpen) {
        timeToCloseKey = setTimeout(function () {
            closeArea(hoveringClass);
        }, nonHoverDurationToClose);
    }

}

function secondaryOpen() {

    clearTimeout(timeToCloseKey);

}

function secondaryClose() {

    timeToCloseKey = setTimeout(function () {
        closeArea(hoveringClass);
    }, nonHoverDurationToClose);

}

function fontResizing(core) {

    if (core) {
        $('body').removeAttr('style');
    } else {
        $('.resizer').on('click', 'a', function (e) {

            var theSize = $(this).attr('class');

            if (theSize == 'small') {
                $('body').removeAttr('style');
            } else if (theSize == 'medium') {
                $('body').css({
                    'font-size': '125%'
                });
            } else if (theSize == 'large') {
                $('body').css({
                    'font-size': '150%'
                });
            }

            e.preventDefault();

        });
    }

}
