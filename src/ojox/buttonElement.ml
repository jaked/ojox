(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/ButtonElement.java
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

let tAG = "button"

let as_ elem =
  assert (JavaString.equalsIgnoreCase (Element.getTagName elem) tAG);
  Obj.magic elem

let click = DOMImpl.buttonClick
let getAccessKey this = this#_get_accessKey
let getDisabled this = this#_get_disabled
let getForm this = this#_get_form
let getName this = this#_get_name
let getType this = this#_get_type
let getValue this = this#_get_value
let isDisabled this = << !!$this$.disabled >>
let setAccessKey this accessKey = this#_set_accessKey accessKey
let setDisabled this disabled = this#_set_disabled disabled
let setDisabled_string this disabled = this#_set_disabled_string_ disabled
let setName this name = this#_set_name name
let setValue this value = this#_set_value value
