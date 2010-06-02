(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/shared/GwtEvent.java
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
   Type class used to register events with the {!HandlerManager}.
   <p>
   Type is parameterized by the handler type in order to make the addHandler
   method type safe.
   </p>
  
   @param 'a handler type
 *)
class ['a] tag :
object
end

(**
   Root of all GWT events. All GWT events are considered dead and should no
   longer be accessed once the {!HandlerManager} which originally fired the
   event finishes with it. That is, don't hold on to event objects outside of
   your handler methods.
  
   @param 'a handler type
*)
class virtual c :
object ('self)

  (**
     Returns the type used to register this event. Used by handler manager to
     dispatch events to the correct handlers.
    
     @return the type
   *)
  method virtual getAssociatedType : 'self tag

  (**
     Returns the source that last fired this event.
    
     @return object representing the source of this event
   *)
  method getSource : 'a. (< .. > as 'a)

  (**
     Asserts that the event still should be accessed. All events are considered
     to be "dead" after their original handler manager finishes firing them. An
     event can be revived by calling {!GwtEvent#revive()}.
   *)
  method assertLive : unit

  (**
     Is the event current live?
     
     @return whether the event is live
   *)
  method isLive : bool

  (**
     Kill the event. After the event has been killed, users cannot really on its
     values or functions being available.
   *)
  method kill : unit

  (**
     Revives the event. Used when recycling event instances.
   *)
  method revive : unit

  (**
     Set the source that triggered this event.
    
     @param source the source of this event, should only be set by a
              {!HandlerManager}
   *)
  method setSource : 'a. (< .. > as 'a) -> unit
end
