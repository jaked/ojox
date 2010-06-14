(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/impl/WindowImpl.java
 * in the GWT source distribution) is Copyright 2009 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *)

open Ocamljs.Inline

let getHash () = << $$wnd.location.hash >>

let getQueryString () = << $$wnd.location.search >>

let onClosing = ref ignore
let onClosed = ref ignore
let onResize = ref ignore
let onScroll = ref ignore

let initWindowCloseHandler () = <:stmt<
  var oldOnBeforeUnload = $$wnd.onbeforeunload;
  var oldOnUnload = $$wnd.onunload;
  
  // Old mozilla doesn't like $entry's explicit return statement and
  // will always pop up a confirmation dialog.  This is worked around by
  // just wrapping the call to onClosing(), which still has the semantics
  // that we want.
  $$wnd.onbeforeunload = function(evt) {
    var ret, oldRet;
    try {
      ret = $!onClosing ()$;
    } finally {
      oldRet = oldOnBeforeUnload && oldOnBeforeUnload(evt);
    }
    // Avoid returning null as IE6 will coerce it into a string.
    // Ensure that "" gets returned properly.
    if (ret != null) {
      return ret;
    }
    if (oldRet != null) {
      return oldRet;
    }
    // returns undefined.
  };
  
  $$wnd.onunload = function(evt) {
    try {
      $!onClosed ()$;
    } finally {
      oldOnUnload && oldOnUnload(evt);
      $$wnd.onresize = null;
      $$wnd.onscroll = null;
      $$wnd.onbeforeunload = null;
      $$wnd.onunload = null;
    }
  };
>>

let initWindowResizeHandler () = <:stmt<
  var oldOnResize = $$wnd.onresize;
  $$wnd.onresize = function(evt) {
    try {
      $!onResize ()$;
    } finally {
      oldOnResize && oldOnResize(evt);
    }
  };
>>

let initWindowScrollHandler () = <:stmt<
  var oldOnScroll = $$wnd.onscroll;
  $$wnd.onscroll = function(evt) {
    try {
      $!onScroll ()$;
    } finally {
      oldOnScroll && oldOnScroll(evt);
    }
  };
>>
