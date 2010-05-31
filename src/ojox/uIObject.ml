(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/UIObject.java
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

module DebugIdImplDisabled =
struct
  let ensureDebugId uiObject id = ()
  let ensureDebugId_element elem baseID id = ()
end

let dEBUG_ID_PREFIX = "ojox-debug-"

module DebugIdImplEnabled =
struct
  let ensureDebugId uiObject id = uiObject#onEnsureDebugId id

  let ensureDebugId_element elem baseID id =
    let baseID = if JavaString.length baseID > 0 then baseID ^ "-" else "" in
    DOM.setElementProperty elem "id" (dEBUG_ID_PREFIX ^ baseID ^ id)
end

module DebugIdImpl = DebugIdImplDisabled (* XXX *)

let mISSING_ELEMENT_ERROR = "This UIObject's element is not set; "
  ^ "you may be missing a call to either Composite.initWidget() or "
  ^ "UIObject.setElement()"

let sETELEMENT_TWICE_ERROR = "Element may only be set once"

let eMPTY_STYLENAME_MSG = "Style names cannot be empty"

let nULL_HANDLE_MSG = "Null widget handle. If you "
  ^ "are creating a composite, ensure that initWidget() has been called."

let ensureDebugId elem ?baseID id = DebugIdImpl.ensureDebugId_element elem baseID id

let isVisible elem = << $elem$.style.display != 'none' >>

let setVisible elem visible = <:stmt< $elem$.style.display = $visible$ ? '' : 'none'; >>

let getStyleName elem = DOM.getElementProperty elem "className"

let getStylePrimaryName elem =
  let fullClassName = getStyleName elem in

  (* The primary style name is always the first token of the full CSS class
     name. There can be no leading whitespace in the class name, so it's not
     necessary to trim() it. *)
  let spaceIdx = JavaString.indexOf_char fullClassName ' ' in
  if spaceIdx >= 0
  then JavaString.substring ~endIndex:spaceIdx fullClassName 0
  else fullClassName

let setStyleName elem styleName = DOM.setElementProperty elem "className" styleName

let setStyleName_add elem style add =
  if Ocamljs.is_null elem then failwith nULL_HANDLE_MSG;

  let style = JavaString.trim style in
  if JavaString.length style = 0 then invalid_arg eMPTY_STYLENAME_MSG;

  if add
  then Element.addClassName elem style
  else Element.removeClassName elem style

let setStylePrimaryName elem style =
  if Ocamljs.is_null elem then failwith nULL_HANDLE_MSG;
  
  (* Style names cannot contain leading or trailing whitespace, and cannot
     legally be empty. *)
  let style = JavaString.trim style in
  if JavaString.length style = 0 then invalid_arg eMPTY_STYLENAME_MSG;

  <:stmt<
    var classes = $elem$.className.split(/\s+/);
    if (!classes) {
      return;
    }

    var oldPrimaryStyle = classes[0];
    var oldPrimaryStyleLen = oldPrimaryStyle.length;

    classes[0] = $style$;
    for (var i = 1, n = classes.length; i < n; i++) {
      var name = classes[i];
      if (name.length > oldPrimaryStyleLen
          && name.charAt(oldPrimaryStyleLen) == '-'
          && name.indexOf(oldPrimaryStyle) == 0) {
        classes[i] = $style$ + name.substring(oldPrimaryStyleLen);
      }
    }
    $elem$.className = classes.join(" ");
  >>

(**
   Intended to be used to pull the value out of a CSS length. We rely on the
   behavior of parseFloat to ignore non-numeric chars in its input. If the
   value is "auto" or "inherit", 0 will be returned.
   
   @param s The CSS length string to extract
   @return The leading numeric portion of <code>s</code>, or 0 if "auto" or
           "inherit" are passed in.
*)
let extractLengthValue s = <:rstmt<
  if ($s$ == "auto" || $s$ == "inherit" || $s$ == "") {
    return 0;
  } else {
    return parseFloat(s);
  }
>>

let replaceNode node newNode = <:stmt<
  var p = $node$.parentNode;
  if (!p) {
    return;
  }
  p.insertBefore($newNode$, node);
  p.removeChild(node);
>>

class virtual c =
object (self)
  val mutable element = << null >>

  method addStyleDependentName styleSuffix =
    self#addStyleName (self#getStylePrimaryName ^ "-" ^ styleSuffix)

  method addStyleName style =
    setStyleName_add self#getStyleElement style true

  method ensureDebugId (id : string) = DebugIdImpl.ensureDebugId self id

  method getAbsoluteLeft = DOM.getAbsoluteLeft self#getElement

  method getAbsoluteTop = DOM.getAbsoluteTop self#getElement

  method getElement =
    if Ocamljs.is_null element then failwith mISSING_ELEMENT_ERROR;
    element

  method getOffsetHeight = DOM.getElementPropertyInt self#getElement "offsetHeight"

  method getOffsetWidth = DOM.getElementPropertyInt self#getElement "offsetWidth"

  method getStyleName = getStyleName self#getElement

  method getStylePrimaryName = getStylePrimaryName self#getElement

  method getTitle = DOM.getElementProperty self#getElement "title"

  method isVisible : bool = isVisible self#getElement

  method removeStyleDependentName styleSuffix =
    self#removeStyleName (self#getStylePrimaryName ^ "-" ^ styleSuffix)

  method removeStyleName style =
    setStyleName_add self#getStyleElement style false

  method setHeight height =
    (* This exists to deal with an inconsistency in IE's implementation where
       it won't accept negative numbers in length measurements *)
    if extractLengthValue(JavaString.toLowerCase (JavaString.trim height)) < 0
    then failwith "CSS heights should not be negative";
    DOM.setStyleAttribute self#getElement "height" height

  method setPixelSize width height =
    if width >= 0 then self#setWidth (string_of_int width ^ "px");
    if height >= 0 then self#setHeight (string_of_int height ^ "px")

  method setSize width height =
    self#setWidth(width);
    self#setHeight(height)

  method setStyleName style = setStyleName self#getStyleElement style

  method setStylePrimaryName style = setStylePrimaryName self#getStyleElement style

  method setTitle title =
    if Ocamljs.is_null title || JavaString.length title == 0
    then DOM.removeElementAttribute self#getElement "title"
    else DOM.setElementAttribute self#getElement "title" title

  method setVisible (visible : bool) = setVisible self#getElement visible

  method setWidth width =
    (* This exists to deal with an inconsistency in IE's implementation where
       it won't accept negative numbers in length measurements *)
    if extractLengthValue(JavaString.toLowerCase (JavaString.trim width)) < 0
    then failwith "CSS widths should not be negative";
    DOM.setStyleAttribute self#getElement "width" width

  method sinkEvents eventBitsToAdd =
    DOM.sinkEvents self#getElement (eventBitsToAdd lor DOM.getEventsSunk self#getElement)

  method toString =
    if Ocamljs.is_null element
    then "(null handle)"
    else DOM.toString self#getElement

  method unsinkEvents eventBitsToRemove =
    DOM.sinkEvents self#getElement (DOM.getEventsSunk self#getElement land (eventBitsToRemove lxor max_int))

  method getStyleElement = self#getElement

  method onEnsureDebugId (baseID : string) = ensureDebugId self#getElement baseID

  method setElement elem =
    if not (Ocamljs.is_null element) then failwith sETELEMENT_TWICE_ERROR;
    element <- elem

  method replaceElement elem =
    if not (Ocamljs.is_null element)
    then
      (* replace this.element in its parent with elem. *)
      replaceNode element elem;
    element <- elem
end
