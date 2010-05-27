(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/user/client/impl/DOMImplStandard.java
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
open DOMTypes_

include DOMImplAbstract_

let captureElem = << null >>

let dispatchEvent = <<
  function(evt) {
    var listener, curElem = this;
    while (curElem && !(listener = curElem.__listener)) {
      curElem = curElem.parentNode;
    }
  
    if (curElem && curElem.nodeType != 1) {
      curElem = null;
    }
  
    if (listener) {
      if ($isMyListener$(listener)) {
        $!domDispatchEvent$(evt, curElem, listener);
      }
    }
  }
>>

let dispatchCapturedEvent = <<
  function(evt) {
    if (!$!domPreviewEvent$(evt)) {
      evt.stopPropagation();
      evt.preventDefault();
      return false;
    }
  
    return true;
  }
>>

let dispatchCapturedMouseEvent = <<
  function(evt) {
    if ($dispatchCapturedEvent$(evt)) {
      var cap = $captureElem$;
      if (cap && cap.__listener) {
        if ($isMyListener$(cap.__listener)) {
          $!domDispatchEvent$(evt, cap, cap.__listener);
          evt.stopPropagation();
        }
      }
    }  
  }
>>

let eventGetFromElement (evt : event) =
  if evt#_get_type = "mouseover"
  then JavaScriptObject.cast evt#_get_relatedTarget
  else if evt#_get_type = "mouseout"
  then JavaScriptObject.cast evt#_get_target
  else << null >>

let eventGetToElement (evt : event) =
  if evt#_get_type = "mouseover"
  then JavaScriptObject.cast evt#_get_target
  else if evt#_get_type = "mouseout"
  then JavaScriptObject.cast evt#_get_relatedTarget
  else << null >>

let getChild elem index = <:rstmt<
  var count = 0, child = $elem$.firstChild;
  while (child) {
    var next = child.nextSibling;
    if (child.nodeType == 1) {
      if ($index$ == count)
        return child;
      ++count;
    }
    child = next;
  }

  return null;
>>

let getChildCount elem = <:rstmt<
  var count = 0, child = $elem$.firstChild;
  while (child) {
    if (child.nodeType == 1)
      ++count;
    child = child.nextSibling;
  }
  return count;
>>

let getChildIndex parent toFind = <:rstmt<
  var count = 0, child = $parent$.firstChild;
  while (child) {
    if (child === $toFind$) {
      return count;
    }
    if (child.nodeType == 1) {
      ++count;
    }
    child = child.nextSibling;
  }
  return -1;
>>

let insertChild parent toAdd index = <:stmt<
  var count = 0, child = $parent$.firstChild, before = null;
  while (child) {
    if (child.nodeType == 1) {
      if (count == $index$) {
        before = child;
        break;
      }
      ++count;
    }
    child = child.nextSibling;
  }

  $parent$.insertBefore($toAdd$, before);
>>

let initEventSystem () = <:stmt<
  $$wnd.addEventListener('click', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('dblclick', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('mousedown', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('mouseup', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('mousemove', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('mouseover', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('mouseout', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('mousewheel', $dispatchCapturedMouseEvent$, true);
  $$wnd.addEventListener('keydown', $dispatchCapturedEvent$, true);
  $$wnd.addEventListener('keyup', $dispatchCapturedEvent$, true);
  $$wnd.addEventListener('keypress', $dispatchCapturedEvent$, true);
>>

let maybeInitializeEventSystem () =
  if not !eventSystemIsInitialized
  then begin
    initEventSystem ();
    eventSystemIsInitialized := true
  end

let releaseCapture elem =
  maybeInitializeEventSystem ();
  <:stmt< if ($elem$ == $captureElem$) { $captureElem$ = null; } >>

let setCapture elem =
  maybeInitializeEventSystem ();
  <:stmt< $captureElem$ = $elem$; >>

let sinkEventsImpl elem bits = <:stmt<
  var chMask = ($elem$.__eventBits || 0) ^ $bits$;
  $elem$.__eventBits = $bits$;
  if (!chMask) return;
 
  if (chMask & 0x00001) $elem$.onclick       = ($bits$ & 0x00001) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00002) $elem$.ondblclick    = ($bits$ & 0x00002) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00004) $elem$.onmousedown   = ($bits$ & 0x00004) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00008) $elem$.onmouseup     = ($bits$ & 0x00008) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00010) $elem$.onmouseover   = ($bits$ & 0x00010) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00020) $elem$.onmouseout    = ($bits$ & 0x00020) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00040) $elem$.onmousemove   = ($bits$ & 0x00040) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00080) $elem$.onkeydown     = ($bits$ & 0x00080) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00100) $elem$.onkeypress    = ($bits$ & 0x00100) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00200) $elem$.onkeyup       = ($bits$ & 0x00200) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00400) $elem$.onchange      = ($bits$ & 0x00400) ?
      $dispatchEvent$ : null;
  if (chMask & 0x00800) $elem$.onfocus       = ($bits$ & 0x00800) ?
      $dispatchEvent$ : null;
  if (chMask & 0x01000) $elem$.onblur        = ($bits$ & 0x01000) ?
      $dispatchEvent$ : null;
  if (chMask & 0x02000) $elem$.onlosecapture = ($bits$ & 0x02000) ?
      $dispatchEvent$ : null;
  if (chMask & 0x04000) $elem$.onscroll      = ($bits$ & 0x04000) ?
      $dispatchEvent$ : null;
  if (chMask & 0x08000) $elem$.onload        = ($bits$ & 0x08000) ?
      $dispatchEvent$ : null;
  if (chMask & 0x10000) $elem$.onerror       = ($bits$ & 0x10000) ?
      $dispatchEvent$ : null;
  if (chMask & 0x20000) $elem$.onmousewheel  = ($bits$ & 0x20000) ? 
      $dispatchEvent$ : null;
  if (chMask & 0x40000) $elem$.oncontextmenu = ($bits$ & 0x40000) ? 
      $dispatchEvent$ : null;
  if (chMask & 0x80000) $elem$.onpaste       = ($bits$ & 0x80000) ? 
      $dispatchEvent$ : null;
>>

(* XXX careful when overriding sinkEventsImpl *)
let sinkEvents elem bits =
  maybeInitializeEventSystem ();
  sinkEventsImpl elem bits
