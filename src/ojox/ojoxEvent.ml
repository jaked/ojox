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

class [+'a] tag =
object
end

class virtual c =
object (self)
  val mutable dead = false
  val mutable source = (None : < > option)

  method virtual getAssociatedType : c tag

  method getSource : 'a. (< .. > as 'a) =
    self#assertLive;
    match source with
      | None -> raise Not_found
      | Some s -> (Obj.magic s)

  method assertLive = assert (not dead)

  (* no dispatch, it's just function application *)

  method isLive = not dead

  method kill =
    dead <- true;
    source <- None

  method revive =
    dead <- false;
    source <- None

  method setSource : 'a. (< .. > as 'a) -> unit = fun s ->
    source <- Some (Obj.magic s)
end
