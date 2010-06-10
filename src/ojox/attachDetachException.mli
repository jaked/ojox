(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/AttachDetachException.java
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
   An exception that is thrown when the panel fails to attach or detach its
   children.
 *)
exception AttachDetachException of exn list

(**
   The singleton command used to attach widgets.
*)
val attachCommand : Widget.c -> unit

(**
   The singleton command used to detach widgets.
*)
val detachCommand : Widget.c -> unit

(**
   <p>
   Iterator through all child widgets, trying to perform the specified
   {@link Command} for each. All widgets will be visited even if the Command
   throws an exception. If one or more exceptions occur, they will be combined
   and thrown as a single {@link AttachDetachException}.
   </p>
   <p>
   Use this method when attaching or detaching a widget with children to
   ensure that the logical and physical state of all children match the
   logical and physical state of the parent.
   </p>
   
   @param hasWidgets children to iterate
   @param c the {@link Command} to try on all children
*)
val tryCommand : Widget.c list -> (Widget.c -> unit) -> unit
