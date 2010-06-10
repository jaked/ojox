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

open Ocamljs.Inline

class c (parent : #Widget.hasWidgets) =
object (self)
  val mutable array = (Array.make 4 << null >> : Widget.c array)
  val mutable size = 0

  method private array = array
  method private parent = parent
  method size = size

  method add w = self#insert w size
  method contains w = self#indexOf w != -1

  method get index =
    if index < 0 || index >= size
    then invalid_arg "WidgetCollection.get";
    array.(index)

  method indexOf w =
    let rec loop i =
      if i = size then -1
      else if array.(i) = w then i
      else loop (i + 1) in
    loop 0

  method insert w beforeIndex =
    if beforeIndex < 0 || beforeIndex > size
    then invalid_arg "WidgetCollection.insert";

    (* Realloc array if necessary (doubling). *)
    let len = Array.length array in
    if size = len
    then begin
      let newArray = Array.make (len * 2) << null >> in
      for i = 0 to len - 1 do
        newArray.(i) <- array.(i)
      done;
      array <- newArray
    end;

    size <- size + 1;

    (* Move all widgets after 'beforeIndex' back a slot. *)
    for i = size - 1 downto beforeIndex + 1 do
      array.(i) <- array.(i - 1)
    done;

    array.(beforeIndex) <- w

  method iterator =
  object
    val mutable index = -1

    method hasNext = index < size - 1

    method next =
      if index >= size
      then invalid_arg "WidgetCollection.iterator.next";
      index <- index + 1;
      array.(index)

    method remove =
      if index < 0 || index >= size
      then invalid_arg "WidgetCollection.iterator.remove";
      ignore (parent#remove(array.(index)));
      index <- index -1
  end

  method list = Array.to_list (Array.sub array 0 size)

  method remove_index index =
    if index < 0 || index >= size
    then invalid_arg "WidgetCollection.remove";

    size <- size - 1;

    for i = index to size - 1 do
      array.(i) <- array.(i + 1)
    done;

    array.(size) <- << null >>

  method remove w =
    let index = self#indexOf w in
    if index = -1 then raise Not_found;
    self#remove_index index
end
