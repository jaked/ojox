(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/user/client/ui/impl/FocusImpl.java
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
   Implementation interface for creating and manipulating focusable elements
   that aren't naturally focusable in all browsers, such as DIVs.
*)
(**
   Returns the focus implementation class for creating and manipulating
   focusable elements that aren't naturally focusable in all browsers, such as
   DIVs.
*)
val blur : element -> unit
val createFocusable : unit -> element
val focus : element -> unit
val getTabIndex : element -> int
val setAccessKey : element -> char -> unit
val setTabIndex : element -> int -> unit
