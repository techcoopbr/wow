/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.0.16 (2019-09-24)
 */

!function(t){"use strict";function e(){}function d(e){return function(){return e}}function n(){return h}var r,o=tinymce.util.Tools.resolve("tinymce.PluginManager"),i=0,u=function(e,n,r){e.plugins.table?e.plugins.table.insertTable(n,r):function(r,t,o){r.undoManager.transact(function(){var e,n;r.insertContent(function(e,n){var r,t,o;for(o='<table data-mce-id="mce" style="width: 100%">',o+="<tbody>",t=0;t<n;t++){for(o+="<tr>",r=0;r<e;r++)o+="<td><br></td>";o+="</tr>"}return o+="</tbody>",o+="</table>"}(t,o)),(e=function(e){return e.dom.select("*[data-mce-id]")[0]}(r)).removeAttribute("data-mce-id"),n=r.dom.select("td,th",e),r.selection.setCursorLocation(n[0],0)})}(e,n,r)},a=function(e,n,r){var t,o;o=(t=e.editorUpload.blobCache).create(function(e){var n=(new Date).getTime();return e+"_"+Math.floor(1e9*Math.random())+ ++i+String(n)}("mceu"),r,n),t.add(o),e.insertContent(e.dom.createHTML("img",{src:o.blobUri()}))},s=tinymce.util.Tools.resolve("tinymce.util.Promise"),c=function(r){return new s(function(e){var n=new t.FileReader;n.onloadend=function(){e(n.result.split(",")[1])},n.readAsDataURL(r)})},f=function(){return new s(function(n){var e;(e=t.document.createElement("input")).type="file",e.style.position="fixed",e.style.left=0,e.style.top=0,e.style.opacity=.001,t.document.body.appendChild(e),e.onchange=function(e){n(Array.prototype.slice.call(e.target.files))},e.click(),e.parentNode.removeChild(e)})},l=function(r){r.ui.registry.addButton("quickimage",{icon:"image",tooltip:"Insert image",onAction:function(){f().then(function(e){var n=e[0];c(n).then(function(e){a(r,e,n)})})}}),r.ui.registry.addButton("quicktable",{icon:"table",tooltip:"Insert table",onAction:function(){u(r,2,2)}})},m=d(!1),g=d(!0),h=(r={fold:function(e,n){return e()},is:m,isSome:m,isNone:g,getOr:N,getOrThunk:p,getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:d(null),getOrUndefined:d(undefined),or:N,orThunk:p,map:n,each:e,bind:n,exists:m,forall:g,filter:n,equals:v,equals_:v,toArray:function(){return[]},toString:d("none()")},Object.freeze&&Object.freeze(r),r);function v(e){return e.isNone()}function p(e){return e()}function N(e){return e}function O(n){return function(e){return function(e){if(null===e)return"null";var n=typeof e;return"object"==n&&(Array.prototype.isPrototypeOf(e)||e.constructor&&"Array"===e.constructor.name)?"array":"object"==n&&(String.prototype.isPrototypeOf(e)||e.constructor&&"String"===e.constructor.name)?"string":n}(e)===n}}var b=function(r){function e(){return o}function n(e){return e(r)}var t=d(r),o={fold:function(e,n){return n(r)},is:function(e){return r===e},isSome:g,isNone:m,getOr:t,getOrThunk:t,getOrDie:t,getOrNull:t,getOrUndefined:t,or:e,orThunk:e,map:function(e){return b(e(r))},each:function(e){e(r)},bind:n,exists:n,forall:n,filter:function(e){return e(r)?o:h},toArray:function(){return[r]},toString:function(){return"some("+r+")"},equals:function(e){return e.is(r)},equals_:function(e,n){return e.fold(m,function(e){return n(r,e)})}};return o},E={some:b,none:n,from:function(e){return null===e||e===undefined?h:b(e)}},w=function(e){if(null===e||e===undefined)throw new Error("Node cannot be null or undefined");return{dom:d(e)}},T={fromHtml:function(e,n){var r=(n||t.document).createElement("div");if(r.innerHTML=e,!r.hasChildNodes()||1<r.childNodes.length)throw t.console.error("HTML does not have a single root node",e),new Error("HTML must have a single root node");return w(r.childNodes[0])},fromTag:function(e,n){var r=(n||t.document).createElement(e);return w(r)},fromText:function(e,n){var r=(n||t.document).createTextNode(e);return w(r)},fromDom:w,fromPoint:function(e,n,r){var t=e.dom();return E.from(t.elementFromPoint(n,r)).map(w)}},S=(t.Node.ATTRIBUTE_NODE,t.Node.CDATA_SECTION_NODE,t.Node.COMMENT_NODE,t.Node.DOCUMENT_NODE,t.Node.DOCUMENT_TYPE_NODE,t.Node.DOCUMENT_FRAGMENT_NODE,t.Node.ELEMENT_NODE),y=(t.Node.TEXT_NODE,t.Node.PROCESSING_INSTRUCTION_NODE,t.Node.ENTITY_REFERENCE_NODE,t.Node.ENTITY_NODE,t.Node.NOTATION_NODE,"undefined"!=typeof t.window?t.window:Function("return this;")(),O("string")),x=O("object"),k=O("array"),D=O("boolean"),_=O("undefined"),C=O("function"),A=Array.prototype.slice;C(Array.from)&&Array.from;function R(e,n,r,t,o){return e(r,t)?E.some(r):C(o)&&o(r)?E.none():n(r,t,o)}function I(e,n,r){return 0!=(e.compareDocumentPosition(n)&r)}function M(e,n){var r=function(e,n){for(var r=0;r<e.length;r++){var t=e[r];if(t.test(n))return t}return undefined}(e,n);if(!r)return{major:0,minor:0};function t(e){return Number(n.replace(r,"$"+e))}return V(t(1),t(2))}function q(e,n){return function(){return n===e}}function L(e,n){return function(){return n===e}}function P(e,n){var r=String(n).toLowerCase();return function(e,n){for(var r=0,t=e.length;r<t;r++){var o=e[r];if(n(o,r))return E.some(o)}return E.none()}(e,function(e){return e.search(r)})}function F(e,n){return-1!==e.indexOf(n)}function U(n){return function(e){return F(e,n)}}function B(e,n){var r=e.dom();if(r.nodeType!==ge)return!1;var t=r;if(t.matches!==undefined)return t.matches(n);if(t.msMatchesSelector!==undefined)return t.msMatchesSelector(n);if(t.webkitMatchesSelector!==undefined)return t.webkitMatchesSelector(n);if(t.mozMatchesSelector!==undefined)return t.mozMatchesSelector(n);throw new Error("Browser lacks native selectors")}function j(e,n,r){for(var t=e.dom(),o=C(r)?r:d(!1);t.parentNode;){t=t.parentNode;var i=T.fromDom(t);if(n(i))return E.some(i);if(o(i))break}return E.none()}function H(e,n,r){return j(e,function(e){return B(e,n)},r)}var X,z,G,W,Y=function(e,n){return I(e,n,t.Node.DOCUMENT_POSITION_CONTAINED_BY)},$=function(){return V(0,0)},V=function(e,n){return{major:e,minor:n}},J={nu:V,detect:function(e,n){var r=String(n).toLowerCase();return 0===e.length?$():M(e,r)},unknown:$},K="Firefox",Q=function(e){var n=e.current;return{current:n,version:e.version,isEdge:q("Edge",n),isChrome:q("Chrome",n),isIE:q("IE",n),isOpera:q("Opera",n),isFirefox:q(K,n),isSafari:q("Safari",n)}},Z={unknown:function(){return Q({current:undefined,version:J.unknown()})},nu:Q,edge:d("Edge"),chrome:d("Chrome"),ie:d("IE"),opera:d("Opera"),firefox:d(K),safari:d("Safari")},ee="Windows",ne="Android",re="Solaris",te="FreeBSD",oe=function(e){var n=e.current;return{current:n,version:e.version,isWindows:L(ee,n),isiOS:L("iOS",n),isAndroid:L(ne,n),isOSX:L("OSX",n),isLinux:L("Linux",n),isSolaris:L(re,n),isFreeBSD:L(te,n)}},ie={unknown:function(){return oe({current:undefined,version:J.unknown()})},nu:oe,windows:d(ee),ios:d("iOS"),android:d(ne),linux:d("Linux"),osx:d("OSX"),solaris:d(re),freebsd:d(te)},ue=function(e,r){return P(e,r).map(function(e){var n=J.detect(e.versionRegexes,r);return{current:e.name,version:n}})},ae=function(e,r){return P(e,r).map(function(e){var n=J.detect(e.versionRegexes,r);return{current:e.name,version:n}})},se=/.*?version\/\ ?([0-9]+)\.([0-9]+).*/,ce=[{name:"Edge",versionRegexes:[/.*?edge\/ ?([0-9]+)\.([0-9]+)$/],search:function(e){return F(e,"edge/")&&F(e,"chrome")&&F(e,"safari")&&F(e,"applewebkit")}},{name:"Chrome",versionRegexes:[/.*?chrome\/([0-9]+)\.([0-9]+).*/,se],search:function(e){return F(e,"chrome")&&!F(e,"chromeframe")}},{name:"IE",versionRegexes:[/.*?msie\ ?([0-9]+)\.([0-9]+).*/,/.*?rv:([0-9]+)\.([0-9]+).*/],search:function(e){return F(e,"msie")||F(e,"trident")}},{name:"Opera",versionRegexes:[se,/.*?opera\/([0-9]+)\.([0-9]+).*/],search:U("opera")},{name:"Firefox",versionRegexes:[/.*?firefox\/\ ?([0-9]+)\.([0-9]+).*/],search:U("firefox")},{name:"Safari",versionRegexes:[se,/.*?cpu os ([0-9]+)_([0-9]+).*/],search:function(e){return(F(e,"safari")||F(e,"mobile/"))&&F(e,"applewebkit")}}],fe=[{name:"Windows",search:U("win"),versionRegexes:[/.*?windows\ nt\ ?([0-9]+)\.([0-9]+).*/]},{name:"iOS",search:function(e){return F(e,"iphone")||F(e,"ipad")},versionRegexes:[/.*?version\/\ ?([0-9]+)\.([0-9]+).*/,/.*cpu os ([0-9]+)_([0-9]+).*/,/.*cpu iphone os ([0-9]+)_([0-9]+).*/]},{name:"Android",search:U("android"),versionRegexes:[/.*?android\ ?([0-9]+)\.([0-9]+).*/]},{name:"OSX",search:U("os x"),versionRegexes:[/.*?os\ x\ ?([0-9]+)_([0-9]+).*/]},{name:"Linux",search:U("linux"),versionRegexes:[]},{name:"Solaris",search:U("sunos"),versionRegexes:[]},{name:"FreeBSD",search:U("freebsd"),versionRegexes:[]}],de={browsers:d(ce),oses:d(fe)},le=function(e){var n=de.browsers(),r=de.oses(),t=ue(n,e).fold(Z.unknown,Z.nu),o=ae(r,e).fold(ie.unknown,ie.nu);return{browser:t,os:o,deviceType:function(e,n,r){var t=e.isiOS()&&!0===/ipad/i.test(r),o=e.isiOS()&&!t,i=e.isAndroid()&&3===e.version.major,u=e.isAndroid()&&4===e.version.major,a=t||i||u&&!0===/mobile/i.test(r),s=e.isiOS()||e.isAndroid(),c=s&&!a,f=n.isSafari()&&e.isiOS()&&!1===/safari/i.test(r);return{isiPad:d(t),isiPhone:d(o),isTablet:d(a),isPhone:d(c),isTouch:d(s),isAndroid:e.isAndroid,isiOS:e.isiOS,isWebView:d(f)}}(o,t,e)}},me=(G=!(X=function(){var e=t.navigator.userAgent;return le(e)}),function(){for(var e=[],n=0;n<arguments.length;n++)e[n]=arguments[n];return G||(G=!0,z=X.apply(null,e)),z}),ge=S,he=({detect:me}.detect().browser.isIE(),{getToolbarItemsOr:(W=y,function(e,n,r){return function(e,n){if(!n(e))throw new Error("Default value doesn't match requested type.")}(r,W),function(e,n){if(k(e)||x(e))throw new Error("expected a string but found: "+e);return _(e)?n:D(e)?!1===e?"":n:e}(e.getParam(n,r),r)})}),ve=function(e){return he.getToolbarItemsOr(e,"quickbars_selection_toolbar","bold italic | quicklink h2 h3 blockquote")},pe=function(e){return he.getToolbarItemsOr(e,"quickbars_insert_toolbar","quickimage quicktable")},Ne=function(o){var e=pe(o);0<e.trim().length&&o.ui.registry.addContextToolbar("quickblock",{predicate:function(e){function n(e){return e.dom()===o.getBody()}var r=T.fromDom(e),t=o.schema.getTextBlockElements();return function(e,n,r){return R(B,H,e,n,r)}(r,"table",n).fold(function(){return function(e,n,r){return R(function(e,n){return n(e)},j,e,n,r)}(r,function(e){return function(e){return e.dom().nodeName.toLowerCase()}(e)in t&&o.dom.isEmpty(e.dom())},n).isSome()},function(){return!1})},items:e,position:"line",scope:"editor"})},Oe=function(n){n.ui.registry.addContextToolbar("imageselection",{predicate:function(e){return"IMG"===e.nodeName||"FIGURE"===e.nodeName&&/image/i.test(e.className)},items:"alignleft aligncenter alignright",position:"node"});var e=ve(n);0<e.trim().length&&n.ui.registry.addContextToolbar("textselection",{predicate:function(e){return!n.selection.isCollapsed()},items:e,position:"selection"})};!function be(){o.add("quickbars",function(e){l(e),Ne(e),Oe(e)})}()}(window);
