(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/dom/client/DOMImplStandard.java
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

include DOMImplAbstract

let createHtmlEvent doc type_ canBubble cancelable =
  let evt = doc#createEvent "HTMLEvents" in
  evt#initEvent type_ canBubble cancelable;
  evt

let createInputRadioElement (doc : document) name =
  let elem = (doc#createElement "INPUT" : inputElement) in
  elem#_set_type "radio";
  elem#_set_name name;
  elem

let createKeyEvent (doc : document) type_ canBubble cancelable ctrlKey altKey shiftKey metaKey keyCode charCode =
  let evt = doc#createEvent "KeyEvents" in
  evt#initKeyEvent type_ canBubble cancelable << null >> ctrlKey altKey shiftKey metaKey keyCode charCode;
  evt

let createMouseEvent
    (doc : document) type_ canBubble cancelable detail screenX screenY clientX clientY
    ctrlKey altKey shiftKey metaKey button relatedTarget =
  <:stmt<
    // Because Event.getButton() returns bitfield values [1, 4, 2] for [left,
    // middle, right], we need to translate them to the standard [0, 1, 2]
    // button constants.
    if (button == 1) {
      button = 0;
    } else if (button == 4) {
      button = 1;
    } else {
      button = 2;
    }
  >>;
  let evt = doc#createEvent "MouseEvents" in
  evt#initMouseEvent type_
    canBubble cancelable << null >> detail screenX screenY clientX clientY
    ctrlKey altKey shiftKey metaKey button relatedTarget;
  evt

let dispatchEvent target evt = target#dispatchEvent evt

let eventGetButton evt = <:rstmt<
  // All modern browsers return 0, 1, and 2 for left, middle, and right,
  // respectively. Because eventGetButton() is expected to return the IE
  // bitfield norms of 1, 4, and 2, we translate them here.
  var button = evt.button;
  if (button == 1) {
    return 4;
  } else if (button == 2) {
    return 2;
  }
  return 1;
>>

let eventGetRelatedTarget evt = evt#_get_relatedTarget

let eventGetTarget evt = evt#_get_target

let eventPreventDefault evt = evt#preventDefault

let eventToString evt = evt#toString

let isOrHasChild parent child = parent#contains child
