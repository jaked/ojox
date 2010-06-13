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

open DOMTypes

(**
   Push button.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#edef-BUTTON">W3C HTML Specification</a>
 *)

val tAG : string

(**
   Assert that the given {@link Element} is compatible with this class and
   automatically typecast it.
 *)
val as_ : element -> buttonElement

(**
   Simulate a mouse-click.
 *)
val click : buttonElement -> unit

(**
   A single character access key to give access to the form control.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-accesskey">W3C HTML Specification</a>
 *)
val getAccessKey : buttonElement -> string

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
   @deprecated use {@link #isDisabled()} instead.
 *)
val getDisabled : buttonElement -> string

(**
   Returns the FORM element containing this control. Returns null if this
   control is not within the context of a form.
 *)
val getForm : buttonElement -> formElement

(**
   Form control or object name when submitted with a form.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-name-BUTTON">W3C HTML Specification</a>
 *)
val getName : buttonElement -> string

(**
   The type of button (all lower case).
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-type-BUTTON">W3C HTML Specification</a>
 *)
val getType : buttonElement -> string

(**
   The current form control value.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-value-BUTTON">W3C HTML Specification</a>
 *)
val getValue : buttonElement -> string

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
 *)
val isDisabled : buttonElement -> bool

(**
   A single character access key to give access to the form control.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-accesskey">W3C HTML Specification</a>
 *)
val setAccessKey : buttonElement -> string -> unit

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
 *)
val setDisabled : buttonElement -> bool -> unit

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
   @deprecated use {@link #setDisabled(boolean)} instead
 *)
val setDisabled_string : buttonElement -> string -> unit

(**
   Form control or object name when submitted with a form.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-name-BUTTON">W3C HTML Specification</a>
 *)
val setName : buttonElement -> string -> unit

(**
   The current form control value.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-value-BUTTON">W3C HTML Specification</a>
 *)
val setValue : buttonElement -> string -> unit
