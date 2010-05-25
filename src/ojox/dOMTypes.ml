(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
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

class type javaScriptObject =
object
end

class type eventTarget =
object
  inherit javaScriptObject
end

class type nativeEvent =
object
  inherit javaScriptObject

  method initEvent : string -> bool -> bool -> unit
  method initKeyEvent : 'a. string -> bool -> bool -> 'a -> bool -> bool -> bool -> bool -> int -> int -> unit
  method initMouseEvent : 'a 'b. string -> bool -> bool -> 'a -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> 'b -> unit
  method _get_currentTarget : eventTarget
  method _get_relatedTarget : eventTarget
  method _get_target : eventTarget
  method _get_type : string
  method preventDefault : unit
  method _set_altKey : bool -> unit
  method _set_charCode : char -> unit
  method _set_charCode_int : int -> unit
  method _set_ctrlKey : bool -> unit
  method _set_keyCode : char -> unit
  method _set_keyCode_int : int -> unit
  method _set_metaKey : bool -> unit
  method _set_shiftKey : bool -> unit
  method stopPropagation : unit
  method toString : string
end

class type style =
object
  inherit javaScriptObject

  method _set_opacity : float -> unit
  method _set_opacity_string : string -> unit
end

class type node =
object
  inherit javaScriptObject


  method appendChild : 'a. 'a -> 'a
  method cloneNode : 'a. bool -> 'a
  method contains : node -> bool
  method dispatchEvent : nativeEvent -> unit
  method _get_childNodes : 'a. 'a array
  method _get_firstChild : 'a. 'a
  method _get_lastChild : 'a. 'a
  method _get_nextSibling : 'a. 'a
  method _get_nodeName : string
  method _get_nodeType : int
  method _get_nodeValue : string
  method _get_ownerDocument : 'a. 'a
  method _get_parentNode : 'a. 'a
  method _get_previousSibling : 'a. 'a
  method hasChildNodes : bool
  method insertBefore : 'a 'b. 'a -> 'b -> 'a
  method removeChild : 'a. 'a -> 'a
  method replaceChild : 'a 'b. 'a -> 'b -> 'b
  method _set_nodeValue : string -> unit
end

class type element =
object
  inherit node

  (**
     Removes keyboard focus from this element.
  *)
  method blur : unit

  (**
     Gives keyboard focus to this element.
  *)
  method focus : unit

  (**
     The class attribute of the element. This attribute has been renamed due to
     conflicts with the "class" keyword exposed by many languages.
     
     @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-class> W3C HTML Specification
   *)
  method _get_className : string

  (**
     Returns the inner height of an element in pixels, including padding but not
     the horizontal scrollbar height, border, or margin.
     
     @return the element's client height
   *)
  method _get_clientHeight : int

  (**
     Returns the inner width of an element in pixels, including padding but not
     the vertical scrollbar width, border, or margin.
     
     @return the element's client width
   *)
  method _get_clientWidth : int

  (**
     Specifies the base direction of directionally neutral text and the
     directionality of tables.
   *)
  method _get_dir : string

  (**
     Returns a NodeList of all descendant Elements with a given tag name, in the
     order in which they are encountered in a preorder traversal of this Element
     tree.
     
     @param name The name of the tag to match on. The special value "*" matches
              all tags
     @return A list of matching Element nodes
   *)
  method getElementsByTagName : string -> element array

  (**
     The element's identifier.
     
     @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-id> W3C HTML Specification
   *)
  method _get_id : string

  method _get_innerHTML : string

  (**
     Language code defined in RFC 1766.
   *)
  method _get_lang : string

  (**
     Returns a reference to the object which is the closest (nearest in the
     containment hierarchy) positioned containing element.
   *)
  method _get_offsetParent : element

  method _get_outerHTML : string

  (**
     Gets this element's {!Style} object.
   *)
  method _get_style : style

  (**
     The index that represents the element's position in the tabbing order.
     
     @see <http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-tabindex> W3C HTML Specification
  *)
  method _get_tabIndex : int

  method _get_tagName : string

  (**
     The element's advisory title.
   *)
  method _get_title : string

  method hasAttribute : string -> bool

  (**
     Removes an attribute by name.
   *)
  method removeAttribute : string -> unit

  (**
     Adds a new attribute. If an attribute with that name is already present in
     the element, its value is changed to be that of the value parameter.
     
     @param name The name of the attribute to create or alter
     @param value Value to set in string form
   *)
  method setAttribute : string -> string -> unit

  (**
     The class attribute of the element. This attribute has been renamed due to
     conflicts with the "class" keyword exposed by many languages.
     
     @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-class> W3C HTML Specification
   *)
  method _set_className : string -> unit

  (**
     Specifies the base direction of directionally neutral text and the
     directionality of tables.
   *)
  method _set_dir : string -> unit

  (**
     The element's identifier.
     
     @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-id> W3C HTML Specification
   *)
  method _set_id : string -> unit

  (**
     Language code defined in RFC 1766.
   *)
  method _set_lang : string -> unit

  method _set_scrollLeft : int -> unit

  (**
     The number of pixels that an element's content is scrolled to the top.
   *)
  method _set_scrollTop : int -> unit
end

class type bodyElement =
object
  inherit element
end

class type document =
object
  inherit node

  method createEvent : string -> nativeEvent
  method createElement : string -> #element
  method _get_compatMode : string
  method _get_documentElement : element
  method _get_body : bodyElement
end

class type buttonElement =
object
  inherit element

  method _set_type : string -> unit
  method click : unit
end

class type formElement =
object
  inherit element
end

class type imageElement =
object
  inherit element

  method _get_src : string
  method _set_src : string -> unit
end

class type inputElement =
object
  inherit element

  method _set_name : string -> unit
  method _set_type : string -> unit
end

class type optionElement =
object
  inherit element
end

class type scriptElement =
object
  inherit element

  method _get_defer : string
  method _get_src : string
  method _get_text : string
  method _get_type : string
  method _set_defer : string -> unit
  method _set_src : string -> unit
  method _set_text : string -> unit
  method _set_type : string -> unit
end

class type selectElement =
object
  inherit element

  method add : optionElement -> optionElement -> unit
  method _get_disabled : bool
  method _get_form : formElement
  method _get_multiple : string
  method _get_name : string
  method _get_options : optionElement array
  method _get_selectedIndex : int
  method _get_size : int
  method _get_type : string
  method _get_value : string
  method remove : int -> unit
  method _set_disabled : bool -> unit
  method _set_disabled_string : string -> unit
  method _set_multiple : bool -> unit
  method _set_name : string -> unit
  method _set_selectedIndex : int -> unit
  method _set_size : int -> unit
  method _set_type : string -> unit
  method _set_value : string -> unit
end
