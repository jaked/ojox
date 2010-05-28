(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/Event.java
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

(**
   An opaque handle to a native DOM Event. An <code>Event</code> cannot be
   created directly. Instead, use the <code>Event</code> type when returning a
   native DOM event from JSNI methods. An <code>Event</code> passed back into
   JSNI becomes the original DOM event the <code>Event</code> was created from,
   and can be accessed in JavaScript code as expected. This is typically done by
   calling methods in the {@link com.google.gwt.user.client.DOM} class.
*)

(**
   Fired when an element loses keyboard focus.
 *)
val oNBLUR : int

(**
   Fired when the value of an input element changes.
 *)
val oNCHANGE : int

(**
   Fired when the user clicks on an element.
 *)
val oNCLICK : int

(**
   Fired when the user double-clicks on an element.
 *)
val oNDBLCLICK : int

(**
   Fired when an image encounters an error.
 *)
val oNERROR : int

(**
   Fired when an element receives keyboard focus.
 *)
val oNFOCUS : int

(**
   Fired when the user depresses a key.
 *)
val oNKEYDOWN : int

(**
   Fired when the a character is generated from a keypress (either directly or
   through auto-repeat).
 *)
val oNKEYPRESS : int

(**
   Fired when the user releases a key.
 *)
val oNKEYUP : int

(**
   Fired when an element (normally an IMG) finishes loading.
 *)
val oNLOAD : int

(**
   Fired when an element that has mouse capture loses it.
 *)
val oNLOSECAPTURE : int

(**
   Fired when an element that has mouse capture loses it.
 *)
val oNMOUSEDOWN : int

(**
   Fired when the mouse is moved within an element's area.
 *)
val oNMOUSEMOVE : int

(**
   Fired when the mouse is moved out of an element's area.
 *)
val oNMOUSEOUT : int

(**
   Fired when the mouse is moved into an element's area.
 *)
val oNMOUSEOVER : int

(**
   Fired when the user releases a mouse button over an element.
 *)
val oNMOUSEUP : int

(**
   Fired when the user scrolls the mouse wheel over an element.
 *)
val oNMOUSEWHEEL : int

(**
   Fired when the user pastes text into an input element.
   
   Note: This event is <em>not</em> supported on Firefox 2 and earlier, or
   Opera 10 and earlier. Be aware that it will not fire on these browser
   versions.
 *)
val oNPASTE : int

(**
   Fired when a scrollable element's scroll offset changes.
 *)
val oNSCROLL : int

(**
   Fired when the user requests an element's context menu (usually by
   right-clicking).
   
   Note that not all browsers will fire this event (notably Opera, as of 9.5).
 *)
val oNCONTEXTMENU : int

(**
   A bit-mask covering both focus events (focus and blur).
 *)
val fOCUSEVENTS : int

(**
   A bit-mask covering all keyboard events (down, up, and press).
 *)
val kEYEVENTS : int

(**
   A bit-mask covering all mouse events (down, up, move, over, and out), but
   not click, dblclick, or wheel events.
 *)
val mOUSEEVENTS : int

(**
   Adds a {@link NativePreviewHandler} that will receive all events before
   they are fired to their handlers. Note that the handler will receive
   <u>all</u> native events, including those received due to bubbling, whereas
   normal event handlers only receive explicitly sunk events.
   
   Unlike other event handlers, {@link NativePreviewHandler} are fired in the
   reverse order that they are added, such that the last
   {@link NativePreviewEvent} that was added is the first to be fired.
   
   Please note that nondeterministic behavior will result if more than one GWT
   application registers preview handlers. See <a href=
   'http://code.google.com/p/google-web-toolkit/issues/detail?id=3892'>issue
   3892</a> for details.

   @param handler the {@link NativePreviewHandler}
   @return {@link HandlerRegistration} used to remove this handler
 *)
val addNativePreviewHandler : (NativePreviewEvent.c -> unit) -> (unit -> unit)

(**
   Fire a {@link NativePreviewEvent} for the native event.
   
   @param nativeEvent the native event
   @return true to fire the event normally, false to cancel the event
 *)
val fireNativePreviewEvent : nativeEvent -> bool

(**
   Gets the current event that is being fired. The current event is only
   available within the lifetime of the onBrowserEvent function. Once the
   onBrowserEvent method returns, the current event is reset to null.
   
   @return the current event
 *)
val getCurrentEvent : unit -> event

(**
   Gets the {@link EventListener} that will receive events for the given
   element. Only one such listener may exist for a single element.
   
   @param elem the element whose listener is to be set
   @return the element's event listener
 *)
val getEventListener : element -> eventListener

(**
   Gets the current set of events sunk by a given element.
   
   @param elem the element whose events are to be retrieved
   @return a bitfield describing the events sunk on this element (its possible
           values are described in {@link Event})
 *)
val getEventsSunk : element -> int

(**
   Gets the enumerated type of this event given a valid event type name.
   
   @param typeName the typeName to be tested
   @return the event's enumerated type
 *)
val getTypeInt_string : string -> int

(**
   Releases mouse capture on the given element. Calling this method has no
   effect if the element does not currently have mouse capture.
   
   @param elem the element to release capture
   @see #setCapture(Element)
 *)
val releaseCapture : element -> unit

(**
   Sets mouse-capture on the given element. This element will directly receive
   all mouse events until {@link #releaseCapture(Element)} is called on it.
   
   @param elem the element on which to set mouse capture
 *)
val setCapture : element -> unit

(**
   Sets the {@link EventListener} to receive events for the given element.
   Only one such listener may exist for a single element.
   
   @param elem the element whose listener is to be set
   @param listener the listener to receive {@link Event events}
 *)
val setEventListener : element -> eventListener -> unit

(**
   Sets the current set of events sunk by a given element. These events will
   be fired to the nearest {@link EventListener} specified on any of the
   element's parents.
   
   @param elem the element whose events are to be retrieved
   @param eventBits a bitfield describing the events sunk on this element (its
            possible values are described in {@link Event})
 *)
val sinkEvents : element -> int -> unit

(**
   Gets the enumerated type of this event, as defined by {@link #ONCLICK},
   {@link #ONMOUSEDOWN}, and so forth.
   
   @return the event's enumerated type
 *)
val getTypeInt : event -> int
