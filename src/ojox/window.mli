(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/Window.java
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

open HandlerManager

(**
   This class provides access to the browser window's methods, properties, and
   events.
*)
class c :
object
end

(**
   Displays a message in a modal dialog box.
   
  @param msg the message to be displayed.
*)
val alert : string -> unit

(**
   Adds a {@link CloseEvent} handler.
   
   @param handler the handler
   @return returns the handler registration
*)
val addCloseHandler : 'a CloseEvent.c handler -> handlerRegistration


