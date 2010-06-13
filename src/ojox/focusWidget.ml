(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/FocusWidget.java
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

open HandlerManager

class virtual c ?(elem : #DOMTypes.element option) () =
object (self)
  inherit Widget.c as super

  initializer
    match elem with
      | None -> ()
      | Some elem -> self#setElement (elem :> DOMTypes.element)

  (* not sure why type annotations are needed here; seems like FooEvent.getType should constrain it *)
  method addBlurHandler : BlurEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler BlurEvent.getType
  method addClickHandler : ClickEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler ClickEvent.getType
  method addFocusHandler : FocusEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler FocusEvent.getType
  method addKeyDownHandler : KeyDownEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler KeyDownEvent.getType
  method addKeyPressHandler : KeyPressEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler KeyPressEvent.getType
  method addKeyUpHandler : KeyUpEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler KeyUpEvent.getType
  method addMouseDownHandler : MouseDownEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler MouseDownEvent.getType
  method addMouseMoveHandler : MouseMoveEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler MouseMoveEvent.getType
  method addMouseOutHandler : MouseOutEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler MouseOutEvent.getType
  method addMouseOverHandler : MouseOverEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler MouseOverEvent.getType
  method addMouseUpHandler : MouseUpEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler MouseUpEvent.getType
  method addMouseWheelHandler : MouseWheelEvent.c handler -> handlerRegistration = fun handler -> self#addDomHandler handler MouseWheelEvent.getType

  method getTabIndex = FocusImpl.getTabIndex self#getElement
  method isEnabled = not (DOM.getElementPropertyBoolean self#getElement "disabled")

  method setAccessKey (key : char) =
    DOM.setElementProperty self#getElement "accessKey" (JavaString.fromCharCode key)

  method setEnabled enabled = DOM.setElementPropertyBoolean self#getElement "disabled" (not enabled)

  method setFocus focused =
    if focused
    then FocusImpl.focus self#getElement
    else FocusImpl.blur self#getElement

  method setTabIndex index = FocusImpl.setTabIndex self#getElement index

  method setElement elem =
    super#setElement elem;
    self#setTabIndex 0
end
