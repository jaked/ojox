(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/shared/HandlerManager.java
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
   Manager responsible for adding handlers to event sources and firing those
   handlers on passed in events.
 *)

type handlerRegistration = unit -> unit
type 'a handler = 'a -> unit

(**
   Creates a handler manager with the given source, specifying the order in
   which handlers are fired.
  
   @param source the event source
   @param fireInReverseOrder true to fire handlers in reverse order
 *)
class c : ?isReverseOrder:bool -> <  > ->
object
  (**
     Adds a handle.
    
     @param 'a The type of handler
     @param type the event type associated with this handler
     @param handler the handler
     @return the handler registration, can be stored in order to remove the
             handler later
   *)
  method addHandler : 'a OjoxEvent.tag -> 'a handler -> handlerRegistration

  (**
     Fires the given event to the handlers listening to the event's type.
    
     Note, any subclass should be very careful about overriding this method, as
     adds/removes of handlers will not be safe except within this
     implementation.
    
     @param event the event
   *)
  method fireEvent : #OjoxEvent.c -> unit

  (**
     Gets the handler at the given index.
    
     @param 'a the event handler type
     @param index the index
     @param type the handler's event type
     @return the given handler
   *)
  method getHandler : 'a OjoxEvent.tag -> int -> 'a handler

  (**
     Gets the number of handlers listening to the event type.
    
     @param type the event type
     @return the number of registered handlers
   *)
  method getHandlerCount : 'a OjoxEvent.tag -> int

  (**
     Does this handler manager handle the given event type?
    
     @param e the event type
     @return whether the given event type is handled
   *)
  method isEventHandled : 'a OjoxEvent.tag -> bool
end
