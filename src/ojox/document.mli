(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/Document.java
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
   A Document is the root of the HTML hierarchy and holds the entire content.
   Besides providing access to the hierarchy, it also provides some convenience
   methods for accessing certain sets of information from the document.
*)

(**
   Gets the default document. This is the document in which the module is
   running.
   
   @return the default document
 *)
val get : unit -> document

(**
   Creates an &lt;a&gt; element.
   
   @return the newly created element
*)
val createAnchorElement : document -> anchorElement

(**
   Creates an &lt;area&gt; element.
   
   @return the newly created element
*)
val createAreaElement : document -> areaElement

(**
   Creates a &lt;base&gt; element.
   
   @return the newly created element
*)
val createBaseElement : document -> baseElement

(**
   Creates a &lt;blockquote&gt; element.
   
   @return the newly created element
*)
val createBlockQuoteElement : document -> quoteElement

(**
   Creates a 'blur' event.
*)
val createBlurEvent : document -> nativeEvent

(**
   Creates a &lt;br&gt; element.
   
   @return the newly created element
*)
val createBRElement : document -> bRElement

(**
   Creates an &lt;input type='button'&gt; element.
   
   @return the newly created element
*)
val createButtonInputElement : document -> inputElement

(**
   Creates a &lt;caption&gt; element.
   
   @return the newly created element
*)
val createCaptionElement : document -> tableCaptionElement

(**
   Creates a 'change' event.
*)
val createChangeEvent : document -> nativeEvent

(**
   Creates an &lt;input type='checkbox'&gt; element.
   
   @return the newly created element
*)
val createCheckInputElement : document -> inputElement

(**
   Creates a 'click' event.
   
   Note that this method does not allow the event's 'button' field to be
   specified, because not all browsers support it reliably for click events.
   
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @return the event object
*)
val createClickEvent : document -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> nativeEvent

(**
   Creates a &lt;col&gt; element.
   
   @return the newly created element
*)
val createColElement : document -> tableColElement

(**
   Creates a &lt;colgroup&gt; element.
   
   @return the newly created element
*)
val createColGroupElement : document -> tableColElement

(**
   Creates a 'contextmenu' event.
   
   Note: Contextmenu events will not dispatch properly on Firefox 2 and
   earlier.
   
   @return the event object
*)
val createContextMenuEvent : document -> nativeEvent

(**
   Creates a 'dblclick' event.
   
   Note that this method does not allow the event's 'button' field to be
   specified, because not all browsers support it reliably for click events.
   
   Note that on some browsers, this may cause 'click' events to be synthesized
   as well.
   
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @return the event object
*)
val createDblClickEvent : document -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> nativeEvent

(**
   Creates a &lt;del&gt; element.
   
   @return the newly created element
*)
val createDelElement : document -> modElement

(**
  Creates a &lt;div&gt; element.
  
  @return the newly created element
*)
val createDivElement : document -> divElement

(**
  Creates a &lt;dl&gt; element.
  
  @return the newly created element
*)
val createDLElement : document -> dListElement

(**
   Creates a new element.
   
   @param tagName the tag name of the element to be created
   @return the newly created element
*)
val createElement : document -> string -> #element

(**
   Creates an 'error' event.
   
   @return the event object
*)
val createErrorEvent : document -> nativeEvent

(**
   Creates a &lt;fieldset&gt; element.
   
   @return the newly created element
*)
val createFieldSetElement : document -> fieldSetElement

(**
   Creates an &lt;input type='file'&gt; element.
   
   @return the newly created element
*)
val createFileInputElement : document -> inputElement

(**
   Creates a 'focus' event.
   
   @return the event object
*)
val createFocusEvent : document -> nativeEvent

(**
   Creates a &lt;form&gt; element.
   
   @return the newly created element
*)
val createFormElement : document -> formElement

(**
   Creates a &lt;frame&gt; element.
   
   @return the newly created element
*)
val createFrameElement : document -> frameElement

(**
   Creates a &lt;frameset&gt; element.
   
   @return the newly created element
*)
val createFrameSetElement : document -> frameSetElement

(**
   Creates a &lt;head&gt; element.
   
   @return the newly created element
*)
val createHeadElement : document -> headElement

(**
   Creates an &lt;h(n)&gt; element.
   
   @param n the type of heading, from 1 to 6 inclusive
   @return the newly created element
*)
val createHElement : document -> int -> headingElement

