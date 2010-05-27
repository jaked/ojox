(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/user/client/impl/DOMImpl.java
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
open DOMTypes_

val eventSystemIsInitialized : bool ref
val isMyListener : 'a -> bool
val eventCancelBubble : event -> bool -> unit
val eventGetFromElement : event -> #element
val eventGetRepeat : event -> bool
val eventGetToElement : event -> #element
val eventGetTypeInt : event -> int
val eventGetTypeInt_string : string -> int
val eventSetKeyCode : event -> char -> unit
val getChild : #element -> int -> #element
val getChildCount : #element -> int
val getEventListener : #element -> eventListener
val getEventsSunk : #element -> int
val insertChild : #element -> #element -> int -> unit
val maybeInitializeEventSystem : unit -> unit
val releaseCapture : #element -> unit
val setCapture : #element -> unit
val setEventListener : #element -> eventListener -> unit
val sinkEvents : #element -> int -> unit
val initEventSystem : unit -> unit

val domDispatchEvent : (event -> element -> eventListener -> unit) ref
val domPreviewEvent : (event -> bool) ref
