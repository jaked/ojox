(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/KeyCodes.java
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
   Contains the native key codes previously defined in
   {@link com.google.gwt.user.client.ui.KeyboardListener}. When converting
   keyboard listener instances, developers can use the following static import
   to access these constants:
   
   <pre> import static com.google.gwt.event.dom.client.KeyCodes.*; </pre>
   
   These constants are defined with an int data type in order to be compatible
   with the constants defined in
   {@link com.google.gwt.user.client.ui.KeyboardListener}.
 *)

(**
   Alt key code.
 *)
val kEY_ALT : int

(**
   Backspace key code.
 *)
val kEY_BACKSPACE : int
(**
   Control key code.
 *)
val kEY_CTRL : int

(**
   Delete key code.
 *)
val kEY_DELETE : int

(**
   Down arrow code.
 *)
val kEY_DOWN : int

(**
   End key code.
 *)
val kEY_END : int

(**
   Enter key code.
 *)
val kEY_ENTER : int
(**
   Escape key code.
 *)
val kEY_ESCAPE : int
(**
   Home key code.
 *)
val kEY_HOME : int
(**
   Left key code.
 *)
val kEY_LEFT : int
(**
   Page down key code.
 *)
val kEY_PAGEDOWN : int
(**
   Page up key code.
 *)
val kEY_PAGEUP : int
(**
   Right arrow key code.
 *)
val kEY_RIGHT : int
(**
   Shift key code.
 *)
val kEY_SHIFT : int

(**
   Tab key code.
 *)
val kEY_TAB : int
(**
   Up Arrow key code.
 *)
val kEY_UP : int
