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

open DOMTypes

(**
   Assert that the given {!Node} is an {!Element} and automatically
   typecast it.
 *)
val as_javaScriptObject : #javaScriptObject -> #element

(**
   Assert that the given {!Node} is an {!Element} and automatically
   typecast it.
 *)
val as_node : #node -> #element

(**
   Determines whether the given {!JavaScriptObject} can be cast to an
   {!Element}. A [null] object will cause this method to
   return [false].
 *)
val is_javaScriptObject : #javaScriptObject -> bool

(**
   Determine whether the given {!Node} can be cast to an {!Element}.
   A [null] node will cause this method to return
   [false].
 *)
val is_node : #node -> bool

(**
   Adds a name to this element's class property. If the name is already
   present, this method has no effect.
   
   @param className the class name to be added
   see {!#setClassName(String)}
*)
val addClassName : #element -> string -> unit

(**
   Removes keyboard focus from this element.
*)
val blur : #element -> unit

(**
   Dispatched the given event with this element as its target. The event will
   go through all phases of the browser's normal event dispatch mechanism.
   
   Note: Because the browser's normal dispatch mechanism is used, exceptions
   thrown from within handlers triggered by this method cannot be caught by
   wrapping this method in a try/catch block. Such exceptions will be caught
   by the
   {!com.google.gwt.core.client.GWT#setUncaughtExceptionHandler(com.google.gwt.core.client.GWT.UncaughtExceptionHandler) uncaught exception handler}
   as usual.
   
   @param evt the event to be dispatched
*)
val dispatchEvent : #element -> nativeEvent -> unit

(**
   Gives keyboard focus to this element.
*)
val focus : #element -> unit

(**
   Gets an element's absolute bottom coordinate in the document's coordinate
   system.
*)
val getAbsoluteBottom : #element -> int

(**
   Gets an element's absolute left coordinate in the document's coordinate
   system.
*)
val getAbsoluteLeft : #element -> int

(**
   Gets an element's absolute right coordinate in the document's coordinate
   system.
*)
val getAbsoluteRight : #element -> int

(**
   Gets an element's absolute top coordinate in the document's coordinate
   system.
*)
val getAbsoluteTop : #element -> int

(**
   Retrieves an attribute value by name.  Attribute support can be
   inconsistent across various browsers.  Consider using the accessors in
   {!Element} and its specific subclasses to retrieve attributes and
   properties.
   
   @param name The name of the attribute to retrieve
   @return The Attr value as a string, or the empty string if that attribute
           does not have a specified or default value
*)
val getAttribute : #element -> string -> string

(**
   The class attribute of the element. This attribute has been renamed due to
   conflicts with the "class" keyword exposed by many languages.
   
   @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-class> W3C HTML Specification
 *)
val getClassName : #element -> string

(**
   Returns the inner height of an element in pixels, including padding but not
   the horizontal scrollbar height, border, or margin.
   
   @return the element's client height
 *)
val getClientHeight : #element -> int

(**
   Returns the inner width of an element in pixels, including padding but not
   the vertical scrollbar width, border, or margin.
   
   @return the element's client width
 *)
val getClientWidth : #element -> int

(**
   Specifies the base direction of directionally neutral text and the
   directionality of tables.
 *)
val getDir : #element -> string

(**
   Returns a NodeList of all descendant Elements with a given tag name, in the
   order in which they are encountered in a preorder traversal of this Element
   tree.
   
   @param name The name of the tag to match on. The special value "*" matches
            all tags
   @return A list of matching Element nodes
 *)
val getElementsByTagName : #element -> string -> #element array

(**
   The first child of element this element. If there is no such element, this
   returns null.
*)
val getFirstChildElement : #element -> #element

(**
   The element's identifier.
   
   @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-id> W3C HTML Specification
 *)
val getId : #element -> string

(**
  All of the markup and content within a given element.
*)
val getInnerHTML : #element -> string

(**
   The text between the start and end tags of the object.
*)
val getInnerText : #element -> string

(**
   Language code defined in RFC 1766.
 *)
val getLang : #element -> string

(**
   The element immediately following this element. If there is no such
   element, this returns null.
*)
val getNextSiblingElement : #element -> #element

(**
   The height of an element relative to the layout.
 *)
val getOffsetHeight : #element -> int

(**
   The number of pixels that the upper left corner of the current element is
   offset to the left within the offsetParent node.
 *)
val getOffsetLeft : #element -> int

(**
   Returns a reference to the object which is the closest (nearest in the
   containment hierarchy) positioned containing element.
 *)
val getOffsetParent : #element -> #element

(**
   The number of pixels that the upper top corner of the current element is
   offset to the top within the offsetParent node.
 *)
val getOffsetTop : #element -> int

(**
   The width of an element relative to the layout.
 *)
val getOffsetWidth : #element -> int

(**
   Gets a boolean property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyBoolean : #element -> string -> bool

(**
   Gets a double property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyDouble : #element -> string -> float

(**
   Gets an integer property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyInt : #element -> string -> int

(**
   Gets a JSO property from this element.
  
   @param name the name of the property to be retrieved
   @return the property value
*)
val getPropertyJSO : #element -> string -> #javaScriptObject

(**
   Gets a property from this element.
   
   @param name the name of the property to be retrieved
   @return the property value
 *)
val getPropertyString : #element -> string -> string

(**
   The height of the scroll view of an element.
 *)
val getScrollHeight : #element -> int

(**
   The number of pixels that an element's content is scrolled from the left.
   
   If the element is in RTL mode, this method will return a negative value of
   the number of pixels scrolled from the right.
*)
val getScrollLeft : #element -> int

(**
   The number of pixels that an element's content is scrolled from the top.
 *)
val getScrollTop : #element -> int

(**
   The height of the scroll view of an element.
 *)
val getScrollWidth : #element -> int

(**
   Gets a string representation of this element (as outer HTML).
   
   We do not override {!toString()} because it is final in
   {!com.google.gwt.core.client.JavaScriptObject}.
   
   @return the string representation of this element
*)
val getString : #element -> string

(**
   Gets this element's {!Style} object.
 *)
val getStyle : #element -> style

(**
   The index that represents the element's position in the tabbing order.
   
   @see <http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-tabindex> W3C HTML Specification
*)
val getTabIndex : #element -> int

(**
   Gets the element's full tag name, including the namespace-prefix if
   present.
   
   @return the element's tag name
*)
val getTagName : #element -> string

(**
   The element's advisory title.
 *)
val getTitle : #element -> string

(**
   Determines whether an element has an attribute with a given name.
  
   Note that IE, prior to version 8, will return false-positives for names
   that collide with element properties (e.g., style, width, and so forth).
   
   @param name the name of the attribute
   @return <code>true</code> if this element has the specified attribute
*)
val hasAttribute : #element -> string -> bool

(**
  Determines whether this element has the given tag name.
  
  @param tagName the tag name, including namespace-prefix (if present)
  @return <code>true</code> if the element has the given tag name
*)
val hasTagName : #element -> string -> bool

(**
   Removes an attribute by name.
 *)
val removeAttribute : #element -> string -> unit

(**
   Removes a name from this element's class property. If the name is not
   present, this method has no effect.
   
   @param className the class name to be added
   see {!setClassName(String)}
*)
val removeClassName : #element -> string -> unit

(**
  Replace one class name with another.
 
  @param oldClassName the class name to be replaced
  @param newClassName the class name to replace it
*)
val replaceClassName : #element -> string -> string -> unit

(**
   Scrolls this element into view.
   
   This method crawls up the DOM hierarchy, adjusting the scrollLeft and
   scrollTop properties of each scrollable element to ensure that the
   specified element is completely in view. It adjusts each scroll position by
   the minimum amount necessary.
*)
val scrollIntoView : #element -> unit

(**
   Adds a new attribute. If an attribute with that name is already present in
   the element, its value is changed to be that of the value parameter.
   
   @param name The name of the attribute to create or alter
   @param value Value to set in string form
 *)
val setAttribute : #element -> string -> string -> unit

(**
   The class attribute of the element. This attribute has been renamed due to
   conflicts with the "class" keyword exposed by many languages.
   
   @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-class> W3C HTML Specification
 *)
val setClassName : #element -> string -> unit

(**
   Specifies the base direction of directionally neutral text and the
   directionality of tables.
 *)
val setDir : #element -> string -> unit

(**
   The element's identifier.
   
   @see <http://www.w3.org/TR/1999/REC-html401-19991224/struct/global.html#adef-id> W3C HTML Specification
 *)
val setId : #element -> string -> unit

(**
   All of the markup and content within a given element.
 *)
val setInnerHTML : #element -> string -> unit

(**
   The text between the start and end tags of the object.
*)
val setInnerText : #element -> string -> unit

(**
   Language code defined in RFC 1766.
 *)
val setLang : #element -> string -> unit

(**
   Sets a boolean property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyBoolean : #element -> string -> bool -> unit

(**
   Sets a double property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyDouble : #element -> string -> float -> unit

(**
   Sets an integer property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyInt : #element -> string -> int -> unit

(**
   Sets a JSO property on this element.
  
   @param name the name of the property to be set
   @param value the new property value
*)
val setPropertyJSO : #element -> string -> javaScriptObject -> unit

(**
   Sets a property on this element.
   
   @param name the name of the property to be set
   @param value the new property value
 *)
val setPropertyString : #element -> string -> string -> unit

(**
   The number of pixels that an element's content is scrolled to the left.
*)
val setScrollLeft : #element -> int -> unit

(**
   The number of pixels that an element's content is scrolled to the top.
 *)
val setScrollTop : #element -> int -> unit

(**
   The index that represents the element's position in the tabbing order.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/interact/forms.html#adef-tabindex">W3C HTML Specification</a>
*)
val setTabIndex : #element -> int -> unit

(**
   The element's advisory title.
 *)
val setTitle : #element -> string -> unit
