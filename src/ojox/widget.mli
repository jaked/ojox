(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/Widget.java
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

open DOMTypes_

class type ['a] iterator_ =
object
  method hasNext : bool
  method next : 'a
  method remove : unit
end

class type ['a] hasWidgets_ =
object
  method add : 'a -> unit
  method clear : unit
  method iterator : 'a iterator_
  method list : 'a list
  method remove : 'a -> bool
end

(**
   The base class for the majority of user-interface objects. Widget adds
   support for receiving events from the browser and being added directly to
   {@link com.google.gwt.user.client.ui.Panel panels}.
 *)

class c :
object
  inherit UIObject.c

  method fireEvent : #OjoxEvent.c -> unit

  (**
     Gets the panel-defined layout data associated with this widget.
     
     @return the widget's layout data
     @see #setLayoutData
   *)
  method getLayoutData : 'a. 'a

  (**
     Gets this widget's parent panel.
     
     @return the widget's parent panel
   *)
  method getParent : c
  
  (**
     Determines whether this widget is currently attached to the browser's
     document (i.e., there is an unbroken chain of widgets between this widget
     and the underlying browser document).
     
     @return <code>true</code> if the widget is attached
   *)
  method isAttached : bool
  
  method onBrowserEvent : event -> unit

  (**
     Removes this widget from its parent widget, if one exists.
     
     <p>
     If it has no parent, this method does nothing. If it is a "root" widget
     (meaning it's been added to the detach list via
     {@link RootPanel#detachOnWindowClose(Widget)}), it will be removed from the
     detached immediately. This makes it possible for Composites and Panels to
     adopt root widgets.
     </p>
     
     @throws IllegalStateException if this widget's parent does not support
               removal (e.g. {@link Composite})
   *)
  method removeFromParent : unit
  
  (**
     Sets the panel-defined layout data associated with this widget. Only the
     panel that currently contains a widget should ever set this value. It
     serves as a place to store layout bookkeeping data associated with a
     widget.
     
     @param layoutData the widget's layout data
   *)
  method setLayoutData : 'a. 'a -> unit

  (**
     Overridden to defer the call to super.sinkEvents until the first time this
     widget is attached to the dom, as a performance enhancement. Subclasses
     wishing to customize sinkEvents can preserve this deferred sink behavior by
     putting their implementation behind a check of
     <code>isOrWasAttached()</code>:
     
     <pre>
     {@literal @}Override
     public void sinkEvents(int eventBitsToAdd) {
       if (isOrWasAttached()) {
         /{@literal *} customized sink code goes here {@literal *}/
       } else {
         super.sinkEvents(eventBitsToAdd);
      }
   *} </pre>
   *)
  method sinkEvents : int -> unit

  (**
     Adds a native event handler to the widget and sinks the corresponding
     native event. If you do not want to sink the native event, use the generic
     addHandler method instead.
     
     @param <H> the type of handler to add
     @param type the event key
     @param handler the handler
     @return {@link HandlerRegistration} used to remove the handler
   *)
  method addDomHandler : 'a HandlerManager.handler -> 'a DomEvent.tag -> HandlerManager.handlerRegistration
  
  (**
     Adds this handler to the widget.
     
     @param <H> the type of handler to add
     @param type the event type
     @param handler the handler
     @return {@link HandlerRegistration} used to remove the handler
   *)
  method addHandler : 'a HandlerManager.handler -> 'a OjoxEvent.tag -> HandlerManager.handlerRegistration
  
  (**
     Fires an event on a child widget. Used to delegate the handling of an event
     from one widget to another.
     
     @param event the event
     @param target fire the event on the given target
   *)
  method delegateEvent : 'a 'b. (< fireEvent: 'c. (#OjoxEvent.c as 'c) -> unit; .. > as 'b) -> (#OjoxEvent.c as 'a) -> unit

  (**
     If a widget contains one or more child widgets that are not in the logical
     widget hierarchy (the child is physically connected only on the DOM level),
     it must override this method and call {@link #onAttach()} for each of its
     child widgets.
     
     @see #onAttach()
   *)
  method doAttachChildren : unit
  
  (**
     If a widget contains one or more child widgets that are not in the logical
     widget hierarchy (the child is physically connected only on the DOM level),
     it must override this method and call {@link #onDetach()} for each of its
     child widgets.
     
     @see #onDetach()
   *)
  method doDetachChildren : unit
  
  (**
     Gets the number of handlers listening to the event type.
     
     @param type the event type
     @return the number of registered handlers
   *)
  method getHandlerCount : 'a OjoxEvent.tag -> int

  (**
     Has this widget ever been attached?
     
     @return true if this widget ever been attached to the DOM, false otherwise
   *)
  method isOrWasAttached : bool

  (**
     <p>
     This method is called when a widget is attached to the browser's document.
     To receive notification after a Widget has been added to the document,
     override the {@link #onLoad} method.
     </p>
     <p>
     It is strongly recommended that you override {@link #onLoad()} or
     {@link #doAttachChildren()} instead of this method to avoid
     inconsistencies between logical and physical attachment states. 
     </p>
     <p>
     Subclasses that override this method must call
     <code>super.onAttach()</code> to ensure that the Widget has been attached
     to its underlying Element.
     </p>
     
     @throws IllegalStateException if this widget is already attached
     @see #onLoad()
     @see #doAttachChildren()
   *)
  method onAttach : unit
  
  (**
     <p>
     This method is called when a widget is detached from the browser's
     document. To receive notification before a Widget is removed from the
     document, override the {@link #onUnload} method.
     </p>
     <p>
     It is strongly recommended that you override {@link #onUnload()} or
     {@link #doDetachChildren()} instead of this method to avoid
     inconsistencies between logical and physical attachment states. 
     </p>
     <p>
     Subclasses that override this method must call
     <code>super.onDetach()</code> to ensure that the Widget has been detached
     from the underlying Element. Failure to do so will result in application
     memory leaks due to circular references between DOM Elements and JavaScript
     objects.
     </p>
     
     @throws IllegalStateException if this widget is already detached
     @see #onUnload()
     @see #doDetachChildren()
   *)
  method onDetach : unit

  (**
     This method is called immediately after a widget becomes attached to the
     browser's document.
   *)
  method onLoad : unit
  
  (**
     This method is called immediately before a widget will be detached from the
     browser's document.
   *)
  method onUnload : unit

  (**
     Sets this widget's parent. This method should only be called by
     {@link Panel} and {@link Composite}.
     
     @param parent the widget's new parent
     @throws IllegalStateException if <code>parent</code> is non-null and the
               widget already has a parent
  *)
  method setParent : c -> unit

  method instanceof_hasWidgets : c hasWidgets_ option
end

class type iterator = object inherit [c] iterator_ end
class type hasWidgets = object inherit [c] hasWidgets_ end

val widgetsToDetach : (c, unit) Hashtbl.t
val detachNow : c -> unit
val isInDetachList : c -> bool
