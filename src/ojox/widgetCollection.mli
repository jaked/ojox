(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/WidgetCollection.java
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
   A simple collection of widgets to be used by
   {@link com.google.gwt.user.client.ui.Panel panels} and
   {@link com.google.gwt.user.client.ui.Composite composites}.
   
   <p>
   The main purpose of this specialized collection is to implement
   {@link java.util.Iterator#remove()} in a way that delegates removal to its
   panel. This makes it much easier for the panel to implement an
   {@link com.google.gwt.user.client.ui.HasWidgets#iterator() iterator} that
   supports removal of widgets.
   </p>
*)
(**
   Constructs a new widget collection.
   
   @param parent the container whose {@link HasWidgets#remove(Widget)} will be
            delegated to by the iterator's {@link Iterator#remove()} method.
*)
class c : #Widget.hasWidgets ->
object
  (**
     Adds a widget to the end of this collection.
     
     @param w the widget to be added
   *)
  method add : Widget.c -> unit

  (**
     Determines whether a given widget is contained in this collection.
     
     @param w the widget to be searched for
     @return <code>true</code> if the widget is present
   *)
  method contains : Widget.c -> bool

  (**
     Gets the widget at the given index.
     
     @param index the index to be retrieved
     @return the widget at the specified index
     @throws IndexOutOfBoundsException if the index is out of range
   *)
  method get : int -> Widget.c

  (**
     Gets the index of the specified index.
     
     @param w the widget to be found
     @return the index of the specified widget, or <code>-1</code> if it is
             not found
   *)
  method indexOf : Widget.c -> int

  (**
     Inserts a widget before the specified index.
     
     @param w the widget to be inserted
     @param beforeIndex the index before which the widget will be inserted
     @throws IndexOutOfBoundsException if <code>beforeIndex</code> is out of
               range
   *)
  method insert : Widget.c -> int -> unit

  (**
     Gets an iterator on this widget collection. This iterator is guaranteed to
     implement remove() in terms of its containing {@link HasWidgets}.
     
     @return an iterator
   *)
  method iterator : Widget.iterator

  method list : Widget.c list

  (**
     Removes the widget at the specified index.
     
     @param index the index of the widget to be removed
     @throws IndexOutOfBoundsException if <code>index</code> is out of range
   *)
  method remove_index : int -> unit

  (**
     Removes the specified widget.
     
     @param w the widget to be removed
     @throws NoSuchElementException if the widget is not present
   *)
  method remove : Widget.c -> unit

  (**
     Gets the number of widgets in this collection.
     
     @return the number of widgets
   *)
  method size : int
end
