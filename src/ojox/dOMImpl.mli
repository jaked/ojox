(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/dom/client/DOMImpl.java
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

open DOMTypes

val buttonClick : buttonElement -> unit
val createButtonElement : document -> string -> buttonElement
(*
val createElement : document -> string -> element
val createHtmlEvent : document -> string -> bool -> bool -> nativeEvent
val createInputElement : document -> string -> inputElement
val createInputRadioElement : document -> string -> inputElement

val createKeyEvent :
  document ->
  string -> bool -> bool -> bool -> bool -> bool -> bool -> int -> int ->
  nativeEvent

val createMouseEvent :
  document ->
  string -> bool -> bool -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> element ->
  nativeEvent

val createScriptElement : document -> string -> scriptElement
val createSelectElement : document -> bool -> selectElement
val cssClearOpacity : style -> unit
val cssFloatPropertyName : string
val cssSetOpacity : style -> float -> unit
val dispatchEvent : element -> nativeEvent -> unit
val eventGetAltKey : nativeEvent -> bool
val eventGetButton : nativeEvent -> int
val eventGetClientX : nativeEvent -> int
val eventGetClientY : nativeEvent -> int
val eventGetCtrlKey : nativeEvent -> bool
val eventGetCurrentTarget : nativeEvent -> eventTarget
val eventGetKeyCode : nativeEvent -> int
val eventGetMetaKey : nativeEvent -> bool
val eventGetMouseWheelVelocityY : nativeEvent -> int
val eventGetRelatedTarget : nativeEvent -> eventTarget
val eventGetScreenX : nativeEvent -> int
val eventGetScreenY : nativeEvent -> int
val eventGetShiftKey : nativeEvent -> bool
val eventGetTarget : nativeEvent -> eventTarget
val eventGetType : nativeEvent -> string
val eventPreventDefault : nativeEvent -> unit
val eventSetKeyCode : nativeEvent -> char -> unit
val eventStopPropagation : nativeEvent -> unit
val eventToString : nativeEvent -> string
val getAbsoluteLeft : element -> int
val getAbsoluteTop : element -> int
val getAttribute : element -> string -> string
val getBodyOffsetLeft : document -> int
val getBodyOffsetTop : document -> int
val getFirstChildElement : element -> element
val getInnerHTML : element -> string
val getInnerText : element -> string
val getNextSiblingElement : element -> element
val getNodeType : node -> int
val getParentElement : node -> element
val getScrollLeft : document -> int
val getScrollTop : document -> int
val getTageName : element -> string
val hasAttribute : element -> string -> bool
val imgGetSrc : element -> string
val imgSetSrc : element -> string -> unit
val isOrHasChild : node -> node -> bool
val selectAdd : selectElement -> optionElement -> optionElement -> unit
val selectClear : selectElement -> unit
val selectGetLength : selectElement -> int
val selectGetOptions : selectElement -> optionElement array
val selectRemoveOption : selectElement -> int -> unit
val setInnerText : element -> string -> unit
val setScrollLeft : element -> int -> unit
val setScrollLeft_document : document -> int -> unit
val setScrollTop : document -> int -> unit
val toString : element -> string
*)
