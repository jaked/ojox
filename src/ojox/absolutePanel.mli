(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/AbsolutePanel.java
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
   An absolute panel positions all of its children absolutely, allowing them to
   overlap.
   
   <p>
   Note that this panel will not automatically resize itself to allow enough
   room for its absolutely-positioned children. It must be explicitly sized in
   order to make room for them.
   </p>
   
   <p>
   Once a widget has been added to an absolute panel, the panel effectively
   "owns" the positioning of the widget. Any existing positioning attributes on
   the widget may be modified by the panel.
   </p>
 *)

(**
   Creates an AbsolutePanel with the given element. This is protected so that
   it can be used by {@link RootPanel} or a subclass that wants to substitute
   another element. The element is presumed to be a &lt;div&gt;.
   
   @param elem the element to be used for this panel
 *)
class c : ?elem:DOMTypes.element -> unit ->
object
  inherit ComplexPanel.c

  method add : Widget.c -> unit

  (**
     Adds a widget to the panel at the specified position. Setting a position of
     <code>(-1, -1)</code> will cause the child widget to be positioned
     statically.
     
     @param w the widget to be added
     @param left the widget's left position
     @param top the widget's top position
   *)
  method add3 : Widget.c -> int -> int -> unit

  (**
     Gets the position of the left outer border edge of the widget relative to
     the left outer border edge of the panel.
     
     @param w the widget whose position is to be retrieved
     @return the widget's left position
   *)
  method getWidgetLeft : Widget.c -> int

  (**
     Gets the position of the top outer border edge of the widget relative to
     the top outer border edge of the panel.
     
     @param w the widget whose position is to be retrieved
     @return the widget's top position
   *)
  method getWidgetTop : Widget.c -> int

  method insert2 : Widget.c -> int -> unit

  (**
     Inserts a child widget at the specified position before the specified
     index. Setting a position of <code>(-1, -1)</code> will cause the child
     widget to be positioned statically. If the widget is already a child of
     this panel, it will be moved to the specified index.
     
     @param w the child widget to be inserted
     @param left the widget's left position
     @param top the widget's top position
     @param beforeIndex the index before which it will be inserted
     @throws IndexOutOfBoundsException if <code>beforeIndex</code> is out of
               range
   *)
  method insert3 : Widget.c -> int -> int -> int -> unit

  (**
     Overrides {@link ComplexPanel#remove(Widget)} to change the removed
     Widget's element back to static positioning.This is done so that any
     positioning changes to the widget that were done by the panel are undone
     when the widget is disowned from the panel.
   *)
  method remove : Widget.c -> bool

  (**
     Sets the position of the specified child widget. Setting a position of
     <code>(-1, -1)</code> will cause the child widget to be positioned
     statically.
     
     @param w the child widget to be positioned
     @param left the widget's left position
     @param top the widget's top position
   *)
  method setWidgetPosition : Widget.c -> int -> int -> unit

  method setWidgetPositionImpl : Widget.c -> int -> int -> unit
end
