(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/ImageElement.java
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

let tAG = "img"

let as_ elem =
  assert (JavaString.equalsIgnoreCase (Element.getTagName elem) tAG);
  Obj.magic elem

let getAlt this = this#_get_alt
let getHeight this = this#_get_height
let getSrc = DOMImpl.imgGetSrc
let getWidth this = this#_get_width
let isMap this = << !!$this$.isMap >>
let setAlt this alt = this#_set_alt alt
let setHeight this height = this#_set_height height
let setIsMap this isMap = this#_set_isMap isMap
let setSrc = DOMImpl.imgSetSrc
let setUseMap this useMap = this#_set_useMap useMap
let setWidth this width = this#_set_width width
let useMap this = << !!$this$.useMap >>
