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

class type c =
object
  inherit Node.c

  method blur : unit
  method focus : unit
  method _get_className : string
  method _get_clientHeight : string
  method _get_clientWidth : string
  method _get_dir : string
  method getElementsByTagName : string -> c array
  method _get_id : string
  method _get_lang : string
  method _get_offsetParent : c
  method _get_style : Style.c
  method _get_tabIndex : int
  method _get_title : string
  method removeAttribute : string -> unit
  method setAttribute : string -> string -> unit
  method _set_className : string -> unit
  method _set_dir : string -> unit
  method _set_id : string -> unit
  method _set_lang : string -> unit
  method _set_scrollTop : string -> unit
end

let is_node o =
  not (Ocamljs.is_null o) && o#_get_nodeType = Node.eLEMENT_NODE

let is_javaScriptObject o =
  if Node.is o
  then is_node (Obj.magic o : Node.c)
  else false

let as_javaScriptObject o =
  assert (is_javaScriptObject o);
  (Obj.magic o : c)

let as_node o =
  assert (is_node o);
  (Obj.magic o : c)

let addClassName e className =
  let className = JavaString.trim className in
  if JavaString.length className = 0 then failwith "Unexpectedly empty class name";

  (* Get the current style string. *)
  let oldClassName = ref e#_get_className in
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
    e#_set_className (!oldClassName ^ className)
  end  

let getAbsoluteLeft e = failwith "unimplemented"
  (* DOMImpl.impl.getAbsoluteLeft(this); *)

let getAbsoluteTop e = failwith "unimplemented"
  (* DOMImpl.impl.getAbsoluteTop(this); *)

let getAttribute e name = failwith "unimplemented"
  (* DOMImpl.impl.getAttribute(this, name); *)

let getFirstChildElement e = failwith "unimplemented"
  (* DOMImpl.impl.getFirstChildElement(this); *)

let getInnerHTML e = failwith "unimplemented"
  (* DOMImpl.impl.getInnerHTML(this); *)

let getInnerText e = failwith "unimplemented"
  (* DOMImpl.impl.getInnerText(this); *)

let getNextSiblingElement e = failwith "unimplemented"
  (* DOMImpl.impl.getNextSiblingElement(this); *)

let getOffsetHeight e = << $e$.offsetHeight || 0 >>
let getOffsetLeft e = << $e$.offsetLeft || 0 >>
let getOffsetTop e = << $e$.offsetTop || 0 >>
let getOffsetWidth e = << $e$.offsetWidth || 0 >>

let getAbsoluteBottom e = getAbsoluteTop e + getOffsetHeight e
let getAbsoluteRight e = getAbsoluteLeft e + getOffsetWidth e

let getPropertyBoolean e name = << !!$e$[$name$] >>
let getPropertyDouble e name =  << parseFloat($e$[$name$]) || 0.0 >>
let getPropertyInt e name =  << parseInt($e$[$name$]) || 0 >>
let getPropertyJSO e name = << $e$[$name$] || null >>
let getPropertyString e name =  << ($e$[$name$] == null) ? null : String($e$[$name$]) >>

let getScrollHeight e = << $e$.scrollHeight || 0 >>

let getScrollLeft e = failwith "unimplemented"
  (* DOMImpl.impl.getScrollLeft(this); *)

let getScrollTop e = << $e$.scrollTop || 0 >>
let getScrollWidth e = << $e$.scrollWidth || 0 >>

let getString e = failwith "unimplemented"
  (* DOMImpl.impl.toString(this); *)

let getTagName e = failwith "unimplemented"
  (* return DOMImpl.impl.getTagName(this); *)

let hasAttribute e name = failwith "unimplemented"
  (* return DOMImpl.impl.hasAttribute(this, name); *)

let hasTagName e tagName = tagName = getTagName e

let removeClassName e className =
  let className = JavaString.trim className in
  if JavaString.length className = 0 then failwith "Unexpectedly empty class name";

  (* Get the current style string. *)
  let oldStyle = e#_get_className in
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
    e#_set_className newClassName
  end

let replaceClassName e oldClassName newClassName =
  removeClassName e oldClassName;
  addClassName e newClassName

let scrollIntoView e = failwith "unimplemented"
  (* DOMImpl.impl.scrollIntoView(this); *)

let setInnerHTML e html = <:stmt< ($e$).innerHTML = $html$ || ''; >>
let setInnerText e text = failwith "unimplemented"
  (* DOMImpl.impl.setInnerText(this, text); *)

let setPropertyBoolean e name value = <:stmt< ($e$)[$name$] = $value$; >>
let setPropertyDouble e name value = <:stmt< ($e$)[$name$] = $value$; >>
let setPropertyInt e name value = <:stmt< ($e$)[$name$] = $value$; >>
let setPropertyJSO e name value = <:stmt< ($e$)[$name$] = $value$; >>
let setPropertyString e name value = <:stmt< ($e$)[$name$] = $value$; >>

let setScrollLeft e scrollLeft = failwith "unimplemented"
  (* DOMImpl.impl.setScrollLeft(this, scrollLeft) *)

let setTitle e title =
  (* Setting the title to null results in the string "null" being displayed
     on some browsers. *)
  <:stmt< ($e$).title = $title$ || ''; >>
