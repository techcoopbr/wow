/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.0.16 (2019-09-24)
 */

!function(){"use strict";function e(){}function a(e){return function(){return e}}var t=tinymce.util.Tools.resolve("tinymce.PluginManager");function c(e,t){if((e=""+e).length<t)for(var n=0;n<t-e.length;n++)e="0"+e;return e}function i(n,e){return p.each(e,function(e,t){"function"==typeof e&&(e=e(t)),n=n.replace(new RegExp("\\{\\$"+t+"\\}","g"),e)}),n}function l(e,t){var r=e.dom,o=h(e);p.each(r.select("*",t),function(n){p.each(o,function(e,t){r.hasClass(n,t)&&"function"==typeof o[t]&&o[t](n)})})}function s(e,t){return new RegExp("\\b"+t+"\\b","g").test(e.className)}function n(){return w}var r,u=a(!1),f=a(!0),p=tinymce.util.Tools.resolve("tinymce.util.Tools"),o=tinymce.util.Tools.resolve("tinymce.util.XHR"),m=function(e){return e.getParam("template_cdate_classes","cdate")},d=function(e){return e.getParam("template_mdate_classes","mdate")},g=function(e){return e.getParam("template_selected_content_classes","selcontent")},y=function(e){return e.getParam("template_preview_replace_values")},h=function(e){return e.getParam("template_replace_values")},v=function(e){return e.templates},b=function(e){return e.getParam("template_cdate_format",e.translate("%Y-%m-%d"))},O=function(e){return e.getParam("template_mdate_format",e.translate("%Y-%m-%d"))},T=function(e,t,n){var r="Sun Mon Tue Wed Thu Fri Sat Sun".split(" "),o="Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday".split(" "),a="Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split(" "),u="January February March April May June July August September October November December".split(" ");return n=n||new Date,t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=(t=t.replace("%D","%m/%d/%Y")).replace("%r","%I:%M:%S %p")).replace("%Y",""+n.getFullYear())).replace("%y",""+n.getYear())).replace("%m",c(n.getMonth()+1,2))).replace("%d",c(n.getDate(),2))).replace("%H",""+c(n.getHours(),2))).replace("%M",""+c(n.getMinutes(),2))).replace("%S",""+c(n.getSeconds(),2))).replace("%I",""+((n.getHours()+11)%12+1))).replace("%p",n.getHours()<12?"AM":"PM")).replace("%B",""+e.translate(u[n.getMonth()]))).replace("%b",""+e.translate(a[n.getMonth()]))).replace("%A",""+e.translate(o[n.getDay()]))).replace("%a",""+e.translate(r[n.getDay()]))).replace("%%","%")},M=function(t,n){return function(){var e=v(t);"function"!=typeof e?"string"==typeof e?o.send({url:e,success:function(e){n(JSON.parse(e))}}):n(e):e(n)}},S=i,_=l,x=function(t,e,n){var r,o,a=t.dom,u=t.selection.getContent();n=i(n,h(t)),r=a.create("div",null,n),(o=a.select(".mceTmpl",r))&&0<o.length&&(r=a.create("div",null)).appendChild(o[0].cloneNode(!0)),p.each(a.select("*",r),function(e){s(e,m(t).replace(/\s+/g,"|"))&&(e.innerHTML=T(t,b(t))),s(e,d(t).replace(/\s+/g,"|"))&&(e.innerHTML=T(t,O(t))),s(e,g(t).replace(/\s+/g,"|"))&&(e.innerHTML=u)}),l(t,r),t.execCommand("mceInsertContent",!1,r.innerHTML),t.addVisual()},P=function(e){e.addCommand("mceInsertTemplate",function t(r){for(var o=[],e=1;e<arguments.length;e++)o[e-1]=arguments[e];return function(){for(var e=[],t=0;t<arguments.length;t++)e[t]=arguments[t];var n=o.concat(e);return r.apply(null,n)}}(x,e))},A=function(r){r.on("PreProcess",function(e){var t=r.dom,n=O(r);p.each(t.select("div",e.node),function(e){t.hasClass(e,"mceTmpl")&&(p.each(t.select("*",e),function(e){t.hasClass(e,r.getParam("template_mdate_classes","mdate").replace(/\s+/g,"|"))&&(e.innerHTML=T(r,n))}),_(r,e))})})},w=(r={fold:function(e,t){return e()},is:u,isSome:u,isNone:f,getOr:N,getOrThunk:C,getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:a(null),getOrUndefined:a(undefined),or:N,orThunk:C,map:n,each:e,bind:n,exists:u,forall:f,filter:n,equals:D,equals_:D,toArray:function(){return[]},toString:a("none()")},Object.freeze&&Object.freeze(r),r);function D(e){return e.isNone()}function C(e){return e()}function N(e){return e}function H(e){return e.replace(/["'<>&]/g,function(e){return function(e,t){return B(e,t)?L.from(e[t]):L.none()}(E,e).getOr(e)})}function k(t){return function(e){R(t,e)}}var I,J=function(n){function e(){return o}function t(e){return e(n)}var r=a(n),o={fold:function(e,t){return t(n)},is:function(e){return n===e},isSome:f,isNone:u,getOr:r,getOrThunk:r,getOrDie:r,getOrNull:r,getOrUndefined:r,or:e,orThunk:e,map:function(e){return J(e(n))},each:function(e){e(n)},bind:t,exists:t,forall:t,filter:function(e){return e(n)?o:w},toArray:function(){return[n]},toString:function(){return"some("+n+")"},equals:function(e){return e.is(n)},equals_:function(e,t){return e.fold(u,function(e){return t(n,e)})}};return o},L={some:J,none:n,from:function(e){return null===e||e===undefined?w:J(e)}},Y=(I="function",function(e){return function(e){if(null===e)return"null";var t=typeof e;return"object"==t&&(Array.prototype.isPrototypeOf(e)||e.constructor&&"Array"===e.constructor.name)?"array":"object"==t&&(String.prototype.isPrototypeOf(e)||e.constructor&&"String"===e.constructor.name)?"string":t}(e)===I}),j=Array.prototype.slice,q=(Y(Array.from)&&Array.from,tinymce.util.Tools.resolve("tinymce.util.Promise")),F=Object.hasOwnProperty,B=function(e,t){return F.call(e,t)},E={'"':"&quot;","<":"&lt;",">":"&gt;","&":"&amp;","'":"&#039;"},R=function(i,t){function e(e){return function(e,t){for(var n=e.length,r=new Array(n),o=0;o<n;o++){var a=e[o];r[o]=t(a,o)}return r}(e,function(e){return{text:e.text,value:e.text}})}function a(e,t){return function(e,t){for(var n=0,r=e.length;n<r;n++){var o=e[n];if(t(o,n))return L.some(o)}return L.none()}(e,function(e){return e.text===t})}function l(e){return new q(function(t,n){e.value.url.fold(function(){return t(e.value.content.getOr(""))},function(e){return o.send({url:e,success:function(e){t(e)},error:function(e){n(e)}})})})}(function(){if(t&&0!==t.length)return L.from(p.map(t,function(e,t){function n(e){return e.url!==undefined}return{selected:0===t,text:e.title,value:{url:n(e)?L.from(e.url):L.none(),content:n(e)?L.none():L.from(e.content),description:e.description}}}));var e=i.translate("No templates defined.");return i.notificationManager.open({text:e,type:"info"}),L.none()})().each(function(n){function u(e,t){return{title:"Insert Template",size:"large",body:{type:"panel",items:e},initialData:t,buttons:[{type:"cancel",name:"cancel",text:"Cancel"},{type:"submit",name:"save",text:"Save",primary:!0}],onSubmit:function(n){return function(t){var e=t.getData();a(n,e.template).each(function(e){l(e).then(function(e){x(i,!1,e),t.close()})})}}(n),onChange:function(r,o){return function(n,e){if("template"===e.name){var t=n.getData().template;a(r,t).each(function(t){n.block("Loading..."),l(t).then(function(e){o(n,t,e),n.unblock()})})}}}(n,r)}}var c=e(n),r=function(e,t,n){var r=function(t,e){if(-1===e.indexOf("<html>")){var n="";p.each(t.contentCSS,function(e){n+='<link type="text/css" rel="stylesheet" href="'+t.documentBaseURI.toAbsolute(e)+'">'});var r=t.settings.body_class||"";-1!==r.indexOf("=")&&(r=(r=t.getParam("body_class","","hash"))[t.id]||"");var o=t.dom.encode,a=t.getBody().dir,u=a?' dir="'+o(a)+'"':"";e="<!DOCTYPE html><html><head>"+n+'</head><body class="'+o(r)+'"'+u+">"+e+"</body></html>"}return S(e,y(t))}(i,n),o=[{type:"selectbox",name:"template",label:"Templates",items:c},{type:"htmlpanel",html:'<p aria-live="polite">'+H(t.value.description)+"</p>"},{label:"Preview",type:"iframe",name:"preview",sandboxed:!1}],a={template:t.text,preview:r};e.unblock(),e.redial(u(o,a)),e.focus("template")},t=i.windowManager.open(u([],{template:"",preview:""}));t.block("Loading..."),l(n[0]).then(function(e){r(t,n[0],e)})})},z=function(e){e.ui.registry.addButton("template",{icon:"template",tooltip:"Insert template",onAction:M(e.settings,k(e))}),e.ui.registry.addMenuItem("template",{icon:"template",text:"Insert template...",onAction:M(e.settings,k(e))})};!function U(){t.add("template",function(e){z(e),P(e),A(e)})}()}();
