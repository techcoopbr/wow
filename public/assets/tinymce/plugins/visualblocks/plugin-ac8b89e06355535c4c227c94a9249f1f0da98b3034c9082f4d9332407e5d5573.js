/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.0.16 (2019-09-24)
 */

!function(){"use strict";function o(o,e){return function(n){n.setActive(e.get());function t(t){return n.setActive(t.state)}return o.on("VisualBlocks",t),function(){return o.off("VisualBlocks",t)}}}var e=function(t){function n(){return o}var o=t;return{get:n,set:function(t){o=t},clone:function(){return e(n())}}},t=tinymce.util.Tools.resolve("tinymce.PluginManager"),i=function(t,n){t.fire("VisualBlocks",{state:n})},u=function(t,n,o){t.dom.toggleClass(t.getBody(),"mce-visualblocks"),o.set(!o.get()),i(t,o.get())},c=function(t,n,o){t.addCommand("mceVisualBlocks",function(){u(t,n,o)})},s=function(t){return t.getParam("visualblocks_default_state",!1,"boolean")},r=function(n,t,o){n.on("PreviewFormats AfterPreviewFormats",function(t){o.get()&&n.dom.toggleClass(n.getBody(),"mce-visualblocks","afterpreviewformats"===t.type)}),n.on("init",function(){s(n)&&u(n,t,o)}),n.on("remove",function(){n.dom.removeClass(n.getBody(),"mce-visualblocks")})},l=function(t,n){t.ui.registry.addToggleButton("visualblocks",{icon:"paragraph",tooltip:"Show blocks",onAction:function(){return t.execCommand("mceVisualBlocks")},onSetup:o(t,n)}),t.ui.registry.addToggleMenuItem("visualblocks",{text:"Show blocks",onAction:function(){return t.execCommand("mceVisualBlocks")},onSetup:o(t,n)})};!function n(){t.add("visualblocks",function(t,n){var o=e(!1);c(t,n,o),l(t,o),r(t,n,o)})}()}();
