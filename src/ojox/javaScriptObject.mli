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

(**
 * An opaque handle to a native JavaScript object. A
 * <code>JavaScriptObject</code> cannot be created directly.
 * <code>JavaScriptObject</code> should be declared as the return type of a
 * JSNI method that returns native (non-Java) objects. A
 * <code>JavaScriptObject</code> passed back into JSNI from Java becomes the
 * original object, and can be accessed in JavaScript as expected.
 *)
class type c =
object
end

(**
 * Returns a new array.
 *)
val createArray : unit -> c

(**
 * Returns an empty function.
 *)
val createFunction : unit -> c

(**
 * Returns a new object.
 *)
val createObject : unit -> c

(**
 * A helper method to enable cross-casting from any {@link JavaScriptObject}
 * type to any other {@link JavaScriptObject} type.
 * 
 * @param <T> the target type
 * @return this object as a different type
 *)
val cast : #c -> #c

(**
 * Returns <code>true</code> if the objects are JavaScript identical
 * (triple-equals).
 *)
val equals : #c -> #c -> bool

(**
 * Uses a monotonically increasing counter to assign a hash code to the
 * underlying JavaScript object. Do not call this method on non-modifiable
 * JavaScript objects.
 * 
 * TODO: if the underlying object defines a 'hashCode' method maybe use that?
 * 
 * @return the hash code of the object
 *)
val hashCode : #c -> int

(**
 * Returns the results of calling <code>toString</code> in JavaScript on the
 * object, if the object implements toString; otherwise returns "[JavaScriptObject]".
 *)
val toString : #c -> string
