(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/AbsolutePanel.java
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

let changeToStaticPositioning elem =
  DOM.setStyleAttribute elem "left" "";
  DOM.setStyleAttribute elem "top" "";
  DOM.setStyleAttribute elem "position" ""

class c ?(elem : #DOMTypes.element option) () =
object (self)
  inherit ComplexPanel.c as super

  initializer
    let elem = match elem with
      | None -> DOM.createDiv ()
      | Some elem -> (elem :> DOMTypes.element) in
    self#setElement elem;

    (* Setting the panel's position style to 'relative' causes it to be treated
       as a new positioning context for its children. *)
    DOM.setStyleAttribute self#getElement "position" "relative";
    DOM.setStyleAttribute self#getElement "overflow" "hidden"
  
  method add w = super#add2 w self#getElement

  method add3 w left top =
    (* In order to avoid the potential for a flicker effect, it is necessary
       to set the position of the widget before adding it to the AbsolutePanel.
       The Widget should be removed from its parent before any positional
       changes are made to prevent flickering. *)
    w#removeFromParent;
    let beforeIndex = self#getWidgetCount in
    self#setWidgetPositionImpl w left top;
    self#insert2 w beforeIndex

  method getWidgetLeft w =
    self#checkWidgetParent w;
    DOM.getAbsoluteLeft w#getElement -
      DOM.getAbsoluteLeft self#getElement

  method getWidgetTop w =
    self#checkWidgetParent w;
    DOM.getAbsoluteTop w#getElement -
      DOM.getAbsoluteTop self#getElement

  method insert2 w beforeIndex =
    self#insert w self#getElement beforeIndex true

  method insert3 w left top beforeIndex =
    (* In order to avoid the potential for a flicker effect, it is necessary
       to set the position of the widget before adding it to the AbsolutePanel.
       The Widget should be removed from its parent before any positional
       changes are made to prevent flickering. *)
    w#removeFromParent;
    self#setWidgetPositionImpl w left top;
    self#insert2 w beforeIndex

  method remove w =
    let removed = super#remove w in
    if removed
    then changeToStaticPositioning w#getElement;
    removed

  method setWidgetPosition w left top =
    self#checkWidgetParent w;
    self#setWidgetPositionImpl w left top

  method setWidgetPositionImpl w left top =
    let h = w#getElement in
    if left = -1 && top = -1
    then changeToStaticPositioning h
    else begin
      DOM.setStyleAttribute h "position" "absolute";
      DOM.setStyleAttribute h "left" (string_of_int left ^ "px");
      DOM.setStyleAttribute h "top" (string_of_int top ^ "px");
    end

  method private checkWidgetParent w =
    if w#getParent != (self :> Widget.c)
    then invalid_arg "Widget must be a child of this panel."
end
