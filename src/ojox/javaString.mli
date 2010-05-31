(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/emul/java/lang/String.java
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

(** Enough java.lang.String functions to make porting straightforward. *)

val charAt : string -> int -> char
val contains : string -> string -> bool
val equalsIgnoreCase : string -> string -> bool
val indexOf : string -> ?startIndex:int -> string -> int
val indexOf_char : string -> ?startIndex:int -> char -> int
val length : string -> int
val substring : string -> ?endIndex:int -> int -> string
val toLowerCase : string -> string
val trim : string -> string
