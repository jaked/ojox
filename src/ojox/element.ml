(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/Element.java
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

let is_node o =
  not (Ocamljs.is_null o) && o#_get_nodeType = Node.eLEMENT_NODE

let is_javaScriptObject o =
  if Node.is o
  then is_node (Obj.magic o : #DOMTypes.node)
  else false

let as_javaScriptObject o =
  assert (is_javaScriptObject o);
  (Obj.magic o : #DOMTypes.element)

let as_node o =
  assert (is_node o);
  (Obj.magic o : #DOMTypes.element)

let addClassName this className =
  let className = JavaString.trim className in
  if JavaString.length className = 0 then failwith "Unexpectedly empty class name";

  (* Get the current style string. *)
  let oldClassName = ref this#_get_className in
  let idx = ref (JavaString.indexOf !oldClassName className) in

  (* Calculate matching index. *)
  let continue = ref true in
  while !idx != -1 && !continue do
    if !idx = 0 || JavaString.charAt !oldClassName (!idx - 1) = ' ' then begin
      let last = !idx + JavaString.length className in
      let lastPos = JavaString.length !oldClassName in
      if last = lastPos || (last < lastPos && JavaString.charAt !oldClassName last = ' ')
      then continue := false
    end;
    if !continue then idx := JavaString.indexOf !oldClassName ~startIndex:(!idx + 1) className
  done;

  if !idx = -1
  then begin
    if JavaString.length !oldClassName > 0
    then oldClassName := !oldClassName ^ " ";
    this#_set_className (!oldClassName ^ className)
  end  

let blur this = this#blur

let dispatchEvent this evt = DOMImpl.dispatchEvent this evt

let focus this = this#focus

let getAbsoluteLeft this = DOMImpl.getAbsoluteLeft this
let getAbsoluteTop this = DOMImpl.getAbsoluteTop this

let getAttribute this name = DOMImpl.getAttribute this name

let getClassName this = this#_get_className
let getClientHeight this = this#_get_clientHeight
let getClientWidth this = this#_get_clientWidth
let getDir this = this#_get_dir

let getElementsByTagName (this : #element) name = this#getElementsByTagName name

let getFirstChildElement this = DOMImpl.getFirstChildElement this

let getId this = this#_get_id

let getInnerHTML this = DOMImpl.getInnerHTML this

let getInnerText this = DOMImpl.getInnerText this

let getLang this = this#_get_lang

let getNextSiblingElement this = DOMImpl.getNextSiblingElement this

let getOffsetHeight this = << $this$.offsetHeight || 0 >>
let getOffsetLeft this = << $this$.offsetLeft || 0 >>
let getOffsetTop this = << $this$.offsetTop || 0 >>
let getOffsetParent (this : #element) = this#_get_offsetParent
let getOffsetWidth this = << $this$.offsetWidth || 0 >>

let getAbsoluteBottom this = getAbsoluteTop this + getOffsetHeight this
let getAbsoluteRight this = getAbsoluteLeft this + getOffsetWidth this

let getPropertyBoolean this name = << !!$this$[$name$] >>
let getPropertyDouble this name =  << parseFloat($this$[$name$]) || 0.0 >>
let getPropertyInt this name =  << parseInt($this$[$name$]) || 0 >>
let getPropertyJSO this name = << $this$[$name$] || null >>
let getPropertyString this name =  << ($this$[$name$] == null) ? null : String($this$[$name$]) >>

let getScrollHeight this = << $this$.scrollHeight || 0 >>

let getScrollLeft this = DOMImpl.getScrollLeft this

let getScrollTop this = << $this$.scrollTop || 0 >>
let getScrollWidth this = << $this$.scrollWidth || 0 >>

let getString this = DOMImpl.toString this

let getStyle this = this#_get_style
let getTabIndex this = this#_get_tabIndex

let getTagName this = DOMImpl.getTagName this

let getTitle this = this#_get_title

let hasAttribute this name = DOMImpl.hasAttribute this name

let hasTagName this tagName = tagName = getTagName this

let removeAttribute this name = this#removeAttribute name

let removeClassName this className =
  let className = JavaString.trim className in
  if JavaString.length className = 0 then failwith "Unexpectedly empty class name";

  (* Get the current style string. *)
  let oldStyle = this#_get_className in
  let idx = ref (JavaString.indexOf oldStyle className) in

  (* Calculate matching index. *)
  let continue = ref true in
  while !idx != -1 && !continue do
    if !idx = 0 || JavaString.charAt oldStyle (!idx - 1) = ' '
    then begin
      let last = !idx + JavaString.length className in
      let lastPos = JavaString.length oldStyle in
      if last = lastPos || (last < lastPos && JavaString.charAt oldStyle last = ' ')
      then continue := false
    end;
    if !continue then idx := JavaString.indexOf oldStyle ~startIndex:(!idx + 1) className
  done;

  (* Don't try to remove the style if it's not there. *)
  if !idx != -1 then begin
    (* Get the leading and trailing parts, without the removed name. *)
    let begin_ = JavaString.trim (JavaString.substring ~endIndex:!idx oldStyle 0) in
    let end_ = JavaString.trim (JavaString.substring oldStyle (!idx + JavaString.length className)) in

    (* Some contortions to make sure we don't leave extra spaces. *)
    let newClassName =
      if JavaString.length begin_ = 0 then end_
      else if JavaString.length end_ = 0 then begin_
      else begin_ ^ " " ^ end_ in
    this#_set_className newClassName
  end

let replaceClassName this oldClassName newClassName =
  removeClassName this oldClassName;
  addClassName this newClassName

let scrollIntoView this = DOMImpl.scrollIntoView this

let setAttribute this name value = this#setAttribute name value

let setClassName this className = this#_set_className className
let setDir this dir = this#_set_dir dir
let setId this id = this#_set_id id

let setInnerHTML this html = <:stmt< $this$.innerHTML = $html$ || ''; >>
let setInnerText this text = DOMImpl.setInnerText this text

let setLang this lang = this#_set_lang lang

let setPropertyBoolean this name value = <:stmt< $this$[$name$] = $value$; >>
let setPropertyDouble this name value = <:stmt< $this$[$name$] = $value$; >>
let setPropertyInt this name value = <:stmt< $this$[$name$] = $value$; >>
let setPropertyJSO this name value = <:stmt< $this$[$name$] = $value$; >>
let setPropertyString this name value = <:stmt< $this$[$name$] = $value$; >>

let setScrollLeft this scrollLeft = DOMImpl.setScrollLeft this scrollLeft
let setScrollTop this scrollTop = this#_set_scrollTop scrollTop

let setTabIndex this tabIndex = this#_set_tabIndex tabIndex

let setTitle this title =
  (* Setting the title to null results in the string "null" being displayed
     on some browsers. *)
  <:stmt< $this$.title = $title$ || ''; >>
