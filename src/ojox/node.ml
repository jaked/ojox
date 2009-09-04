(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/Node.java
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

class type c =
object
  inherit JavaScriptObject.c

  method appendChild : 'a.'a -> 'a
  method cloneNode : bool -> c
  method _get_childNodes : c array
  method _get_firstChild : c
  method _get_lastChild : c
  method _get_nextSibling : c
  method _get_nodeName : string
  method _get_nodeType : int
  method _get_nodeValue : string
  method _get_parentNode : c
  method _get_previousSibling : c
  method _get_hasChildNodes : bool
  method insertBefore : c -> c -> c
  method removeChild : c -> c
  method replaceChild : c-> c -> c
  method _set_nodeValue : string -> unit

  constraint 'a = #c
end
