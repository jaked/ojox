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

(**
   Abstract class representing mouse events.
   
   @param <H> handler type
   
 *)
class virtual c :
object
  inherit DomEvent.c

  (**
     Gets the mouse x-position within the browser window's client area.
     
     @return the mouse x-position
   *)
  method getClientX : int

  (**
     Gets the mouse y-position within the browser window's client area.
     
     @return the mouse y-position
   *)
  method getClientY : int

  (**
     Gets the button value. Compare it to
     {@link com.google.gwt.dom.client.NativeEvent#BUTTON_LEFT},
     {@link com.google.gwt.dom.client.NativeEvent#BUTTON_RIGHT},
     {@link com.google.gwt.dom.client.NativeEvent#BUTTON_MIDDLE}
     
     @return the button value
   *)
  method getNativeButton : int

  (**
     Gets the mouse x-position relative to a given element.
     
     @param target the element whose coordinate system is to be used
     @return the relative x-position
   *)
  method getRelativeX : #DOMTypes.element -> int

  (**
     Gets the mouse y-position relative to a given element.
     
     @param target the element whose coordinate system is to be used
     @return the relative y-position
   *)
  method getRelativeY : #DOMTypes.element -> int

  (**
     Gets the mouse x-position on the user's display.
     
     @return the mouse x-position
   *)
  method getScreenX : int

  (**
     Gets the mouse y-position on the user's display.
     
     @return the mouse y-position
   *)
  method getScreenY : int

  (**
     Gets the mouse x-position relative to the event's current target element.
     
     @return the relative x-position
   *)
  method getX : int

  (**
     Gets the mouse y-position relative to the event's current target element.
     
     @return the relative y-position
   *)
  method getY : int

  (**
     Is <code>alt</code> key down.
     
     @return whether the alt key is down
   *)
  method isAltKeyDown : bool

  (**
     Is <code>control</code> key down.
     
     @return whether the control key is down
   *)
  method isControlKeyDown : bool

  (**
     Is <code>meta</code> key down.
     
     @return whether the meta key is down
   *)
  method isMetaKeyDown : bool

  (**
     Is <code>shift</code> key down.
     
     @return whether the shift key is down
   *)
  method isShiftKeyDown : bool
end

