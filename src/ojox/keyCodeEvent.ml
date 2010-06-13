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

class virtual c =
object (self)
  inherit KeyEvent.c as super

  method getNativeKeyCode = NativeEvent.getKeyCode self#getNativeEvent

  method isDownArrow = self#getNativeKeyCode = KeyCodes.kEY_DOWN
  method isLeftArrow = self#getNativeKeyCode = KeyCodes.kEY_LEFT
  method isRightArrow = self#getNativeKeyCode = KeyCodes.kEY_RIGHT
  method isUpArrow = self#getNativeKeyCode = KeyCodes.kEY_UP

(*
  method toDebugString =
    super#toDebugString ^ "[" ^ string_of_int self#getNativeKeyCode ^ "]"
*)
end

let isArrow keyCode =
  keyCode = KeyCodes.kEY_DOWN ||
  keyCode = KeyCodes.kEY_RIGHT ||
  keyCode = KeyCodes.kEY_UP ||
  keyCode = KeyCodes.kEY_LEFT
