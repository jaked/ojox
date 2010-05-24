(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/dom/client/DOMImpl.java
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

let buttonClick button = button#click

let createButtonElement doc type_ =
  let e = (<< $doc$.createElement("BUTTON") >> : buttonElement) in
  e#_set_type type_;
  e

let createElement doc tag = << $doc$.createElement($tag$) >>

let createInputElement doc type_ =
  let e = (<< $doc$.createElement("INPUT") >> : inputElement) in
  e#_set_type type_;
  e

let createScriptElement doc source =
  let elem = (createElement doc "script" : scriptElement) in
  elem#_set_text source;
  elem

let createSelectElement doc multiple =
  let select = (createElement doc "select" : selectElement) in
  if multiple then select#_set_multiple true;
  select

let cssClearOpacity style = style#_set_opacity_string ""

let cssFloatPropertyName = "cssFloat"

let cssSetOpacity style value = style#_set_opacity value

let eventGetAltKey evt = << !!$evt$.altKey >>

let eventGetButton evt = << $evt$.button || 0 >>

let eventGetClientX evt = << $evt$.clientX || 0 >>

let eventGetClientY evt = << $evt$.clientY || 0 >>

let eventGetCtrlKey evt = << !!$evt$.ctrlKey >>

let eventGetCurrentTarget evt = evt#_get_currentTarget

let eventGetKeyCode evt =
  (*
    'which' gives the right key value, except when it doesn't -- in which
    case, keyCode gives the right value on all browsers.
    If all else fails, return an error code
  *)
  << $evt$.which || $evt$.keyCode || 0 >>

let eventGetMetaKey evt = << !!$evt$.metaKey >>

let eventGetScreenX evt = << $evt$.screenX || 0 >>

let eventGetScreenY evt = << $evt$.screenY || 0 >>

let eventGetShiftKey evt = << !!$evt$.shiftKey >>

let eventGetType evt = evt#_get_type

let eventSetKeyCode evt key = evt#_set_keyCode key

let eventStopPropagation evt = evt#stopPropagation

let getAbsoluteLeft elem = <:rstmt<
  var left = 0;
  var curr = $elem$;
  // This intentionally excludes body which has a null offsetParent.    
  while (curr.offsetParent) {
    left -= curr.scrollLeft;
    curr = curr.parentNode;
  }
  while (elem) {
    left += elem.offsetLeft;
    elem = elem.offsetParent;
  }
  return left;
>>

let getAbsoluteTop elem = <:rstmt<
  var top = 0;
  var curr = $elem$;
  // This intentionally excludes body which has a null offsetParent.    
  while (curr.offsetParent) {
    top -= curr.scrollTop;
    curr = curr.parentNode;
  }
  while (elem) {
    top += elem.offsetTop;
    elem = elem.offsetParent;
  }
  return top;
>>

let getAttribute elem name = << $elem$.getAttribute($name$) || '' >>

let getBodyOffsetLeft doc = 0

let getBodyOffsetTop doc = 0

let getFirstChildElement elem = <:rstmt<
  var child = $elem$.firstChild;
  while (child && child.nodeType != 1)
    child = child.nextSibling;
  return child;
>>

let getInnerHTML elem = elem#_get_innerHTML

let rec getInnerText node = <:rstmt<
  // To mimic IE's 'innerText' property in the W3C DOM, we need to recursively
  // concatenate all child text nodes (depth first).
  var text = '', child = $node$.firstChild;
  while (child) {
    // 1 == Element node
    if (child.nodeType == 1) {
      text += $getInnerText << child >> $;
    } else if (child.nodeValue) {
      text += child.nodeValue;
    }
    child = child.nextSibling;
  }
  return text;
>>

let getNextSiblingElement elem = <:rstmt<
  var sib = $elem$.nextSibling;
  while (sib && sib.nodeType != 1)
    sib = sib.nextSibling;
  return sib;
>>

let getNodeType node = node#_get_nodeType

let getParentElement node = <:rstmt<
  var parent = $node$.parentNode;
  if (!parent || parent.nodeType != 1) {
    parent = null;
  }
  return parent;
>>

(* duplicated from Document to avoid recursive module reference *)
let documentGetViewportElement doc =
  if doc#_get_compatMode = "CSS1Compat"
  then doc#_get_documentElement
  else doc#_get_body

let getScrollLeft elem = << $elem$.scrollLeft || 0 >>

(* XXX careful when overriding getScrollLeft *)
let getScrollLeft_document doc = getScrollLeft (documentGetViewportElement doc)

(* duplicated from Element to avoid recursive module reference *)
let elementGetScrollTop e = << $e$.scrollTop || 0 >>
let elementGetScrollWidth e = << $e$.scrollWidth || 0 >>

let getScrollTop doc = elementGetScrollTop (documentGetViewportElement doc)

let getTagName elem = elem#_get_tagName

let hasAttribute elem name = elem#hasAttribute name

let imgGetSrc img = img#_get_src

let imgSetSrc img src = img#_set_src src

let scrollIntoView elem = <:stmt<
  var left = $elem$.offsetLeft, top = $elem$.offsetTop;
  var width = $elem$.offsetWidth, height = $elem$.offsetHeight;

  if ($elem$.parentNode != $elem$.offsetParent) {
    left -= $elem$.parentNode.offsetLeft;
    top -= $elem$.parentNode.offsetTop;
  }

  var cur = $elem$.parentNode;
  while (cur && (cur.nodeType == 1)) {
    if (left < cur.scrollLeft) {
      cur.scrollLeft = left;
    }
    if (left + width > cur.scrollLeft + cur.clientWidth) {
      cur.scrollLeft = (left + width) - cur.clientWidth;
    }
    if (top < cur.scrollTop) {
      cur.scrollTop = top;
    }
    if (top + height > cur.scrollTop + cur.clientHeight) {
      cur.scrollTop = (top + height) - cur.clientHeight;
    }

    var offsetLeft = cur.offsetLeft, offsetTop = cur.offsetTop;
    if (cur.parentNode != cur.offsetParent) {
      offsetLeft -= cur.parentNode.offsetLeft;
      offsetTop -= cur.parentNode.offsetTop;
    }

    left += offsetLeft - cur.scrollLeft;
    top += offsetTop - cur.scrollTop;
    cur = cur.parentNode;
  }
>>

let selectAdd select option before = select#add option before

let selectClear select = <:stmt< $select$.options.length = 0; >>

let selectGetLength select = Array.length select#_get_options

let selectGetOptions select = select#_get_options

let selectRemoveOption select index = select#remove index

let setInnerText elem text = <:stmt<
  // Remove all children first.
  while ($elem$.firstChild) {
    $elem$.removeChild($elem$.firstChild);
  }
  // Add a new text node.
  if ($text$ != null) {
    $elem$.appendChild($elem$.ownerDocument.createTextNode($text$));
  }
>>

let setScrollLeft elem left = elem#_set_scrollLeft left

(* XXX careful when overriding setScrollLeft *)
let setScrollLeft_document doc left = setScrollLeft (documentGetViewportElement doc) left

let setScrollTop doc top = (documentGetViewportElement doc)#_set_scrollTop top

let toString elem = elem#_get_outerHTML
