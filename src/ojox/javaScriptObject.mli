(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/core/client/JavaScriptObject.java
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
   An opaque handle to a native JavaScript object. A
   [JavaScriptObject] cannot be created directly.  [JavaScriptObject]
   should be declared as the return type of a JSNI method that returns
   native (non-Java) objects. A [JavaScriptObject] passed back into
   JSNI from Java becomes the original object, and can be accessed in
   JavaScript as expected.
*)

(**
   Returns a new array.
*)
val createArray : unit -> javaScriptObject

(**
   Returns an empty function.
 *)
val createFunction : unit -> javaScriptObject

(**
   Returns a new object.
 *)
val createObject : unit -> javaScriptObject

(**
   A helper method to enable cross-casting from any {!JavaScriptObject}
   type to any other {!JavaScriptObject} type.
 
   @param 'a the original type of the object
   @param 'b the cast type of the object
   @param obj the object as 'a
   @return the object as 'b
 *)
val cast : (#javaScriptObject as 'a) -> (#javaScriptObject as 'b)

(**
   Returns [true] if the objects are JavaScript identical
   (triple-equals).
 *)
val equals : #javaScriptObject -> #javaScriptObject -> bool

(**
   Uses a monotonically increasing counter to assign a hash code to the
   underlying JavaScript object. Do not call this method on non-modifiable
   JavaScript objects.
   
   TODO: if the underlying object defines a 'hashCode' method maybe use that?
   
   @return the hash code of the object
 *)
val hashCode : #javaScriptObject -> int

(**
   Returns the results of calling [toString]> in JavaScript on the
   object, if the object implements toString; otherwise returns "[JavaScriptObject]".
 *)
val toString : #javaScriptObject -> string
