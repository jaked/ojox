(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/dom/client/DOMImplSafari.java
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
open DOMTypes

include DOMImplStandard

(**
 * Safari implementation of {!DOMImpl}.
*)

(**
 * The type property on a button element is read-only in safari, so we need to 
 * set it using setAttribute.
*)
let createButtonElement (doc : document) type_ =
  let e = (doc#createElement "BUTTON" : buttonElement) in
  e#setAttribute "type" type_;
  e

let createKeyEvent (doc : document) type_ canBubble cancelable ctrlKey altKey shiftKey metaKey keyCode charCode =
  (* The spec calls for KeyEvents/initKeyEvent(), but that doesn't exist on WebKit. *)
  let evt = doc#createEvent "HTMLEvents" in
  evt#initEvent type_ canBubble cancelable;
  evt#_set_ctrlKey ctrlKey;
  evt#_set_altKey altKey;
  evt#_set_shiftKey shiftKey;
  evt#_set_metaKey metaKey;
  evt#_set_keyCode_int keyCode;
  evt#_set_charCode_int charCode;
  evt

(**
 * Safari 2 does not support {!ScriptElement.setText(String)}.
*)
let createScriptElement (doc : document) source =
  let elem = (doc#createElement "script" : scriptElement) in
  setInnerText elem source;
  elem

let eventGetCurrentTarget event = << $event$.currentTarget || $$wnd >>

let eventGetMouseWheelVelocityY evt = << Math.round(-$evt$.wheelDelta / 40) || 0 >>

let getAbsoluteLeft elem = <:rstmt<
  // Unattached elements and elements (or their ancestors) with style
  // 'display: none' have no offsetLeft.
  if ($elem$.offsetLeft == null) {
    return 0;
  }

  var left = 0;
  var doc = $elem$.ownerDocument;
  var curr = $elem$.parentNode;
  if (curr) {
    // This intentionally excludes body which has a null offsetParent.
    while (curr.offsetParent) {
      left -= curr.scrollLeft;

      // In RTL mode, offsetLeft is relative to the left edge of the
      // scrollable area when scrolled all the way to the right, so we need
      // to add back that difference.
      if (doc.defaultView.getComputedStyle(curr, '').getPropertyValue('direction') == 'rtl') {
        left += (curr.scrollWidth - curr.clientWidth);
      }

      curr = curr.parentNode;
    }
  }

  while ($elem$) {
    left += $elem$.offsetLeft;

    if (doc.defaultView.getComputedStyle($elem$, '')['position'] == 'fixed') {
      left += doc.body.scrollLeft;
      return left;
    }

    // Safari 3 does not include borders with offsetLeft, so we need to add
    // the borders of the parent manually.
    var parent = $elem$.offsetParent;
    if (parent && $$wnd.devicePixelRatio) {
      left += parseInt(doc.defaultView.getComputedStyle(parent, '').getPropertyValue('border-left-width'));
    }

    // Safari bug: a top-level absolutely positioned element includes the
    // body's offset position already.
    if (parent && (parent.tagName == 'BODY') &&
        ($elem$.style.position == 'absolute')) {
      break;
    }

    $elem$ = parent;
  }
  return left;
>>

let getAbsoluteTop elem = <:rstmt<
  // Unattached elements and elements (or their ancestors) with style
  // 'display: none' have no offsetTop.
  if ($elem$.offsetTop == null) {
    return 0;
  }

  var top = 0;
  var doc = $elem$.ownerDocument;
  var curr = $elem$.parentNode;
  if (curr) {
    // This intentionally excludes body which has a null offsetParent.
    while (curr.offsetParent) {
      top -= curr.scrollTop;
      curr = curr.parentNode;
    }
  }

  while ($elem$) {
    top += $elem$.offsetTop;

    if (doc.defaultView.getComputedStyle($elem$, '')['position'] == 'fixed') {
      top += doc.body.scrollTop;
      return top;
    }

    // Safari 3 does not include borders with offsetTop, so we need to add the
    // borders of the parent manually.
    var parent = $elem$.offsetParent;
    if (parent && $$wnd.devicePixelRatio) {
      top += parseInt(doc.defaultView.getComputedStyle(parent, '').getPropertyValue('border-top-width'));
    }

    // Safari bug: a top-level absolutely positioned element includes the
    // body's offset position already.
    if (parent && (parent.tagName == 'BODY') &&
        ($elem$.style.position == 'absolute')) {
      break;
    }

    $elem$ = parent;
  }
  return top;
>>

let isRTL elem = << elem.ownerDocument.defaultView.getComputedStyle(elem, '').direction == 'rtl' >>

let getScrollLeft elem =
  if isRTL elem
  then getScrollLeft elem - (elementGetScrollWidth elem - elem#_get_clientWidth)
  else getScrollLeft elem

let getScrollLeft_document doc =
  (* Safari always applies document scrolling to the body element, even in
     strict mode. *)
  getScrollLeft doc#_get_body

let getScrollTop_document doc =
  (* Safari always applies document scrolling to the body element, even in
     strict mode. *)
  getScrollTop doc#_get_body

let isOrHasChild parent child = <:rstmt<
  while ($child$) {
    if (parent == $child$) {
      return true;
    }
    $child$ = $child$.parentNode;
    if ($child$ && ($child$.nodeType != 1)) {
      $child$ = null;
    }
  }
  return false;
>>

(*
   The 'options' array cannot be used due to a bug in the version of WebKit
   that ships with GWT (http://bugs.webkit.org/show_bug.cgi?id=10472). The
   'children' array, which is common for all DOM elements in Safari, does not
   suffer from the same problem. Ideally, the 'children' array should be used
   in all of the traversal methods in the DOM classes. Unfortunately, due to a
   bug in Safari 2 (http://bugs.webkit.org/show_bug.cgi?id=3330), this will
   not work. However, this bug does not cause problems in the case of <SELECT>
   elements, because their descendent elements are only one level deep.
*)
let selectClear select = <:stmt< $select$.innerText = ''; >>

let selectGetLength select = << select.children.length >>

let selectGetOptions select = << select.children >>

let selectRemoveOption select index = <:stmt< select.removeChild(select.children[index]); >>

let setScrollLeft elem left =
  let left =
    if isRTL elem
    then left + (elementGetScrollWidth elem - elem#_get_clientWidth)
    else left in
  setScrollLeft elem left

let setScrollLeft_document doc left =
  (* Safari always applies document scrolling to the body element, even in
     strict mode. *)
  setScrollLeft (doc#_get_body) left

let setScrollTop doc top =
  (* Safari always applies document scrolling to the body element, even in
     strict mode. *)
  doc#_get_body#_set_scrollTop top
