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

  method _get_className : string
  method _get_clientHeight : string
  method _get_clientWidth : string
  method _get_dir : string
  method getElementsByTagName : string -> c array
  method _get_id : string
  method _get_lang : string
  method _get_offsetParent : c
  method _get_style : Style.c
  method _get_tagName : string
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

let getOffsetHeight e = << $e$.offsetHeight || 0 >>
let getOffsetLeft e = << $e$.offsetLeft || 0 >>
let getOffsetTop e = << $e$.offsetTop || 0 >>
let getOffsetWidth e = << $e$.offsetWidth || 0 >>

let getPropertyBoolean e name = << !!$e$[$name$] >>
let getPropertyDouble e name =  << parseFloat($e$[$name$]) || 0.0 >>
let getPropertyInt e name =  << parseInt($e$[$name$]) || 0 >>
let getPropertyString e name =  << ($e$[$name$] == null) ? null : String($e$[$name$]) >>

let getScrollHeight e = << $e$.scrollHeight || 0 >>
let getScrollTop e = << $e$.scrollTop || 0 >>
let getScrollWidth e = << $e$.scrollWidth || 0 >>

let setInnerHTML e html = <:stmt< ($e$).innerHTML = $html$ || ''; >>

let setPropertyBoolean e name value = <:stmt< ($e$)[$name$] = $value$; >>
let setPropertyDouble e name value = <:stmt< ($e$)[$name$] = $value$; >>
let setPropertyInt e name value = <:stmt< ($e$)[$name$] = $value$; >>
let setPropertyString e name value = <:stmt< ($e$)[$name$] = $value$; >>

let setTitle e title =
  (* Setting the title to null results in the string "null" being displayed
     on some browsers. *)
  <:stmt< ($e$).title = $title$ || ''; >>
