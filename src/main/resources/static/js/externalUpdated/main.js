/************************************************************************************************************
 (C) www.dhtmlgoodies.com, October 2005

 This is a script from www.dhtmlgoodies.com. You will find this and a lot of other scripts at our website.

 Terms of use:
 You are free to use this script as long as the copyright message is kept intact. However, you may not
 redistribute, sell or repost it without our permission.

 Thank you!

 www.dhtmlgoodies.com
 Alf Magne Kalleland

 *********************************************************************************************************** */


var activeMenuItem = new Array();

function isUlInArray(inputObj, ulObj) {
    while (inputObj && inputObj.id != 'dhtmlgoodies_listMenu') {
        if (inputObj == ulObj) return true;
        inputObj = inputObj.parentNode;
    }
    return false;
}

function showHideSub(e, inputObj) {

    if (!inputObj) inputObj = this;
    var parentObj = inputObj.parentNode;
    var ul = parentObj.getElementsByTagName('UL')[0];
    if (activeMenuItem.length > 0) {
        for (var no = 0; no < activeMenuItem.length; no++) {
            if (!isUlInArray(ul, activeMenuItem[0]) && !isUlInArray(activeMenuItem[0], ul)) {
                activeMenuItem[no].style.display = 'block';
                activeMenuItem.splice(no, 1);
                no--;
            }
        }
    }
    if (ul.offsetHeight == 0) {
        ul.style.display = 'block';
        activeMenuItem.push(ul);
    } else {
        ul.style.display = 'none';
    }
}

function showHidePath(inputObj) {
    var startTag = inputObj;
    showHideSub(false, inputObj);
    inputObj = inputObj.parentNode;
    while (inputObj) {
        inputObj = inputObj.parentNode;
        if (inputObj.tagName == 'LI') showHideSub(false, inputObj.getElementsByTagName('A')[0]);
        if (inputObj.id == 'dhtmlgoodies_listMenu') inputObj = false;
    }
}

function initMenu() {
    var obj = document.getElementById('dhtmlgoodies_listMenu');
    var linkCounter = 0;
    var aTags = obj.getElementsByTagName('A');
    var activeMenuItem = false;
    var activeMenuLink = false;
    var thisLocationArray = location.href.split(/\//);
    var fileNameThis = thisLocationArray[thisLocationArray.length - 1];
    if (fileNameThis.indexOf('?') > 0) fileNameThis = fileNameThis.substr(0, fileNameThis.indexOf('?'));
    if (fileNameThis.indexOf('#') > 0) fileNameThis = fileNameThis.substr(0, fileNameThis.indexOf('#'));

    for (var no = 0; no < aTags.length; no++) {
        var parent = aTags[no].parentNode;
        var subs = parent.getElementsByTagName('UL');
        if (subs.length > 0) {
            aTags[no].onclick = showHideSub;
            linkCounter++;
            aTags[no].id = 'aLink' + linkCounter;
        }

        if (aTags[no].href.indexOf(fileNameThis) >= 0 && aTags[no].href.charAt(aTags[no].href.length - 1) != '#') {
            if (aTags[no].parentNode.parentNode) {
                var parentObj = aTags[no].parentNode.parentNode.parentNode;
                var a = parentObj.getElementsByTagName('A')[0];
                if (a.id && !activeMenuLink) {

                    activeMenuLink = aTags[no];
                    activeMenuItem = a.id;
                }
            }
        }
    }

    if (activeMenuLink) {
        activeMenuLink.className = 'activeMenuLink';
    }
    if (activeMenuItem) {
        if (document.getElementById(activeMenuItem)) showHidePath(document.getElementById(activeMenuItem));
    }
}

window.onload = initMenu
