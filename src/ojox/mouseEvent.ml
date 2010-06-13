(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/MouseEvent.java
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

class virtual c =
object (self)
  inherit DomEvent.c

  method getClientX = NativeEvent.getClientX self#getNativeEvent
  method getClientY = NativeEvent.getClientY self#getNativeEvent

  method getNativeButton = NativeEvent.getButton self#getNativeEvent

  method getRelativeX : 'a. (#DOMTypes.element as 'a) -> int = fun target ->
    let target = (target :> DOMTypes.element) in
    let e = self#getNativeEvent in

    NativeEvent.getClientX e - Element.getAbsoluteLeft target + Element.getScrollLeft target +
      Document.getScrollLeft (Node.getOwnerDocument target)

  method getRelativeY : 'a. (#DOMTypes.element as 'a) -> int = fun target ->
    let target = (target :> DOMTypes.element) in
    let e = self#getNativeEvent in

    NativeEvent.getClientY e - Element.getAbsoluteTop target + Element.getScrollTop target +
      Document.getScrollTop (Node.getOwnerDocument target)

  method getScreenX = NativeEvent.getScreenX self#getNativeEvent
  method getScreenY = NativeEvent.getScreenY self#getNativeEvent

  method getX =
    let relativeElem = self#getRelativeElement in
    if not (Ocamljs.is_null relativeElem)
    then self#getRelativeX relativeElem
    else self#getClientX

  method getY =
    let relativeElem = self#getRelativeElement in
    if not (Ocamljs.is_null relativeElem)
    then self#getRelativeY relativeElem
    else self#getClientY

  method isAltKeyDown = NativeEvent.getAltKey self#getNativeEvent
  method isControlKeyDown = NativeEvent.getCtrlKey self#getNativeEvent
  method isMetaKeyDown = NativeEvent.getMetaKey self#getNativeEvent
  method isShiftKeyDown = NativeEvent.getShiftKey self#getNativeEvent
end
