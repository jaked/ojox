(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/Panel.java
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

class virtual c =
object (self)
  inherit Widget.c

  method add : Widget.c -> unit = fun child -> failwith "This panel does not support no-arg add()"

  method clear =
    let it = self#iterator in
    while it#hasNext do
      ignore (it#next);
      it#remove
    done

  method adopt : 'a. (#Widget.c as 'a) -> unit = fun child ->
    assert (Ocamljs.is_null child#getParent);
    child#setParent (self :> Widget.c)

  method doAttachChildren =
    AttachDetachException.tryCommand self AttachDetachException.attachCommand

  method doDetachChildren =
    AttachDetachException.tryCommand self AttachDetachException.detachCommand

  method onLoad = ()

  method onUnload = ()

  method orphan : 'a. (#Widget.c as 'a) -> unit = fun child ->
    assert (child#getParent = (self :> Widget.c));
    child#setParent << null >>

  method virtual iterator : Widget.c Widget.iterator
  method virtual remove : Widget.c -> bool

  method instanceof_hasWidgets = Some (self :> Widget.c Widget.hasWidgets)
end
