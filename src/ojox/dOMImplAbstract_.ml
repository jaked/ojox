(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/user/client/impl/DOMImpl.java
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
open DOMTypes_

let eventSystemIsInitialized = ref false

let isMyListener _ = true
(* not sure how to translate this. *)
(*
    /*
     * The first test ensures the Object belongs to this module in web mode by
     * ensuring this is not a JavaScriptObject. In web mode, foreign Java
     * objects appear to be JavaScriptObject. See Cast.isJavaScriptObject().
     * 
     * The second test then checks the exact type.
     * 
     * TODO: make the generated code smaller!
     */
    return !(object instanceof JavaScriptObject)
        && (object instanceof com.google.gwt.user.client.EventListener);
*)

let eventCancelBubble evt cancel = evt#_set_cancelBubble cancel

let eventGetRepeat evt = << !!$evt$.repeat >>

let eventGetTypeInt_string eventType = <:rstmt<
  switch ($eventType$) {
  case "blur": return 0x01000;
  case "change": return 0x00400;
  case "click": return 0x00001;
  case "dblclick": return 0x00002;
  case "focus": return 0x00800;
  case "keydown": return 0x00080;
  case "keypress": return 0x00100;
  case "keyup": return 0x00200;
  case "load": return 0x08000;
  case "losecapture": return 0x02000;
  case "mousedown": return 0x00004;
  case "mousemove": return 0x00040;
  case "mouseout": return 0x00020;
  case "mouseover": return 0x00010;
  case "mouseup": return 0x00008;
  case "scroll": return 0x04000;
  case "error": return 0x10000;
  case "mousewheel": return 0x20000;
  case "DOMMouseScroll": return 0x20000;
  case "contextmenu": return 0x40000;
  case "paste": return 0x80000;
  }
>>

let eventGetTypeInt evt = eventGetTypeInt_string evt#_get_type

let eventSetKeyCode evt key = evt#_set_keyCode key

let getEventListener elem = << $elem$.__listener >>

let getEventsSunk elem = << $elem$.__eventBits || 0 >>

(* copy when overriding initEventSystem *)
(*
let maybeInitializeEventSystem () =
  if not !eventSystemIsInitialized
  then begin
    initEventSystem ();
    eventSystemIsInitialized := true
  end
*)

let setEventListener elem listener = <:stmt< $elem$.__listener = $listener$; >>

let domDispatchEvent = ref (fun (_ : event) (_ : element) (_ : eventListener) -> ())
let domPreviewEvent = ref (fun (_ : event) -> false)
