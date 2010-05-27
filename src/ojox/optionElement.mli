(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/OptionElement.java
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

(**
   A selectable choice.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#edef-OPTION">W3C HTML Specification</a>
*)

val tAG : string

val as_ : element -> optionElement

(**
   Returns the FORM element containing this control. Returns null if this
   control is not within the context of a form.
*)
val getForm : optionElement -> formElement

(**
   The index of this OPTION in its parent SELECT, starting from 0.
*)
val getIndex : optionElement -> int

(**
   Option label for use in hierarchical menus.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-label-OPTION">W3C HTML Specification</a>
 *)
val getLabel : optionElement -> string

(**
   The text contained within the option element.
 *)
val getText : optionElement -> string

(**
   The current form control value.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-value-OPTION">W3C HTML Specification</a>
 *)
val getValue : optionElement -> string

(**
   Represents the value of the HTML selected attribute. The value of this
   attribute does not change if the state of the corresponding form control,
   in an interactive user agent, changes.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-selected">W3C HTML Specification</a>
 *)
val isDefaultSelected : optionElement -> bool

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
 *)
val isDisabled : optionElement -> bool

(**
   Represents the current state of the corresponding form control, in an
   interactive user agent. Changing this attribute changes the state of the
   form control, but does not change the value of the HTML selected attribute
   of the element.
 *)
val isSelected : optionElement -> bool

(**
   Represents the value of the HTML selected attribute. The value of this
   attribute does not change if the state of the corresponding form control,
   in an interactive user agent, changes.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-selected">W3C HTML Specification</a>
 *)
val setDefaultSelected : optionElement -> bool -> unit

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
 *)
val setDisabled : optionElement -> bool -> unit

(**
   Option label for use in hierarchical menus.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-label-OPTION">W3C HTML Specification</a>
 *)
val setLabel : optionElement -> string -> unit

(**
   Represents the current state of the corresponding form control, in an
   interactive user agent. Changing this attribute changes the state of the
   form control, but does not change the value of the HTML selected attribute
   of the element.
 *)
val setSelected : optionElement -> bool -> unit

(**
   The text contained within the option element.
 *)
val setText : optionElement -> string -> unit

(**
   The current form control value.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-value-OPTION">W3C HTML Specification</a>
 *)
val setValue : optionElement -> string -> unit

