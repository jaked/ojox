(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/DomEvent.java
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
   Type class used by dom event subclasses. Type is specialized for dom in
   order to carry information about the native event.
   
   @param <H> handler type
 *)

(**
   This constructor allows dom event types to be triggered by the
   {@link DomEvent#fireNativeEvent(com.google.gwt.dom.client.NativeEvent, HasHandlers)}
   method. It should only be used by implementors supporting new dom events.
   
   <p>
   Any such dom event type must act as a flyweight around a native event
   object.
   </p>
   
   @param eventName the raw native event name
   @param flyweight the instance that will be used as a flyweight to wrap a
            native event
 *)
class [+'a] tag : string -> 'a ->
object
  inherit ['a] OjoxEvent.tag

  method getName : string
end

(**
   {@link DomEvent} is a subclass of {@link GwtEvent} that provides events that
   underlying native browser event object as well as a subclass of {@link Type}
   that understands GWT event bits used by sinkEvents().
   
   @param <H> handler type
   
 *)
class virtual c :
object ('self)
  inherit OjoxEvent.c

  method getNativeEvent : nativeEvent

  (**
     Gets the element relative to which event coordinates will be measured.
     If this element is <code>null</code>, event coordinates will be measured
     relative to the window's client area.
     
     @return the event's relative element
   *)
  method getRelativeElement : element

  (**
     Prevents the wrapped native event's default action.
   *)
  method preventDefault : unit

  (**
     Sets the native event associated with this dom event. In general, dom
     events should be fired using the static firing methods.
     
     @param nativeEvent the native event
   *)
  method setNativeEvent : nativeEvent -> unit

  (**
     Gets the element relative to which event coordinates will be measured.
     
     @param relativeElem the event's relative element
   *)
  method setRelativeElement : element -> unit

  (**
     Stops the propagation of the underlying native event.
   *)
  method stopPropagation : unit
end

val fireNativeEvent : nativeEvent -> ?relativeElem:element -> < fireEvent : 'a. (#OjoxEvent.c as 'a) -> unit; .. > -> unit
