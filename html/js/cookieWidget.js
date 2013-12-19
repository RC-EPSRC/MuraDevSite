// JavaScript Document
$(document).ready(function() {

    var cookieAcceptStr = new String();
    cookieAcceptStr = $.cookie('cookieAccept');

    if (cookieAcceptStr == null) {
        $.cookie('cookieAccept', 'true', { expires: 365, path: '/' });
        //set checkbox to checked
        $('input[name=cookieAcceptor]').attr('checked', true);
    }
    if (cookieAcceptStr == 'true') {
        //set checkbox to checked
        $('input[name=cookieAcceptor]').attr('checked', true);
    }
    else if (cookieAcceptStr == 'false') {
        //set checkbox to unchecked, 		
        $('input[name=cookieAcceptor]').attr('checked', false);
    }

    var $dialog = $('<div style="text-align:left"></div>').html('<img src="/_layouts/JQUERY/images/cookie.gif" style="float:right; margin-top:10px" /><p>When we provide services, we want to make them easy, useful and reliable. Where services are delivered on the internet, this sometimes involves placing small amounts of information on your device, for example, computer or mobile phone. These include small files known as cookies. They cannot be used to identify you personally.</p><p><strong>Are you sure you want to change your cookie settings?</strong></p><p><a href="/use/Pages/cookies.aspx" id="cookiePage" style="text-decoration:underline" >Disabling cookies</a> will prevent you from adding disqus comments, and the collection of internet use statistics, but if you would like to delete cookies please refer to <a href="http://www.aboutcookies.org/default.aspx" id="cookieExt" style="text-decoration:underline" class="exLk">AboutCookies.org</a></p>').dialog({
        autoOpen: false,
        title: 'Cookie confirmation',
        buttons: [{
            text: "Enable cookies",
            click: function() {
                acceptCookies();
                $(this).dialog("close");
                window.location.reload();
            }
        },

		{
		    text: "Disable 3rd party cookies",
		    click: function() {
		        rejectCookies();
		        $(this).dialog("close");
		        window.location.reload();
		    } }],

        close: function(event, ui) { cleanup() },
        modal: true

    });

    $('input[name=cookieAcceptor]').change(function() {
        $dialog.dialog('open');
        return false;
    });

    $('a#cookieAcceptorLnk').click(function() {
        $dialog.dialog('open');
        return false;
    });

    $('a#cookiePage').click(function() {
    $dialog.dialog('close');
        return true;
    });

    $('a#cookieExt').click(function() {
        $dialog.dialog('close');
        return true;
    });
    
});

var cookieAccept;

if (($.cookie('cookieAccept')) == 'true') {
    var cookieAccept = true;
} else if (($.cookie('cookieAccept')) == 'false') {
    cookieAccept = false;
} else { cookieAccept = true; }



function acceptCookies() {
    //set checkbox to checked
    $('input[name=cookieAcceptor]').attr('checked', true);
    //set acceptance cookie to true for the next page
    $.cookie("cookieAccept", null);
    $.cookie("cookieAccept", 'true', { expires: 365, path: '/' });
    //set second variable to true
    cookieAccept = true;

}

function rejectCookies() {
    //set checkbox to unchecked, 		
    $('input[name=cookieAcceptor]').attr('checked', false);
    //set acceptance cookie to false for the next page
    $.cookie("cookieAccept", null);
    $.cookie("cookieAccept", 'false', { expires: 365, path: '/' });
    //set second variable to false, disables disqus code
    cookieAccept = false;
}

function cleanup() {

    var cookieAcceptStr1 = new String();
    cookieAcceptStr1 = $.cookie('cookieAccept');

    if (cookieAcceptStr1 == null) {
        $.cookie('cookieAccept', 'true', { expires: 365, path: '/' });
        //set checkbox to checked
        $('input[name=cookieAcceptor]').attr('checked', true);
    }

    else if (cookieAcceptStr1 == 'true') {
        //set checkbox to checked
        $('input[name=cookieAcceptor]').attr('checked', true);
        //set second variable to true
    }
    else if (cookieAcceptStr1 == 'false') {
        //set checkbox to unchecked, 		
        $('input[name=cookieAcceptor]').attr('checked', false);
        //set second variable to false, disables disqus code
    }
}