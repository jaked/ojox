(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/ComplexPanel.java
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

class c =
object (self)
  inherit Panel.c

  (* otherwise children can't refer to self *)
  val mutable children = Obj.magic ()
  initializer children <- new WidgetCollection.c self

  (**
     The command used to orphan children. 
  *)
  val mutable orphanCommand = << null >>

  method getWidget index = self#getChildren#get index
  method getWidgetCount = self#getChildren#size
  method getWidgetIndex child = self#getChildren#indexOf child
  method iterator = self#getChildren#iterator
  method list = self#getChildren#list
  method remove_index index = self#remove (self#getWidget index)

  method remove w =
    (* Validate. *)
    if not (w#getParent = (self :> Widget.c))
    then false
    else
      (* Orphan. *)
      let e =
        try self#orphan w; None
        with e -> Some e in
      (* Physical detach. *)
      let elem = w#getElement in
      DOM.removeChild (DOM.getParent elem) elem;
  
      (* Logical detach. *)
      self#getChildren#remove w;
      match e with
        | None -> true
        | Some e -> raise e

  method add2 : 'a. Widget.c -> (#element as 'a) -> unit = fun child container ->
    (* Detach new child. *)
    child#removeFromParent;

    (* Logical attach. *)
    self#getChildren#add child;

    (* Physical attach. *)
    DOM.appendChild container child#getElement;

    (* Adopt. *)
    self#adopt child

  method adjustIndex child beforeIndex =
    self#checkIndexBoundsForInsertion beforeIndex;

    (* Check to see if this widget is already a direct child. *)
    if child#getParent = (self :> Widget.c)
    then
      (* If the Widget's previous position was left of the desired new position
         shift the desired position left to reflect the removal *)
      let idx = self#getWidgetIndex child in
      if idx < beforeIndex
      then beforeIndex - 1
      else beforeIndex
    else beforeIndex

  method checkIndexBoundsForAccess index =
    if index < 0 || index >= self#getWidgetCount
    then invalid_arg "ComplexPanel.checkIndexBoundsForAccess"

  method checkIndexBoundsForInsertion index =
    if index < 0 || index > self#getWidgetCount
    then invalid_arg "ComplexPanel.checkIndexBoundsForInsertion"

  method getChildren = children

  method insert : 'a. Widget.c -> (#element as 'a) -> int -> bool -> unit =
    fun child container beforeIndex domInsert ->
      (* Validate index; adjust if the widget is already a child of this panel. *)
      let beforeIndex = self#adjustIndex child beforeIndex in

      (* Detach new child. *)
      child#removeFromParent;

      (* Logical attach. *)
      self#getChildren#insert child beforeIndex;

      (* Physical attach. *)
      if domInsert
      then DOM.insertChild container child#getElement beforeIndex
      else DOM.appendChild container child#getElement;

      (* Adopt. *)
      self#adopt child

  method doLogicalClear =
    (* TODO(jgw): When Layout work has landed, deprecate FlowPanel (the only
       caller of this method in our code), and deprecate this method with an eye
       to making it private down the road. *)

    (* Only use one orphan command per panel to avoid object creation. *)
    if Ocamljs.is_null orphanCommand
    then orphanCommand <- self#orphan;
    let e =
      try AttachDetachException.tryCommand children#list orphanCommand; None
      with e -> Some e in
    children <- new WidgetCollection.c self;
    match e with
      | None -> ()
      | Some e -> raise e
end
