(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/MouseWheelEvent.java
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
   Represents a native mouse wheel event.
*)
class c :
object
  inherit MouseEvent.c

  method getAssociatedType : OjoxEvent.c OjoxEvent.tag

  (**
     Get the change in the mouse wheel position along the Y-axis; positive if
     the mouse wheel is moving north (toward the top of the screen) or negative
     if the mouse wheel is moving south (toward the bottom of the screen).
     
     Note that delta values are not normalized across browsers or OSes.
     
     @return the delta of the mouse wheel along the y axis
   *)
  method getDeltaY : int

  (**
     Convenience method that returns <code>true</code> if {@link #getDeltaY()}
     is a negative value (ie, the velocity is directed toward the top of the
     screen).
     
     @return true if the velocity is directed toward the top of the screen
   *)
  method isNorth : bool

  (**
     Convenience method that returns <code>true</code> if {@link #getDeltaY()}
     is a positive value (ie, the velocity is directed toward the bottom of the
     screen).
     
     @return true if the velocity is directed toward the bottom of the screen
   *)
  method isSouth : bool
end

(**
   Gets the event type associated with mouse wheel events.
   
   @return the handler type
*)
val getType : c DomEvent.tag
