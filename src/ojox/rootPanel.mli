(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/RootPanel.java
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
   The panel to which all other widgets must ultimately be added. RootPanels are
   never created directly. Rather, they are accessed via {@link RootPanel#get()}
   .
   
   <p>
   Most applications will add widgets to the default root panel in their
   {@link com.google.gwt.core.client.EntryPoint#onModuleLoad} methods.
   </p>
 *)

(**
   Marks a widget as detached and removes it from the detach list.
   
   <p>
   If an element belonging to a widget originally passed to
   {@link #detachOnWindowClose(Widget)} has been removed from the document,
   calling this method will cause it to be marked as detached immediately.
   Failure to do so will keep the widget from being garbage collected until
   the page is unloaded.
   </p>
   
   <p>
   This method may only be called per widget, and only for widgets that were
   originally passed to {@link #detachOnWindowClose(Widget)}.
   </p>
   
   @param widget the widget that no longer needs to be cleaned up when the
            page closes
   @see #detachOnWindowClose(Widget)
 *)
val detachNow : Widget.c -> unit

(**
   Adds a widget to the detach list. This is the list of widgets to be
   detached when the page unloads.
   
   <p>
   This method must be called for all widgets that have no parent widgets.
   These are most commonly {@link RootPanel RootPanels}, but can also be any
   widget used to wrap an existing element on the page. Failing to do this may
   cause these widgets to leak memory. This method is called automatically by
   widgets' wrap methods (e.g.
   {@link Button#wrap(com.google.gwt.dom.client.Element)}).
   </p>
   
   <p>
   This method may <em>not</em> be called on any widget whose element is
   contained in another widget. This is to ensure that the DOM and Widget
   hierarchies cannot get into an inconsistent state.
   </p>
   
   @param widget the widget to be cleaned up when the page closes
   @see #detachNow(Widget)
 *)
val detachOnWindowClose : #Widget.c -> unit

(**
   Gets the default root panel. This panel wraps the body of the browser's
   document. This root panel can contain any number of widgets, which will be
   laid out in their natural HTML ordering. Many applications, however, will
   add a single panel to the RootPanel to provide more structure.
   
   @return the default RootPanel
 *)
(**
   Gets the root panel associated with a given browser element. For this to
   work, the HTML document into which the application is loaded must have
   specified an element with the given id.
   
   @param id the id of the element to be wrapped with a root panel (
            <code>null</code> specifies the default instance, which wraps the
            &lt;body&gt; element)
   @return the root panel, or <code>null</code> if no such element was found
 *)
val get : ?id:string -> unit -> AbsolutePanel.c

(**
   Convenience method for getting the document's body element.
   
   @return the document's body element
 *)
val getBodyElement : unit -> DOMTypes.element

(**
   Determines whether the given widget is in the detach list.
   
   @param widget the widget to be checked
   @return <code>true</code> if the widget is in the detach list
 *)
val isInDetachList : Widget.c -> bool

val detachWidgets : unit -> unit
