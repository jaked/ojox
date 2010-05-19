(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/Element.java
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
  inherit Node.c

  (**
     The class attribute of the element. This attribute has been renamed due to
     conflicts with the "class" keyword exposed by many languages.
     
     @see <a
          href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-class">W3C
          HTML Specification</a>
   *)
  method _get_className : string

  (**
     Returns the inner height of an element in pixels, including padding but not
     the horizontal scrollbar height, border, or margin.
     
     @return the element's client height
   *)
  method _get_clientHeight : string

  (**
     Returns the inner width of an element in pixels, including padding but not
     the vertical scrollbar width, border, or margin.
     
     @return the element's client width
   *)
  method _get_clientWidth : string

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
  method getElementsByTagName : string -> c array

  (**
     The element's identifier.
     
     @see <a
          href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-id">W3C
          HTML Specification</a>
   *)
  method _get_id : string

  (**
     Language code defined in RFC 1766.
   *)
  method _get_lang : string

  (**
     Returns a reference to the object which is the closest (nearest in the
     containment hierarchy) positioned containing element.
   *)
  method _get_offsetParent : c

  (**
     Gets this element's {!Style} object.
   *)
  method _get_style : Style.c

  (**
     The name of the element.
   *)
  method _get_tagName : string

  (**
     The element's advisory title.
   *)
  method _get_title : string

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
     
     @see <a
          href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-class">W3C
          HTML Specification</a>
   *)
  method _set_className : string -> unit

  (**
     Specifies the base direction of directionally neutral text and the
     directionality of tables.
   *)
  method _set_dir : string -> unit

  (**
     The element's identifier.
     
     @see <a
          href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-id">W3C
          HTML Specification</a>
   *)
  method _set_id : string -> unit

  (**
     Language code defined in RFC 1766.
   *)
  method _set_lang : string -> unit

  (**
     The number of pixels that an element's content is scrolled to the top.
   *)
  method _set_scrollTop : string -> unit
end

(**
   Assert that the given {!Node} is an {!Element} and automatically
   typecast it.
 *)
val as_javaScriptObject : JavaScriptObject.c -> c

(**
   Assert that the given {!Node} is an {!Element} and automatically
   typecast it.
 *)
val as_node : Node.c -> c

(**
   Determines whether the given {!JavaScriptObject} can be cast to an
   {!Element}. A [null] object will cause this method to
   return [false].
 *)
val is_javaScriptObject : JavaScriptObject.c -> bool

(**
   Determine whether the given {!Node} can be cast to an {!Element}.
   A [null] node will cause this method to return
   [false].
 *)
val is_node : Node.c -> bool

(**
   The height of an element relative to the layout.
 *)
val getOffsetHeight : c -> int

(**
   The number of pixels that the upper left corner of the current element is
   offset to the left within the offsetParent node.
 *)
val getOffsetLeft : c -> int

(**
   The number of pixels that the upper top corner of the current element is
   offset to the top within the offsetParent node.
 *)
val getOffsetTop : c -> int

(**
   The width of an element relative to the layout.
 *)
val getOffsetWidth : c -> int

(**
   Gets a boolean property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyBoolean : c -> string -> bool

(**
   Gets a double property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyDouble : c -> string -> float

(**
   Gets an integer property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyInt : c -> string -> int

(**
   Gets a property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyString : c -> string -> string

(**
   The height of the scroll view of an element.
 *)
val getScrollHeight : c -> int

(**
   The number of pixels that an element's content is scrolled from the top.
 *)
val getScrollTop : c -> int

(**
   The height of the scroll view of an element.
 *)
val getScrollWidth : c -> int

(**
   All of the markup and content within a given element.
 *)
val setInnerHTML : c -> string -> unit

(**
   Sets a boolean property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyBoolean : c -> string -> bool -> unit

(**
   Sets a double property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyDouble : c -> string -> float -> unit

(**
   Sets an integer property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyInt : c -> string -> int -> unit

(**
   Sets a property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyString : c -> string -> string -> unit

(**
   The element's advisory title.
 *)
val setTitle : c -> string -> unit

