(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/AttachDetachException.java
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

exception AttachDetachException of exn list

let attachCommand w = w#onAttach

let detachCommand w = w#onDetach

let tryCommand widgets c =
  let caught = ref [] in
  List.iter
    (fun w -> try c w  with e -> caught := e::!caught)
    widgets;
  if !caught != []
  then raise (AttachDetachException !caught)