(**
   Creates an &lt;input type='hidden'&gt; element.
   
   @return the newly created element
*)
val createHiddenInputElement : document -> inputElement

(**
   Creates an &lt;hr&gt; element.
   
   @return the newly created element
*)
val createHRElement : document -> hRElement

(**
   Creates an event.
   
   While this method may be used to create events directly, it is generally
   preferable to use existing helper methods such as
   {!createFocusEvent()}.
   
   Also, note that on Internet Explorer the 'canBubble' and 'cancelable'
   arguments will be ignored (the event's behavior is inferred by the browser
   based upon its type).
   
   @param type the type of event (e.g., "focus", "load", etc)
   @param canBubble <code>true</code> if the event should bubble
   @param cancelable <code>true</code> if the event should be cancelable
   @return the event object
*)
val createHtmlEvent : document -> string -> bool -> bool -> nativeEvent

(**
   Creates an &lt;iframe&gt; element.
   
   @return the newly created element
*)
val createIFrameElement : document -> iFrameElement

(**
   Creates an &lt;img&gt; element.
   
   @return the newly created element
*)
val createImageElement : document -> imageElement

(**
   Creates an &lt;input type='image'&gt; element.
   
   @return the newly created element
*)
val createImageInputElement : document -> inputElement

(**
   Creates an &lt;ins&gt; element.
   
   @return the newly created element
*)
val createInsElement : document -> modElement

(**
   Creates a 'keydown' event.
   
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param keyCode the key-code to be set on the event
   @param charCode the char-code to be set on the event
   @return the event object
*)
val createKeyDownEvent : document -> bool -> bool -> bool -> bool -> int -> int -> nativeEvent

(**
   Creates a key event.
   
   While this method may be used to create events directly, it is generally
   preferable to use existing helper methods such as
   {!createKeyPressEvent(boolean, boolean, boolean, boolean, int, int)}
   .
   
   Also, note that on Internet Explorer the 'canBubble' and 'cancelable'
   arguments will be ignored (the event's behavior is inferred by the browser
   based upon its type).
   
   @param type the type of event (e.g., "focus", "load", etc)
   @param canBubble <code>true</code> if the event should bubble
   @param cancelable <code>true</code> if the event should be cancelable
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param keyCode the key-code to be set on the event
   @param charCode the char-code to be set on the event
   @return the event object
*)
val createKeyEvent : document -> string -> bool -> bool -> bool -> bool -> bool -> bool -> int -> int -> nativeEvent

(**
   Creates a 'keypress' event.
   
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param keyCode the key-code to be set on the event
   @param charCode the char-code to be set on the event
   @return the event object
*)
val createKeyPressEvent : document -> bool -> bool -> bool -> bool -> int -> int -> nativeEvent

(**
   Creates a 'keyup' event.
   
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param keyCode the key-code to be set on the event
   @param charCode the char-code to be set on the event
   @return the event object
*)
val createKeyUpEvent : document -> bool -> bool -> bool -> bool -> int -> int -> nativeEvent

(**
   Creates a &lt;label&gt; element.
   
   @return the newly created element
*)
val createLabelElement : document -> labelElement

(**
   Creates a &lt;legend&gt; element.
   
   @return the newly created element
*)
val createLegendElement : document -> legendElement

(**
   Creates a &lt;li&gt; element.
   
   @return the newly created element
*)
val createLIElement : document -> lIElement

(**
   Creates a &lt;link&gt; element.
   
   @return the newly created element
*)
val createLinkElement : document -> linkElement

(**
   Creates a 'load' event.
   
   @return the event object
*)
val createLoadEvent : document -> nativeEvent

(**
   Creates a &lt;map&gt; element.
   
   @return the newly created element
*)
val createMapElement : document -> mapElement

(**
   Creates a &lt;meta&gt; element.
   
   @return the newly created element
*)
val createMetaElement : document -> metaElement

