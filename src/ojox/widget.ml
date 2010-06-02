(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/Widget.java
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

class type ['a] iterator_ =
object
  method hasNext : bool
  method next : 'a
  method remove : unit
end

class type ['a] hasWidgets_ =
object
  method add : 'a -> unit
  method clear : unit
  method iterator : 'a iterator_
  method remove : 'a -> bool
end

class c =
object (self : 'self)
  inherit UIObject.c as super

  (**
     A bit-map of the events that should be sunk when the widget is attached to
     the DOM. (We delay the sinking of events to improve startup performance.)
     When the widget is attached, this is set to -1
     <p>
     Package protected to allow Composite to see it.
  *)
  val mutable eventsToSink = 0
  val mutable attached = false
  (* val mutable layoutData = ? *)
  val mutable parent = (<< null >> : c)
  val mutable handlerManager = (<< null >> : HandlerManager.c)

  method fireEvent : 'a. (#OjoxEvent.c as 'a) -> unit = fun event ->
    if not (Ocamljs.is_null handlerManager)
    then handlerManager#fireEvent event

  method getLayoutData : 'a. 'a = failwith "unimplemented"

  method getParent = parent
  method isAttached = attached

  method onBrowserEvent event =
    let fire =
      let t = DOM.eventGetType event in
      if
        t = Event.oNMOUSEOVER ||
        (* Only fire the mouse over event if it's coming from outside this
           widget. *)
        t = Event.oNMOUSEOUT
        (* Only fire the mouse out event if it's leaving this
           widget. *)
      then
        let related = JavaScriptObject.cast (NativeEvent.getRelatedEventTarget event) in
        if not (Ocamljs.is_null related) && Node.isOrHasChild self#getElement related
        then false
        else true
      else true in
    if fire
    then DomEvent.fireNativeEvent event ~relativeElem:self#getElement self

  method removeFromParent =
    if Ocamljs.is_null parent
    then begin
      (* XXX need to put detach list somewhere else to avoid recursive reference
      (* If the widget had no parent, check to see if it was in the detach list
         and remove it if necessary. *)
      if RootPanel.isInDetachList self
      then RootPanel.detachNow self
      *)
      ()
    end else begin
      match parent#instanceof_hasWidgets with
        | Some hasWidgets -> ignore (hasWidgets#remove (self :> c))
        | None -> failwith "This widget's parent does not implement HasWidgets"
    end

  method setLayoutData : 'a. 'a -> unit = fun layoutData -> failwith "unimplemented"

  method sinkEvents eventBitsToAdd =
    if self#isOrWasAttached
    then super#sinkEvents eventBitsToAdd
    else eventsToSink <- eventsToSink lor eventBitsToAdd

  method addDomHandler : 'a. 'a HandlerManager.handler -> 'a DomEvent.tag -> HandlerManager.handlerRegistration =
    fun handler type_ ->
      self#sinkEvents (Event.getTypeInt_string type_#getName);
      self#ensureHandlers#addHandler (type_ :> 'a OjoxEvent.tag) handler

  method addHandler : 'a. 'a HandlerManager.handler -> 'a OjoxEvent.tag -> HandlerManager.handlerRegistration =
    fun handler type_ ->
      self#ensureHandlers#addHandler type_ handler

  method delegateEvent : 'a 'b. (< fireEvent: 'c. (#OjoxEvent.c as 'c) -> unit; .. > as 'b) -> (#OjoxEvent.c as 'a) -> unit =
    fun target event -> target#fireEvent event

  method doAttachChildren = ()

  method doDetachChildren = ()

  method getHandlerCount : 'a. 'a OjoxEvent.tag -> int = fun type_ ->
    if Ocamljs.is_null handlerManager
    then 0
    else handlerManager#getHandlerCount type_

  method isOrWasAttached = eventsToSink = -1

  method onAttach =
    if self#isAttached
    then failwith "Should only call onAttach when the widget is detached from the browser's document";

    attached <- true;

    (* Event hookup code *)
    DOM.setEventListener self#getElement self#onBrowserEvent;
    let bitsToAdd = eventsToSink in
    eventsToSink <- -1;
    if bitsToAdd > 0
    then self#sinkEvents bitsToAdd;
    self#doAttachChildren;

    (* onLoad() gets called only *after* all of the children are attached and
       the attached flag is set. This allows widgets to be notified when they
       are fully attached, and panels when all of their children are attached. *)
    self#onLoad

  method onDetach =
    if not self#isAttached
    then failwith "Should only call onDetach when the widget is attached to the browser's document";

    let e1 =
      try
        (* onUnload() gets called *before* everything else (the opposite of
           onLoad()). *)
        self#onUnload; None
      with e -> Some e in
    (* Put this in a finally, just in case onUnload throws an exception. *)
    let e2 =
      try self#doDetachChildren; None
      with e -> Some e in
    (* Put this in a finally, in case doDetachChildren throws an exception. *)
    DOM.setEventListener self#getElement << null >>;

    match e1, e2 with
      | _, Some e | Some e, _ -> raise e (* XXX does this match Java for exn in finally? *)
      | _ -> ()

  method onLoad = ()

  method onUnload = ()

  method private ensureHandlers : HandlerManager.c =
    if Ocamljs.is_null handlerManager
    then handlerManager <- new HandlerManager.c self;
    handlerManager

  method replaceElement elem =
    if self#isAttached
    then
      (* Remove old event listener to avoid leaking. onDetach will not do this
         for us, because it is only called when the widget itself is detached
         from the document. *)
      DOM.setEventListener self#getElement << null >>;

    super#replaceElement elem;

    if self#isAttached
    then
      (* Hook the event listener back up on the new element. onAttach will not
         do this for us, because it is only called when the widget itself is
         attached to the document. *)
      DOM.setEventListener self#getElement self#onBrowserEvent

  method setParent parent' =
    let oldParent = parent in
    if Ocamljs.is_null parent'
    then
      try
        if not (Ocamljs.is_null oldParent) && oldParent#isAttached
        then begin
          self#onDetach;
          if self#isAttached
          then failwith "Failure to call super.onDetach()";
        end
      with e ->
        (* Put this in a finally in case onDetach throws an exception. *)
        parent <- << null >>;
        raise e
    else begin
      if not (Ocamljs.is_null oldParent)
      then failwith "Cannot set a new parent without first clearing the old parent";

      parent <- parent';
      if parent#isAttached
      then begin
        self#onAttach;
        if not (self#isAttached)
        then failwith "Failure to call super.onAttach()";
      end
    end

  method instanceof_hasWidgets : c hasWidgets_ option = None
end

class type iterator = object inherit [c] iterator_ end
class type hasWidgets = object inherit [c] hasWidgets_ end
