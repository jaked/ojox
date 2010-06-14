(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/impl/WindowImpl.java
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
   Native implementation associated with
   {@link com.google.gwt.user.client.Window}.
*)
val getHash : unit -> string
val getQueryString : unit -> string
val initWindowCloseHandler : unit -> unit
val initWindowResizeHandler : unit -> unit
val initWindowScrollHandler : unit -> unit

val onClosing : (unit -> unit) ref
val onClosed : (unit -> unit) ref
val onResize : (unit -> unit) ref
val onScroll : (unit -> unit) ref
