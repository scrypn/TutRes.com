var main_site_path;
const domain = window.location.hostname
if (domain === "localhost") main_site_path = window.location.origin + "/tutres.com/";
else main_site_path = window.location.origin + "/";

function toHomePage() {
    document.location = main_site_path;
}

function toLoginPage() {
    document.location = main_site_path + 'auth/sign-in';
}

function toRegPage() {
    document.location = main_site_path + 'auth/create-account';
}

function toFeedBackPage() {
    document.location = main_site_path + 'usr/feedback';
}

function toLKPage() {
    document.location = main_site_path + 'usr/personal-cabinet';
}

const conf_servlet_path = main_site_path + "conf.ntr";
const feed_servlet_path = main_site_path + "feed.ntr";
const login_servlet_path = main_site_path + "login.ntr";
const reg_servlet_path = main_site_path + "reg.ntr";
const ttrlist_servlet_path = main_site_path + "ttrlist.ntr";
const val_servlet_path = main_site_path + "val.ntr";
const lk_servlet_path = main_site_path + "lk.ntr";
const cookies_servlet_path = main_site_path + "cookies.ntr";
const all_subs_servlet_path = main_site_path + "allsubs.ntr";
const all_subs_request_servlet_path = main_site_path + "all_subs_request.ntr";
const support_servlet_path = main_site_path + "support.ntr";