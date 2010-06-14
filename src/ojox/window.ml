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

open Ocamljs.Inline

open HandlerManager

class c =
object
end

class windowHandlers =
object (self)
  inherit HandlerManager.c (new c)

  method addCloseHandler : c handler -> handlerRegistration = fun handler -> self#addHandler CloseEvent.getType handler
end

let alert msg = <:stmt< $$wnd.alert($msg$); >>

let closeHandlersInitialized = ref false

let handlers = new windowHandlers

let getHandlers () = handlers

let onClosed () =
  if !closeHandlersInitialized
  then CloseEvent.fire (getHandlers ()) (new c)

let onClosing () = () (* XXX *)

let maybeInitializeCloseHandlers () =
  WindowImpl.onClosing := onClosing;
  WindowImpl.onClosed := onClosed;
  WindowImpl.initWindowCloseHandler ()

let addHandler tag handler = (getHandlers ())#addHandler tag handler

let addCloseHandler handler =
  maybeInitializeCloseHandlers ();
  addHandler CloseEvent.getType handler
