(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/ComplexPanel.java
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
   Abstract base class for panels that can contain multiple child widgets.
*)
class c :
object
  inherit Panel.c

  method getWidget : int -> Widget.c
  method getWidgetCount : int
  method getWidgetIndex : Widget.c -> int
  method iterator : Widget.iterator
  method list : Widget.c list
  method remove_index : int -> bool
  method remove : Widget.c -> bool

  (**
     Adds a new child widget to the panel, attaching its Element to the
     specified container Element.
     
     @param child the child widget to be added
     @param container the element within which the child will be contained
   *)
  method add2 : Widget.c -> #element -> unit

  (**
     Adjusts beforeIndex to account for the possibility that the given widget is
     already a child of this panel.
     
     @param child the widget that might be an existing child
     @param beforeIndex the index at which it will be added to this panel
     @return the modified index
   *)
  method adjustIndex : Widget.c -> int -> int

  (**
     Checks that <code>index</code> is in the range [0, getWidgetCount()), which
     is the valid range on accessible indexes.
     
     @param index the index being accessed
   *)
  method checkIndexBoundsForAccess : int -> unit

  (**
     Checks that <code>index</code> is in the range [0, getWidgetCount()], which
     is the valid range for indexes on an insertion.
     
     @param index the index where insertion will occur
   *)
  method checkIndexBoundsForInsertion : int -> unit

  (**
     Gets the list of children contained in this panel.
     
     @return a collection of child widgets
   *)
  method getChildren : WidgetCollection.c

  (**
     Insert a new child Widget into this Panel at a specified index, attaching
     its Element to the specified container Element. The child Element will
     either be attached to the container at the same index, or simply appended
     to the container, depending on the value of <code>domInsert</code>.
     
     @param child the child Widget to be added
     @param container the Element within which <code>child</code> will be
              contained
     @param beforeIndex the index before which <code>child</code> will be
              inserted
     @param domInsert if <code>true</code>, insert <code>child</code> into
              <code>container</code> at <code>beforeIndex</code>; otherwise
              append <code>child</code> to the end of <code>container</code>.
   *)
  method insert : Widget.c -> #element -> int -> bool -> unit

  method doLogicalClear : unit
end

