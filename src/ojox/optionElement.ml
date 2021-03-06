(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/optionElement.java
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

let tAG = "option"

let as_ elem =
  assert (JavaString.equalsIgnoreCase (Element.getTagName elem) tAG);
  Obj.magic elem

let getForm this = this#_get_form
let getIndex this = this#_get_index
let getLabel this = this#_get_label
let getText this = this#_get_text
let getValue this = this#_get_value
let isDefaultSelected this = << !!$this$.defaultSelected >>
let isDisabled this = << !!$this$.disabled >>
let isSelected this = << !!$this$.selected >>
let setDefaultSelected this selected = this#_set_defaultSelected selected
let setDisabled this disabled = this#_set_disabled disabled
let setLabel this label = this#_set_label label
let setSelected this selected = this#_set_selected selected
let setText this text = this#_set_text text
let setValue this value = this#_set_value value
