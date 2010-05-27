(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/SelectElement.java
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
   The select element allows the selection of an option.
   
   The contained options can be directly accessed through the select element as
   a collection.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#edef-SELECT">W3C HTML Specification</a>
 *)

val tAG : string

(**
   Assert that the given {@link Element} is compatible with this class and
   automatically typecast it.
 *)
val as_ : element -> selectElement

(**
   Add a new element to the collection of OPTION elements for this SELECT.
   This method is the equivalent of the appendChild method of the Node
   interface if the before parameter is null. It is equivalent to the
   insertBefore method on the parent of before in all other cases. This method
   may have no effect if the new element is not an OPTION or an OPTGROUP.
   
   @param option The element to add
   @param before The element to insert before, or null for the tail of the
            list
 *)
val add : selectElement -> ?before:optionElement -> optionElement -> unit

(**
   Removes all OPTION elements from this SELECT.
 *)
val clear : selectElement -> unit

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
   @deprecated use {@link #isDisabled()} instead.
 *)
val getDisabled : selectElement -> string

(**
   Returns the FORM element containing this control. Returns null if this
   control is not within the context of a form.
 *)
val getForm : selectElement -> formElement

(**
   The number of options in this SELECT.
 *)
val getLength : selectElement -> int

(**
   If true, multiple OPTION elements may be selected in this SELECT.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-multiple">W3C HTML Specification</a>
 *)
val getMultiple : selectElement -> string

(**
   Form control or object name when submitted with a form.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-name-SELECT">W3C HTML Specification</a>
 *)
val getName : selectElement -> string

(**
   The collection of OPTION elements contained by this element.
 *)
val getOptions : selectElement -> optionElement array

(**
   The ordinal index of the selected option, starting from 0. The value -1 is
   returned if no element is selected. If multiple options are selected, the
   index of the first selected option is returned.
 *)
val getSelectedIndex : selectElement -> int

(**
   Number of visible rows.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-size-SELECT">W3C HTML Specification</a>
 *)
val getSize : selectElement -> int

(**
   The type of this form control. This is the string "select-multiple" when
   the multiple attribute is true and the string "select-one" when false.
 *)
val getType : selectElement -> string

(**
   The current form control value (i.e. the value of the currently selected
   option), if multiple options are selected this is the value of the first
   selected option.
 *)
val getValue : selectElement -> string

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
 *)
val isDisabled : selectElement -> bool

(**
   If true, multiple OPTION elements may be selected in this SELECT.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-multiple">W3C HTML Specification</a>
 *)
val isMultiple : selectElement -> bool

(**
   Remove an element from the collection of OPTION elements for this SELECT.
   Does nothing if no element has the given index.
   
   @param index The index of the item to remove, starting from 0.
 *)
val remove : selectElement -> int -> unit

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
 *)
val setDisabled : selectElement -> bool -> unit

(**
   The control is unavailable in this context.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-disabled">W3C HTML Specification</a>
 *)
val setDisabled_string : selectElement -> string -> unit

(**
   If true, multiple OPTION elements may be selected in this SELECT.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-multiple">W3C HTML Specification</a>
 *)
val setMultiple : selectElement -> bool -> unit

(**
   Form control or object name when submitted with a form.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-name-SELECT">W3C HTML Specification</a>
 *)
val setName : selectElement -> string -> unit

(**
   The ordinal index of the selected option, starting from 0. The value -1 is
   returned if no element is selected. If multiple options are selected, the
   index of the first selected option is returned.
 *)
val setSelectedIndex : selectElement -> int -> unit

(**
   Number of visible rows.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-size-SELECT">W3C HTML Specification</a>
 *)
val setSize : selectElement -> int -> unit

(**
   The type of this form control. This is the string "select-multiple" when
   the multiple attribute is true and the string "select-one" when false.
 *)
val setType : selectElement -> string -> unit

(**
   The current form control value (i.e. the value of the currently selected
   option), if multiple options are selected this is the value of the first
   selected option.
 *)
val setValue : selectElement -> string -> unit
