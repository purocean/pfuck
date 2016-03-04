   �         *https://passport.qbao.com/css/keyboard.css     %g��     %��              �      
     O K      Date   Sun, 28 Feb 2016 11:10:23 GMT   Content-Type   text/css   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Sun, 28 Feb 2016 12:03:01 GMT   Last-Modified   Wed, 09 Dec 2015 18:25:28 GMT   X-Cache   hit /* keyboard - jQuery UI Widget */
.ui-keyboard { padding: .1em; position: absolute; left: 0; top: 0; z-index: 16000;background: #e0e0e0; }
.ui-keyboard-has-focus { z-index: 16001; }
.ui-keyboard div { font-size: 1.1em; }
.ui-keyboard-button { float:left;width:22px;height:22px;margin: 1px; cursor: pointer; overflow: hidden; -moz-user-focus: ignore;background:#fff;border:0; }
.ui-keyboard-button:active { background:#ccc;}
.ui-keyboard-button span { padding: 0; margin: 0; white-space:nowrap; display: inline-block;font-family: 'Arial';color:#333;font-size:12px; }
.ui-keyboard-button-endrow { clear: left; }
.ui-keyboard-widekey { min-width: 20px; width: auto; }
.ui-keyboard-space { width: 15em; }
.ui-keyboard-space span, .ui-keyboard-empty span { font: 0/0 a; text-shadow: none; color: transparent; } /* see http://nicolasgallagher.com/another-css-image-replacement-technique/ */
.ui-keyboard-preview-wrapper { text-align: center; }
.ui-keyboard-preview { text-align: left; margin: 0 0 3px 0; display: inline; width: 99%;} /* width is calculated in IE, since 99% = 99% full browser width =( */ 
.ui-keyboard-keyset { white-space: nowrap; }
.ui-keyboard-input { text-align: left; }
.ui-keyboard-input-current { }
.ui-keyboard-placeholder { color: #888; }
.ui-keyboard-nokeyboard { color: #888; border-color: #888; } /* disabled or readonly inputs, or use input[disabled='disabled'] { color: #f00; } */
.ui-keyboard-button.disabled { opacity: 0.5; filter: alpha(opacity=50); } /* used by the acceptValid option to make the accept button appear faded */
.ui-keyboard-spacer { display: inline-block; width: 1px; height: 0; }

.ui-keyboard-tab,.ui-keyboard-bksp,.ui-keyboard-accept { width:40px;}
.ui-keyboard-lock { width:46px;}
.ui-keyboard-shift,.ui-keyboard-cancel { width:55px;}
.ui-keyboard-cancel { border:0;}
.ui-keyboard-button-hover { background:#ccc}
.ui-keyboard-button-action { background:#bbb}
.forms .ui-keyboard-input { padding-right:45px;width:233px;}

/* combo key styling - toggles diacritics on/off */
.ui-keyboard-button.ui-keyboard-combo.ui-state-default { border-color: #ffaf0f; }

/* (in)valid inputs */
button.ui-keyboard-accept.ui-keyboard-valid-input { border-color: #0c0; background: #080; color: #fff; }
button.ui-keyboard-accept.ui-keyboard-valid-input:hover { background: #0a0; }
button.ui-keyboard-accept.ui-keyboard-invalid-input { border-color: #c00; background: #800; color: #fff; }
button.ui-keyboard-accept.ui-keyboard-invalid-input:hover { background: #a00; }

/*** jQuery Mobile definitions ***/
/* jQuery Mobile styles - need wider buttons because of font size and text-overflow:ellipsis */
.ui-bar .ui-keyboard-button { width: 3em; display: inline-block; }
.ui-bar .ui-keyboard-widekey { width: 5.5em; }
.ui-bar .ui-keyboard-space { width: 15em; }
.ui-bar .ui-keyboard-space span { visibility: hidden; } /* hides the ellipsis */
.ui-bar .ui-keyboard-keyset { line-height: 0.5em; }
.ui-bar input.ui-input-text, .ui-bar textarea.ui-input-text { width: 95%; }

/* over-ride padding set by mobile ui theme - needed because the mobile script wraps button text with several more spans */
.ui-bar .ui-btn-inner { height: 2em; padding: 0.2em 0; margin: 0; }
.ui-bar .ui-btn { margin: 0; font-size: 13px; } /* mobile default size is 13px */

/* Media Queries (optimized for jQuery UI themes; may be slightly off in jQuery Mobile themes) */
/* 240 x 320 (small phone)  */
@media all and (max-width: 319px) {
	.ui-keyboard div { font-size: 9px; }
	.ui-keyboard .ui-keyboard-input { font-size: 12px; }
	/* I don't own an iPhone so I have no idea how small this really is... is it even clickable with your finger? */
	.ui-bar .ui-btn { margin: 0; font-size: 9px; }
	.ui-bar .ui-keyboard-button { width: 1.8em; height: 2.5em; }
	.ui-bar .ui-keyboard-widekey { width: 4em; }
	.ui-bar .ui-keyboard-space { width: 8em; }
	.ui-bar .ui-btn-inner { height: 2.5em; padding: 0.3em 0; }
}

/* 320 x 480 (iPhone)  */
@media all and (min-width: 320px) and (max-width: 479px) {
	.ui-keyboard div { font-size: 9px; }
	.ui-keyboard .ui-keyboard-input { font-size: 14px; }
	/* I don't own an iPhone so I have no idea how small this really is... is it even clickable with your finger? */
	.ui-bar .ui-btn { margin: 0; font-size: 11px; }
	.ui-bar .ui-keyboard-button { width: 1.8em; height: 3em; }
	.ui-bar .ui-keyboard-widekey { width: 4.5em; }
	.ui-bar .ui-keyboard-space { width: 10em; }
	.ui-bar .ui-btn-inner { height: 3em; padding: 0.7em 0; }
}

/* 480 x 640 (small tablet) */
@media all and (min-width: 480px) and (max-width: 767px) {
	.ui-keyboard div { font-size: 13px; }
	.ui-keyboard .ui-keyboard-input { font-size: 14px; }
	.ui-bar .ui-btn { margin: 0; font-size: 10px; }
	.ui-bar .ui-keyboard-button { height: 2.5em; }
	.ui-bar .ui-btn-inner { height: 2.5em; padding: 0.5em 0; }
}