(**
   Creates a 'mousedown' event.
   
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param button the event's button property (values from
            {@link NativeEvent#BUTTON_LEFT} et al)
   @return the event object
*)
val createMouseDownEvent : document -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> nativeEvent

(**
   Creates an mouse event.
   
   While this method may be used to create events directly, it is generally
   preferable to use existing helper methods such as
   {!createClickEvent(int, int, int, int, int, boolean, boolean, boolean, boolean)}
   .
   
   Also, note that on Internet Explorer the 'canBubble' and 'cancelable'
   arguments will be ignored (the event's behavior is inferred by the browser
   based upon its type).
   
   @param type the type of event (e.g., "focus", "load", etc)
   @param canBubble <code>true</code> if the event should bubble
   @param cancelable <code>true</code> if the event should be cancelable
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param button the event's button property (values from
            {!NativeEvent#BUTTON_LEFT} et al)
   @param relatedTarget the event's related target (only relevant for
            mouseover and mouseout events)
   @return the event object
*)
val createMouseEvent :
  document -> string ->
  bool -> bool -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> #element ->
  nativeEvent

(**
   Creates a 'mousemove' event.
   
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param button the event's button property (values from
            {!NativeEvent#BUTTON_LEFT} et al)
   @return the event object
*)
val createMouseMoveEvent : document -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> nativeEvent

(**
   Creates a 'mouseout' event.
   
   Note: The 'relatedTarget' parameter will be ignored on Firefox 2 and
   earlier.
   
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param button the event's button property (values from
            {@!NativeEvent#BUTTON_LEFT} et al)
   @param relatedTarget the event's related target
   @return the event object
*)
val createMouseOutEvent : document -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> #element -> nativeEvent

(**
   Creates a 'mouseover' event.
   
   Note: The 'relatedTarget' parameter will be ignored on Firefox 2 and
   earlier.
   
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param button the event's button property (values from
            {@!NativeEvent#BUTTON_LEFT} et al)
   @param relatedTarget the event's related target
   @return the event object
*)
val createMouseOverEvent : document -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> #element -> nativeEvent

(**
   Creates a 'mouseup event.
   
   @param detail the event's detail property
   @param screenX the event's screen-relative x-position
   @param screenY the event's screen-relative y-position
   @param clientX the event's client-relative x-position
   @param clientY the event's client-relative y-position
   @param ctrlKey <code>true</code> if the ctrl key is depressed
   @param altKey <code>true</code> if the alt key is depressed
   @param shiftKey <code>true</code> if the shift key is depressed
   @param metaKey <code>true</code> if the meta key is depressed
   @param button the event's button property (values from
            {!NativeEvent#BUTTON_LEFT} et al)
   @return the event object
*)
val createMouseUpEvent : document -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> nativeEvent

(**
   Creates a &lt;object&gt; element.
   
   @return the newly created element
*)
val createObjectElement : document -> objectElement

(**
   Creates a &lt;ol&gt; element.
   
   @return the newly created element
*)
val createOLElement : document -> oListElement

(**
   Creates a &lt;optgroup&gt; element.
   
   @return the newly created element
*)
val createOptGroupElement : document -> optGroupElement

(**
   Creates a &lt;option&gt; element.
   
   @return the newly created element
*)
val createOptionElement : document -> optionElement

(**
   Creates a &lt;param&gt; element.
   
   @return the newly created element
*)
val createParamElement : document -> paramElement

(**
   Creates an &lt;input type='password'&gt; element.
   
   @return the newly created element
*)
val createPasswordInputElement : document -> inputElement

(**
   Creates a &lt;p&gt; element.
   
   @return the newly created element
*)
val createPElement : document -> paragraphElement

(**
   Creates a &lt;pre&gt; element.
   
   @return the newly created element
*)
val createPreElement : document -> preElement

(**
   Creates a &lt;button type='button'&gt; element.
   
   @return the newly created element
*)
val createPushButtonElement : document -> buttonElement

(**
   Creates a &lt;q&gt; element.
   
   @return the newly created element
*)
val createQElement : document -> quoteElement

(**
   Creates an &lt;input type='radio'&gt; element.
   
   @param name the name of the radio input (used for grouping)
   @return the newly created element
*)
val createRadioInputElement : document -> string -> inputElement

(**
   Creates a &lt;button type='reset'&gt; element.
   
   @return the newly created element
*)
val createResetButtonElement : document -> buttonElement

(**
   Creates an &lt;input type='reset'&gt; element.
   
   @return the newly created element
*)
val createResetInputElement : document -> inputElement

(**
   Creates a &lt;script&gt; element.
   
   @param source the source code to set inside the element
   @return the newly created element
*)
val createScriptElement : ?source:string -> document -> scriptElement

(**
   Creates a 'scroll' event.
   
   Note: Contextmenu events will not dispatch properly on Firefox 2 and
   earlier.
   
   @return the event object
*)
val createScrollEvent : document -> nativeEvent

(**
   Creates a &lt;select&gt; element.
   
   @param multiple <code>true</code> to allow multiple-selection
   @return the newly created element
*)
val createSelectElement : ?multiple:bool -> document -> selectElement

(**
   Creates a &lt;span&gt; element.
   
   @return the newly created element
*)
val createSpanElement : document -> spanElement

(**
   Creates a &lt;style&gt; element.
   
   @return the newly created element
*)
val createStyleElement : document -> styleElement

(**
   Creates a &lt;button type='submit'&gt; element.
   
   @return the newly created element
*)
val createSubmitButtonElement : document -> buttonElement

(**
   Creates an &lt;input type='submit'&gt; element.
   
   @return the newly created element
*)
val createSubmitInputElement : document -> inputElement

(**
   Creates a &lt;table&gt; element.
   
   @return the newly created element
*)
val createTableElement : document -> tableElement

(**
   Creates a &lt;tbody&gt; element.
   
   @return the newly created element
*)
val createTBodyElement : document -> tableSectionElement

(**
   Creates a &lt;td&gt; element.
   
   @return the newly created element
*)
val createTDElement : document -> tableCellElement

(**
   Creates a &lt;textarea&gt; element.
   
   @return the newly created element
*)
val createTextAreaElement : document -> textAreaElement

(**
   Creates an &lt;input type='text'&gt; element.
   
   @return the newly created element
*)
val createTextInputElement : document -> inputElement

(**
   Creates a text node.
   
   @param data the text node's initial text
   @return the newly created element
*)
val createTextNode : document -> string -> text

(**
   Creates a &lt;tfoot&gt; element.
   
   @return the newly created element
*)
val createTFootElement : document -> tableSectionElement

(**
   Creates a &lt;thead&gt; element.
   
   @return the newly created element
*)
val createTHeadElement : document -> tableSectionElement

(**
   Creates a &lt;th&gt; element.
   
   @return the newly created element
*)
val createTHElement : document -> tableCellElement

(**
   Creates a &lt;title&gt; element.
   
   @return the newly created element
*)
val createTitleElement : document -> titleElement

(**
   Creates a &lt;tr&gt; element.
   
   @return the newly created element
*)
val createTRElement : document -> tableRowElement

(**
   Creates a &lt;ul&gt; element.
   
   @return the newly created element
*)
val createULElement : document -> uListElement

(**
   Creates an identifier guaranteed to be unique within this document.
   
   This is useful for allocating element id's.
   
   @return a unique identifier
*)
val createUniqueId : document -> string

(**
   Enables or disables scrolling of the document.
   
   @param enable whether scrolling should be enabled or disabled
*)
val enableScrolling : document -> bool -> unit

(**
   The element that contains the content for the document. In documents with
   BODY contents, returns the BODY element.
   
   @return the document's body
*)
val getBody : document -> bodyElement

(**
   Returns the left offset between the absolute coordinate system and the
   body's positioning context. This method is useful for positioning children
   of the body element in absolute coordinates.
   
   For example, to position an element directly under the mouse cursor
   (assuming you are handling a mouse event), do the following:
   
   {[
   Event event;
   Document doc;
   DivElement child;  // assume absolutely-positioned child of the body
   
   // Get the event location in absolute coordinates.
   int absX = event.getClientX() + Window.getScrollLeft();
   int absY = event.getClientY() + Window.getScrollTop();
   
   // Position the child element, adjusting for the difference between the
   // absolute coordinate system and the body's positioning coordinates.
   child.getStyle().setPropertyPx("left", absX - doc.getBodyOffsetLeft());
   child.getStyle().setPropertyPx("top", absY - doc.getBodyOffsetTop());
   ]}
   
   @return the left offset of the body's positioning coordinate system
*)
val getBodyOffsetLeft : document -> int

(**
   Returns the top offset between the absolute coordinate system and the
   body's positioning context. This method is useful for positioning children
   of the body element in absolute coordinates.
   
   @return the top offset of the body's positioning coordinate system
   @see #getBodyOffsetLeft()
*)
val getBodyOffsetTop : document -> int

(**
   The height of the document's client area.
   
   @return the document's client height
*)
val getClientHeight : document -> int

(**
   The width of the document's client area.
   
   @return the document's client width
*)
val getClientWidth : document -> int

(**
   Gets the document's "compatibility mode", typically used for determining
   whether the document is in "quirks" or "strict" mode.
   
   @return one of "BackCompat" or "CSS1Compat"
*)
val getCompatMode : document -> string

(**
   Gets the document's element. This is typically the &lt;html&gt; element.
   
   @return the document element
*)
val getDocumentElement : document -> #element

(**
   The domain name of the server that served the document, or null if the
   server cannot be identified by a domain name.
   
   @return the document's domain, or <code>null</code> if none exists
*)
val getDomain : document -> string

(**
   Returns the {!Element} whose id is given by elementId. If no such
   element exists, returns null. Behavior is not defined if more than one
   element has this id.
   
   @param elementId the unique id value for an element
   @return the matching element
*)
val getElementById : document -> string -> #element

(**
   Returns a {!NodeList} of all the {!Element Elements} with a given
   tag name in the order in which they are encountered in a preorder traversal
   of the document tree.
   
   @param tagName the name of the tag to match on (the special value
            <code>"*"</code> matches all tags)
   @return a list containing all the matched elements
*)
val getElementsByTagName : document -> string -> #element array

(**
   Returns the URI of the page that linked to this page. The value is an empty
   string if the user navigated to the page directly (not through a link, but,
   for example, via a bookmark).
   
   @return the referrer URI
*)
val getReferrer : document -> string

(**
   The height of the scrollable area of the document.
   
   @return the height of the document's scrollable area
*)
val getScrollHeight : document -> int

(**
   The number of pixels that the document's content is scrolled from the left.
   
   If the document is in RTL mode, this method will return a negative value of
   the number of pixels scrolled from the right.
   
   @return the document's left scroll position
*)
val getScrollLeft : document -> int

(**
   The number of pixels that the document's content is scrolled from the top.
   
   @return the document's top scroll position
*)
val getScrollTop : document -> int

(**
   The width of the scrollable area of the document.
   
   @return the width of the document's scrollable area
*)
val getScrollWidth : document -> int

(**
   Gets the title of a document as specified by the TITLE element in the head
   of the document.
   
   @return the document's title
*)
val getTitle : document -> string

(**
   Gets the absolute URI of this document.
   
   @return the document URI
*)
val getURL : document -> string

(**
   Imports a node from another document to this document.
   
   The returned node has no parent; ({@link Node#getParentNode()} is null).
   The source node is not altered or removed from the original document; this
   method creates a new copy of the source node.
   
   For all nodes, importing a node creates a node object owned by the
   importing document, with attribute values identical to the source node's
   nodeName and nodeType, plus the attributes related to namespaces (prefix,
   localName, and namespaceURI). As in the cloneNode operation on a Node, the
   source node is not altered. Additional information is copied as appropriate
   to the nodeType, attempting to mirror the behavior expected if a fragment
   of XML or HTML source was copied from one document to another, recognizing
   that the two documents may have different DTDs in the XML case.
   
   @param node the node to import
   @param deep If <code>true</code>, recursively import the subtree under the
            specified node; if <code>false</code>, import only the node
            itself, as explained above
*)
val importNode : document -> #node -> bool -> unit

(**
   Determines whether the document's "compatMode" is "CSS1Compat". This is
   normally described as "strict" mode.
   
   @return <code>true</code> if the document is in CSS1Compat mode
*)
val isCSS1Compat : document -> bool

(**
   Sets the number of pixels that the document's content is scrolled from the
   left.
   
   @param left the document's left scroll position
*)
val setScrollLeft : document -> int -> unit

(**
   Sets the number of pixels that the document's content is scrolled from the
   top.
   
   @param top the document's top scroll position
*)
val setScrollTop : document -> int -> unit

(**
   Sets the title of a document as specified by the TITLE element in the head
   of the document.
   
   @param title the document's new title
*)
val setTitle : document -> string -> unit

(**
   Gets the document's viewport element. This is the element that should be
   used to for scrolling and client-area measurement. In quirks-mode it is the
   &lt;body&gt; element, while in standards-mode it is the &lt;html&gt;
   element.
   
   This is package-protected because the viewport is
   
   @return the document's viewport element
*)
val getViewportElement : document -> element
