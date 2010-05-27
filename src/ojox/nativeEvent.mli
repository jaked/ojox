(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/NativeEvent.java
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

open DOMTypes

(**
   The native dom event.
*)

(**
   The left mouse button.
*)
val bUTTON_LEFT : int

(**
   The middle mouse button.
 *)
val bUTTON_MIDDLE : int

(**
   The right mouse button.
 *)
val bUTTON_RIGHT : int

(**
   Gets whether the ALT key was depressed when the given event occurred.
   
   @return <code>true</code> if ALT was depressed when the event occurred
 *)
val getAltKey : nativeEvent -> bool

(**
   Gets the mouse buttons that were depressed when the given event occurred.
   
   @return a bit-field, defined by {@link NativeEvent#BUTTON_LEFT},
           {@link NativeEvent#BUTTON_MIDDLE}, and
           {@link NativeEvent#BUTTON_RIGHT}
 *)
val getButton : nativeEvent -> int

(**
   Gets the mouse x-position within the browser window's client area.
   
   @return the mouse x-position
 *)
val getClientX : nativeEvent -> int

(**
   Gets the mouse y-position within the browser window's client area.
   
   @return the mouse y-position
 *)
val getClientY : nativeEvent -> int

(**
   Gets whether the CTRL key was depressed when the given event occurred.
   
   @return <code>true</code> if CTRL was depressed when the event occurred
 *)
val getCtrlKey : nativeEvent -> bool

(**
   Gets the current target element of this event. This is the element whose
   listener fired last, not the element which fired the event initially.
   
   @return the event's current target element
 *)
val getCurrentEventTarget : nativeEvent -> eventTarget

(**
   Returns the element that was the actual target of the given event.
   
   @return the target element
 *)
val getEventTarget : nativeEvent -> eventTarget

(**
   Gets the key code associated with this event.
   
   For key press events, this method returns the Unicode value of the
   character generated. For key down and key up events, it returns the code
   associated with the physical key.
   
   @return the Unicode character or key code.
   @see com.google.gwt.event.dom.client.KeyCodes
 *)
val getKeyCode : nativeEvent -> int

(**
   Gets whether the META key was depressed when the given event occurred.
   
   @return <code>true</code> if META was depressed when the event occurred
 *)
val getMetaKey : nativeEvent -> bool

(**
   Gets the velocity of the mouse wheel associated with the event along the Y
   axis.

   The velocity of the event is an artifical measurement for relative
   comparisons of wheel activity. It is affected by some non-browser factors,
   including choice of input hardware and mouse acceleration settings. The
   sign of the velocity measurement agrees with the screen coordinate system;
   negative values are towards the origin and positive values are away from
   the origin. Standard scrolling speed is approximately ten units per event.
   
   @return The velocity of the mouse wheel.
 *)
val getMouseWheelVelocityY : nativeEvent -> int

(**
   Gets the related target for this event.
   
   @return the related target
 *)
val getRelatedEventTarget : nativeEvent -> eventTarget

(**
   Gets the mouse x-position on the user's display.
   
   @return the mouse x-position
 *)
val getScreenX : nativeEvent -> int

(**
   Gets the mouse y-position on the user's display.
   
   @return the mouse y-position
 *)
val getScreenY : nativeEvent -> int

(**
   Gets whether the shift key was depressed when the given event occurred.
   
   @return <code>true</code> if shift was depressed when the event occurred
 *)
val getShiftKey : nativeEvent -> bool

(**
   Gets a string representation of this event.
   
   We do not override {@link #toString()} because it is final in
   {@link com.google.gwt.core.client.JavaScriptObject }.
   
   @return the string representation of this event
 *)
val getString : nativeEvent -> string

(**
   Gets the enumerated type of this event.
   
   @return the event's enumerated type
 *)
val getType : nativeEvent -> string

(**
   Prevents the browser from taking its default action for the given event.
 *)
val preventDefault : nativeEvent -> unit

(**
   Stops the event from being propagated to parent elements.
 *)
val stopPropagation : nativeEvent -> unit
