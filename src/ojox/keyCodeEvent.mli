(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/KeyCodeEvent.java
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
   Key up and key down are both events based upon a given key code.
   
   @param <H> handler type
 *)
class virtual c :
object
  inherit KeyEvent.c

  (**
     Gets the native key code. These key codes are enumerated in the
     {@link KeyCodes} class.
     
     @return the key code
   *)
  method getNativeKeyCode : int

  (**
     Is this a key down arrow?
     
     @return whether this is a down arrow key event
   *)
  method isDownArrow : bool

  (**
     Is this a left arrow?
     
     @return whether this is a left arrow key event
   *)
  method isLeftArrow : bool

  (**
     Is this a right arrow?
     
     @return whether this is a right arrow key event
   *)
  method isRightArrow : bool

  (**
     Is this a up arrow?
     
     @return whether this is a right arrow key event
   *)
  method isUpArrow : bool

  (* method toDebugString : string *)
end

(**
   Does the key code represent an arrow key?
     
   @param keyCode the key code
   @return if it is an arrow key code
*)
val isArrow : int -> bool
