(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/Node.java
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
   The Node interface is the primary datatype for the entire Document Object
   Model. It represents a single node in the document tree. While all objects
   implementing the Node interface expose methods for dealing with children, not
   all objects implementing the Node interface may have children.
*)

(**
   The node is an {!Element}.
 *)
val eLEMENT_NODE : int

(**
   The node is a {!Text} node.
 *)
val tEXT_NODE : int

(**
   The node is a {!Document}.
 *)
val dOCUMENT_NODE : int

(**
   Assert that the given {!JavaScriptObject} is a DOM node and
   automatically typecast it.
 *)
val as_ : javaScriptObject -> node

(**
   Determines whether the given {!JavaScriptObject} is a DOM node. A
   [null] object will cause this method to return
   [false].
 *)
val is : javaScriptObject -> bool
