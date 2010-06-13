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

(**
   Abstract base class for most widgets that can receive keyboard focus.
 *)

(**
   Creates a new focus widget that wraps the specified browser element.
   
   @param elem the element to be wrapped
 *)
class virtual c : ?elem : #DOMTypes.element -> unit ->
object
  inherit Widget.c

  method addBlurHandler : BlurEvent.c handler -> handlerRegistration
  method addClickHandler : ClickEvent.c handler -> handlerRegistration
  method addFocusHandler : FocusEvent.c handler -> handlerRegistration
  method addKeyDownHandler : KeyDownEvent.c handler -> handlerRegistration
  method addKeyPressHandler : KeyPressEvent.c handler -> handlerRegistration
  method addKeyUpHandler : KeyUpEvent.c handler -> handlerRegistration
  method addMouseDownHandler : MouseDownEvent.c handler -> handlerRegistration
  method addMouseMoveHandler : MouseMoveEvent.c handler -> handlerRegistration
  method addMouseOutHandler : MouseOutEvent.c handler -> handlerRegistration
  method addMouseOverHandler : MouseOverEvent.c handler -> handlerRegistration
  method addMouseUpHandler : MouseUpEvent.c handler -> handlerRegistration
  method addMouseWheelHandler : MouseWheelEvent.c handler -> handlerRegistration

  (**
     Gets the tab index.
     
     @return the tab index
   *)
  method getTabIndex : int

  (**
     Gets whether this widget is enabled.
     
     @return <code>true</code> if the widget is enabled
   *)
  method isEnabled : bool

  method setAccessKey : char -> unit

  (**
     Sets whether this widget is enabled.
     
     @param enabled <code>true</code> to enable the widget, <code>false</code>
              to disable it
   *)
  method setEnabled : bool -> unit

  method setFocus : bool -> unit

  method setTabIndex : int -> unit

  method setElement : DOMTypes.element -> unit
end
