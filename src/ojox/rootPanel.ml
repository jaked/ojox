(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/RootPanel.java
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

class rootPanel elem =
object (self)
  inherit AbsolutePanel.c ~elem ()
  initializer self#onAttach
end

let getBodyElement () = << $$doc.body >>

let getRootElement () = << $$doc >>

class defaultRootPanel =
object (self)
  inherit rootPanel (getBodyElement ()) as super

  method setWidgetPositionImpl w left top =
    (* Account for the difference between absolute position and the
       body's positioning context. *)
    let left = left - Document.getBodyOffsetLeft (Document.get ()) in
    let top = top - Document.getBodyOffsetTop (Document.get ()) in

    super#setWidgetPositionImpl w left top
end

let rootPanels = Hashtbl.create 17

let detachNow = Widget.detachNow

let isInDetachList = Widget.isInDetachList

let detachWidgets () =
  (* When the window is closing, detach all widgets that need to be
     cleaned up. This will cause all of their event listeners
     to be unhooked, which will avoid potential memory leaks. *)
  let e =
    try
      AttachDetachException.tryCommand
        (Hashtbl.fold (fun w () l -> w :: l) Widget.widgetsToDetach [])
        (fun w -> if w#isAttached then w#onDetach);
      None
    with e -> Some e in
  Hashtbl.clear Widget.widgetsToDetach;

  (* Clear the RootPanel cache, since we've "detached" all RootPanels at
     this point. This would be pointless, since it only happens on unload,
     but it is very helpful for unit tests, because it allows
     RootPanel.get() to work properly even after a synthesized "unload". *)
  Hashtbl.clear rootPanels;

  match e with
    | None -> ()
    | Some e -> raise e

let hookWindowClosing () =
  (* Catch the window closing event. *)
  let _ = Window.addCloseHandler (fun _ -> detachWidgets ()) in ()

let isElementChildOfWidget element =
  (* Walk up the DOM hierarchy, looking for any widget with an event listener
     set. Though it is not dependable in the general case that a widget will
     have set its element's event listener at all times, it *is* dependable
     if the widget is attached. Which it will be in this case. *)
  let element = DOMImpl.getParentElement element in
  let body = Document.getBody (Document.get ()) in
  let rec loop element =
    if Ocamljs.is_null element || body = element
    then false
    else if not (Ocamljs.is_null (Event.getEventListener element))
    then true
    else loop (DOMImpl.getParentElement element) in
  loop element

let detachOnWindowClose widget =
  let widget = (widget :> Widget.c) in
  if Hashtbl.mem Widget.widgetsToDetach widget
  then failwith "detachOnUnload() called twice for the same widget";
  if isElementChildOfWidget widget#getElement
  then failwith "A widget that has an existing parent widget may not be added to the detach list";

  Hashtbl.replace Widget.widgetsToDetach widget ()

let get ?id () =
  (* See if this RootPanel is already created. *)
  let rp =
    try Hashtbl.find rootPanels id
    with Not_found -> << null >> in

  (* Find the element that this RootPanel will wrap. *)
  let elem =
    match id with
      | None -> << null >>
      | Some id -> Document.getElementById (Document.get ()) id in
  (* Return null if the id is specified, but no element is found. *)
  if Ocamljs.is_null elem && id <> None
  then << null >>
  else

  (* If the element associated with an existing RootPanel has been replaced
     for any reason, return a new RootPanel rather than the existing one (
     see issue 1937). *)
  if not (Ocamljs.is_null rp) && (Ocamljs.is_null elem || rp#getElement = elem)
  then
    (* There's already an existing RootPanel for this element. Return it. *)
    rp
  else begin
    (* Note that the code in this if block only happens once -
       on the first RootPanel.get(String) or RootPanel.get()
       call. *)
    if Hashtbl.length rootPanels = 0
    then hookWindowClosing ();

    (* If we're in a RTL locale, set the RTL directionality
       on the entire document. *)
    (* XXX
      if (LocaleInfo.getCurrentLocale().isRTL()) {
        BidiUtils.setDirectionOnElement(getRootElement(),
            HasDirection.Direction.RTL);
      }
    *)

    (* Create the panel and put it in the map. *)
    let rp =
      if Ocamljs.is_null elem
      then
        (* 'null' means use document's body element. *)
        new defaultRootPanel
      else
        (* Otherwise, wrap the existing element. *)
        new rootPanel elem in

    Hashtbl.replace rootPanels id rp;
    detachOnWindowClose rp;
    rp
  end
