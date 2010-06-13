(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/ButtonBase.java
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
   Abstract base class for {@link com.google.gwt.user.client.ui.Button},
   {@link com.google.gwt.user.client.ui.CheckBox},
   {@link com.google.gwt.user.client.ui.RadioButton}.
*)

(**
   Creates a new ButtonBase that wraps the given browser element.
   
   @param elem the DOM element to be wrapped
*)
class virtual c : #DOMTypes.element ->
object
  inherit FocusWidget.c

  method getHTML : string
  method getText : string
  method setHTML : string -> unit
  method setText : string -> unit
end
