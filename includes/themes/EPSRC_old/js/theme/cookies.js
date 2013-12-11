function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    return unescape(dc.substring(begin + prefix.length, end));
} 

function cookieMessageCheck() {
    var myCookie = getCookie("seen_cookie_message");

    if (myCookie == null) {
        $('#global-cookie-message').css('display', 'block');
        var today = new Date();
        var expire = new Date();
        expire.setTime(today.getTime() + 3600000*24*28);
        document.cookie = "seen_cookie_message=1;expires="+expire.toGMTString();
    }
}