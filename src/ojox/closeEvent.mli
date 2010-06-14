(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/logical/shared/CloseEvent.java
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

class type hasHandlers =
object
  method fireEvent : #OjoxEvent.c -> unit
end

(**
   Represents a close event.
   
   @param <T> the type being closed
*)
(**
   Creates a new close event.
   
   @param target the target
   @param autoClosed whether it is auto closed
 *)
class ['a] c : 'a -> bool ->
object
  inherit OjoxEvent.c

  method getAssociatedType : OjoxEvent.c OjoxEvent.tag

  (**
     Gets the target.
     
     @return the target
   *)
  method getTarget : 'a

  (**
     Was the target automatically closed?
     
     @return auto closed
   *)
  method isAutoClosed : bool
end

(**
   Fires a close event on all registered handlers in the handler manager.
   
   @param <T> the target type
   @param source the source of the handlers
   @param target the target
   @param autoClosed was the target closed automatically
 *)
val fire : ?autoClosed:bool -> #hasHandlers -> 'a -> unit

(**
   Gets the type associated with this event.
   
   @return returns the handler type
 *)
val getType : 'a OjoxEvent.tag
