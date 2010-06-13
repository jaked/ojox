(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/MouseWheelEvent.java
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

let tag = ref (Obj.magic None)

class c =
object (self)
  inherit MouseEvent.c

  method getAssociatedType = (!tag :> OjoxEvent.c OjoxEvent.tag)
  method getDeltaY = NativeEvent.getMouseWheelVelocityY self#getNativeEvent
  method isNorth = self#getDeltaY < 0
  method isSouth = self#getDeltaY > 0
end

(**
   Hidden type used to ensure DOMMouseScroll gets registered in the type map.
   This is the special name used on Mozilla browsers for what everyone else
   calls 'mousewheel'.
*)
let _ = new DomEvent.tag "DOMMouseScroll" (new c)

let _ = tag := (new DomEvent.tag "mousewheel" (new c) :> c DomEvent.tag)

let getType = !tag
