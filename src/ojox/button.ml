(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/Button.java
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

class c ?html ?handler ?element () =
object (self)
  inherit ButtonBase.c
    begin match element with
       | None -> Document.createPushButtonElement (Document.get ())
       | Some element -> ButtonElement.as_ element
    end

  initializer
    self#setStyleName("ojox-Button");
    begin match html with
      | None -> ()
      | Some html -> self#setHTML html
    end;
    begin match handler with
      | None -> ()
      | Some handler -> let _ = self#addClickHandler handler in ()
    end

  method click = ButtonElement.click self#getButtonElement

  method getButtonElement = JavaScriptObject.cast self#getElement
end

let wrap element =
  (* Assert that the element is attached. *)
  assert (Node.isOrHasChild (Document.getBody (Document.get ())) element);

  let button = new c ~element () in

  (* Mark it attached and remember it for cleanup. *)
  button#onAttach;
  RootPanel.detachOnWindowClose button;

  button

