(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/user/client/DOM.java
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
open DOMTypes_

(**
   This class provides a set of static methods that allow you to manipulate the
   browser's Document Object Model (DOM). It contains methods for manipulating
   both {@link com.google.gwt.user.client.Element elements} and
   {@link com.google.gwt.user.client.Event events}.
*)

(**
   Appends one element to another's list of children.
   
   @param parent the parent element
   @param child its new child
*)
val appendChild : #element -> #element -> unit

(**
   Clones an element.
   
   @param elem the element to be cloned
   @param deep should children be cloned as well?
*)
val clone : (#element as 'a) -> bool -> 'a

(**
   Creates an HTML A element.
   
   @return the newly-created element
*)
val createAnchor : unit -> element

(**
   Creates an HTML BUTTON element.
   
   @return the newly-created element
*)
val createButton : unit -> element

(**
   Creates an HTML CAPTION element.
   
   @return the newly-created element
*)
val createCaption : unit -> element

(**
   Creates an HTML COL element.
   
   @return the newly-created element
*)
val createCol : unit -> element

(**
   Creates an HTML COLGROUP element.
   
   @return the newly-created element
*)
val createColGroup : unit -> element

(**
   Creates an HTML DIV element.
   
   @return the newly-created element
*)
val createDiv : unit -> element

(**
   Creates an HTML element.
   
   @return the newly-created element
*)
val createElement : string -> element

(**
   Creates an HTML FIELDSET element.
   
   @return the newly-created element
*)
val createFieldSet : unit -> element

(**
   Creates an HTML FORM element.
   
   @return the newly-created element
*)
val createForm : unit -> element

(**
   Creates an HTML IFRAME element.
   
   @return the newly-created element
*)
val createIFrame : unit -> element

(**
   Creates an HTML IMG element.
   
   @return the newly-created element
*)
val createImg : unit -> element

(**
   Creates an HTML INPUT type='CHECK' element.
   
   @return the newly-created element
*)
val createInputCheck : unit -> element

(**
   Creates an HTML INPUT type='PASSWORD' element.
   
   @return the newly-created element
*)
val createInputPassword : unit -> element

(**
   Creates an HTML INPUT type='RADIO' element.
   
   @param name the name of the group with which this radio button will be
            associated
   @return the newly-created element
*)
val createInputRadio : string -> element

(**
   Creates an HTML INPUT type='TEXT' element.
   
   @return the newly-created element
*)
val createInputText : unit -> element

(**
   Creates an HTML LABEL element.
   
   @return the newly-created element
*)
val createLabel : unit -> element

(**
   Creates an HTML LEGEND element.
   
   @return the newly-created element
*)
val createLegend : unit -> element

(**
   Creates an HTML OPTION element.
   
   @return the newly-created element
*)
val createOption : unit -> element

(**
   Creates an HTML SELECT element.
   
   @return the newly-created element
*)
val createSelect : ?multiple:bool -> unit -> element

(**
   Creates an HTML SPAN element.
   
   @return the newly-created element
*)
val createSpan : unit -> element

(**
   Creates an HTML TABLE element.
   
   @return the newly-created element
*)
val createTable : unit -> element

(**
   Creates an HTML TBODY element.
   
   @return the newly-created element
*)
val createTBody : unit -> element

(**
   Creates an HTML TD element.
   
   @return the newly-created element
*)
val createTD : unit -> element

(**
   Creates an HTML TEXTAREA element.
   
   @return the newly-created element
*)
val createTextArea : unit -> element

(**
   Creates an HTML TFOOT element.
   
   @return the newly-created element
*)
val createTFoot : unit -> element

(**
   Creates an HTML TH element.
   
   @return the newly-created element
*)
val createTH : unit -> element

(**
   Creates an HTML THEAD element.
   
   @return the newly-created element
*)
val createTHead : unit -> element

(**
   Creates an HTML TR element.
   
   @return the newly-created element
*)
val createTR : unit -> element

(**
   Generates a unique DOM id. The id is of the form "ojox-id-<unique integer>".
   
   @return a unique DOM id
*)
val createUniqueId : unit -> string

(**
   Cancels bubbling for the given event. This will stop the event from being
   propagated to parent elements.
   
   @param evt the event on which to cancel bubbling
   @param cancel <code>true</code> to cancel bubbling
*)
val eventCancelBubble : event -> bool -> unit

(**
   Gets whether the ALT key was depressed when the given event occurred.
   
   @param evt the event to be tested
   @return <code>true</code> if ALT was depressed when the event occurred
*)
val eventGetAltKey : event -> bool

(**
   Gets the mouse buttons that were depressed when the given event occurred.
   
   @param evt the event to be tested
   @return a bit-field, defined by {@link Event#BUTTON_LEFT},
           {@link Event#BUTTON_MIDDLE}, and {@link Event#BUTTON_RIGHT}
*)
val eventGetButton : event -> int

(**
   Gets the mouse x-position within the browser window's client area.
   
   @param evt the event to be tested
   @return the mouse x-position
*)
val eventGetClientX : event -> int

(**
   Gets the mouse y-position within the browser window's client area.
   
   @param evt the event to be tested
   @return the mouse y-position
*)
val eventGetClientY : event -> int

(**
   Gets whether the CTRL key was depressed when the given event occurred.
   
   @param evt the event to be tested
   @return <code>true</code> if CTRL was depressed when the event occurred
*)
val eventGetCtrlKey : event -> bool

(**
   Gets the current event that is being fired. The current event is only
   available within the lifetime of the onBrowserEvent function. Once the
   onBrowserEvent method returns, the current event is reset to null.
   
   @return the current event
*)
val eventGetCurrentEvent : unit -> event

(**
   Gets the current target element of the given event. This is the element
   whose listener fired last, not the element which fired the event initially.
   
   @param evt the event
   @return the event's current target element
   @see DOM#eventGetTarget(Event)
*)
val eventGetCurrentTarget : event -> element

(**
   Gets the element from which the mouse pointer was moved (valid for
   {@link Event#ONMOUSEOVER} and {@link Event#ONMOUSEOUT}).
   
   @param evt the event to be tested
   @return the element from which the mouse pointer was moved
*)
val eventGetFromElement : event -> element

(**
   Gets the key code associated with this event.
   
   <p>
   For {@link Event#ONKEYPRESS}, this method returns the Unicode value of the
   character generated. For {@link Event#ONKEYDOWN} and {@link Event#ONKEYUP},
   it returns the code associated with the physical key.
   </p>
   
   @param evt the event to be tested
   @return the Unicode character or key code.
   @see com.google.gwt.user.client.ui.KeyboardListener
*)
val eventGetKeyCode : event -> int

(**
   Gets whether the META key was depressed when the given event occurred.
   
   @param evt the event to be tested
   @return <code>true</code> if META was depressed when the event occurred
*)
val eventGetMetaKey : event -> bool

(**
   Gets the velocity of the mouse wheel associated with the event along the Y
   axis.

   The velocity of the event is an artifical measurement for relative
   comparisons of wheel activity. It is affected by some non-browser factors,
   including choice of input hardware and mouse acceleration settings. The
   sign of the velocity measurement agrees with the screen coordinate system;
   negative values are towards the origin and positive values are away from
   the origin. Standard scrolling speed is approximately ten units per event.
   
   @param evt the event to be examined.
   @return The velocity of the mouse wheel.
*)
val eventGetMouseWheelVelocityY : event -> int

(**
   Gets the mouse x-position on the user's display.
   
   @param evt the event to be tested
   @return the mouse x-position
*)
val eventGetScreenX : event -> int

(**
   Gets the mouse y-position on the user's display.
   
   @param evt the event to be tested
   @return the mouse y-position
*)
val eventGetScreenY : event -> int

(**
   Gets whether the shift key was depressed when the given event occurred.
   
   @param evt the event to be tested
   @return <code>true</code> if shift was depressed when the event occurred
*)
val eventGetShiftKey : event -> bool

(**
   Returns the element that was the actual target of the given event.
   
   @param evt the event to be tested
   @return the target element
*)
val eventGetTarget : event -> element

(**
   Gets the element to which the mouse pointer was moved (only valid for
   {@link Event#ONMOUSEOUT} and {@link Event#ONMOUSEOVER}).
   
   @param evt the event to be tested
   @return the element to which the mouse pointer was moved
*)
val eventGetToElement : event -> element

(**
   Gets the enumerated type of this event (as defined in {@link Event}).
   
   @param evt the event to be tested
   @return the event's enumerated type
*)
val eventGetType : event -> int

(**
   Gets the type of the given event as a string.
   
   @param evt the event to be tested
   @return the event's type name
*)
val eventGetTypeString : event -> string

(**
   Prevents the browser from taking its default action for the given event.
   
   @param evt the event whose default action is to be prevented
*)
val eventPreventDefault : event -> unit

(**
   Returns a stringized version of the event. This string is for debugging
   purposes and will NOT be consistent on different browsers.
   
   @param evt the event to stringize
   @return a string form of the event
*)
val eventToString : event -> string

(**
   Gets an element's absolute left coordinate in the document's coordinate
   system.
   
   @param elem the element to be measured
   @return the element's absolute left coordinate
*)
val getAbsoluteLeft : element -> int

(**
   Gets an element's absolute top coordinate in the document's coordinate
   system.
   
   @param elem the element to be measured
   @return the element's absolute top coordinate
*)
val getAbsoluteTop : element -> int

(**
   Gets the element that currently has mouse capture.
   
   @return a handle to the capture element, or <code>null</code> if none
           exists
*)
val getCaptureElement : unit -> element

(**
   Gets an element's n-th child element.
   
   @param parent the element whose child is to be retrieved
   @param index the index of the child element
   @return the n-th child element
*)
val getChild : element -> int -> element

(**
   Gets the number of child elements present in a given parent element.
   
   @param parent the element whose children are to be counted
   @return the number of children
*)
val getChildCount : element -> int

(**
   Gets the index of a given child element within its parent.
   
   @param parent the parent element
   @param child the child element
   @return the child's index within its parent, or <code>-1</code> if it is
           not a child of the given parent
*)
val getChildIndex : element -> element -> int

(**
   Gets the named attribute from the element.
   
   @param elem the element whose property is to be retrieved
   @param attr the name of the attribute
   @return the value of the attribute
*)
val getElementAttribute : element -> string -> string

(**
   Gets the element associated with the given unique id within the entire
   document.
   
   @param id the id whose associated element is to be retrieved
   @return the associated element, or <code>null</code> if none is found
*)
val getElementById : string -> element

(**
   Gets any named property from an element, as a string.
   
   @param elem the element whose property is to be retrieved
   @param prop the name of the property
   @return the property's value
*)
val getElementProperty : element -> string -> string

(**
   Gets any named property from an element, as a boolean.
   
   @param elem the element whose property is to be retrieved
   @param prop the name of the property
   @return the property's value as a boolean
*)
val getElementPropertyBoolean : element -> string -> bool

(**
   Gets any named property from an element, as an int.
   
   @param elem the element whose property is to be retrieved
   @param prop the name of the property
   @return the property's value as an int
*)
val getElementPropertyInt : element -> string -> int

(**
   Gets the {@link EventListener} that will receive events for the given
   element. Only one such listener may exist for a single element.
   
   @param elem the element whose listener is to be set
   @return the element's event listener
*)
val getEventListener : element -> eventListener

(**
   Gets the current set of events sunk by a given element.
   
   @param elem the element whose events are to be retrieved
   @return a bitfield describing the events sunk on this element (its possible
           values are described in {@link Event})
*)
val getEventsSunk : element -> int

(**
   Gets the first child element of the given element.
   
   @param elem the element whose child is to be retrieved
   @return the child element
*)
val getFirstChild : element -> element

(**
   Gets the src attribute of an img element. This method is paired with
   {@link #setImgSrc(Element, String)} so that it always returns the correct
   url.
   
   @param img a non-null img whose src attribute is to be read.
   @return the src url of the img
*)
val getImgSrc : element -> string

(**
   Gets an HTML representation of an element's children.
   
   @param elem the element whose HTML is to be retrieved
   @return the HTML representation of the element's children
*)
val getInnerHTML : element -> string

(**
   Gets the text contained within an element. If the element has child
   elements, only the text between them will be retrieved.
   
   @param elem the element whose inner text is to be retrieved
   @return the text inside this element
*)
val getInnerText : element -> string

(**
   Gets an integer attribute on a given element's style.
   
   @param elem the element whose style attribute is to be retrieved
   @param attr the name of the attribute to be retrieved
   @return the style attribute's value as an integer
*)
val getIntStyleAttribute : element -> string -> int

(**
   Gets an element's next sibling element.
   
   @param elem the element whose sibling is to be retrieved
   @return the sibling element
*)
val getNextSibling : element -> element

(**
   Gets an element's parent element.
   
   @param elem the element whose parent is to be retrieved
   @return the parent element
*)
val getParent : element -> element

(**
   Gets an attribute of the given element's style.
   
   @param elem the element whose style attribute is to be retrieved
   @param attr the name of the style attribute to be retrieved
   @return the style attribute's value
*)
val getStyleAttribute : element -> string -> string

(**
   Inserts an element as a child of the given parent element, before another
   child of that parent.
   
   @param parent the parent element
   @param child the child element to add to <code>parent</code>
   @param before an existing child element of <code>parent</code> before which
            <code>child</code> will be inserted
*)
val insertBefore : element -> element -> element -> unit

(**
   Inserts an element as a child of the given parent element.
   
   @param parent the parent element
   @param child the child element to add to <code>parent</code>
   @param index the index before which the child will be inserted (any value
            greater than the number of existing children will cause the child
            to be appended)
*)
val insertChild : #element -> #element -> int -> unit

(**
   Creates an <code>&lt;option&gt;</code> element and inserts it as a child of
   the specified <code>&lt;select&gt;</code> element. If the index is less
   than zero, or greater than or equal to the length of the list, then the
   option element will be appended to the end of the list.
   
   @param selectElem the <code>&lt;select&gt;</code> element
   @param item the text of the new item; cannot be <code>null</code>
   @param value the <code>value</code> attribute for the new
            <code>&lt;option&gt;</code>; cannot be <code>null</code>
   @param index the index at which to insert the child
*)
val insertListItem : element -> string -> string -> int -> unit

(**
   Determine whether one element is equal to, or the child of, another.
   
   @param parent the potential parent element
   @param child the potential child element
   @return <code>true</code> if the relationship holds
*)
val isOrHasChild : element -> element -> bool

(**
   Releases mouse capture on the given element. Calling this method has no
   effect if the element does not currently have mouse capture.
   
   @param elem the element to release capture
   @see #setCapture(Element)
*)
val releaseCapture : element -> unit

(**
   Removes a child element from the given parent element.
   
   @param parent the parent element
   @param child the child element to be removed
*)
val removeChild : element -> element -> unit

(**
   Removes the named attribute from the given element.
   
   @param elem the element whose attribute is to be removed
   @param attr the name of the element to remove
*)
val removeElementAttribute : element -> string -> unit

(**
   Scrolls the given element into view.
   
   This method crawls up the DOM hierarchy, adjusting the scrollLeft and
   scrollTop properties of each scrollable element to ensure that the
   specified element is completely in view. It adjusts each scroll position by
   the minimum amount necessary.
   
   @param elem the element to be made visible
*)
val scrollIntoView : element -> unit

(**
   Sets mouse-capture on the given element. This element will directly receive
   all mouse events until {@link #releaseCapture(Element)} is called on it.
   
   @param elem the element on which to set mouse capture
*)
val setCapture : element -> unit

(**
   Sets an attribute on a given element.
   
   @param elem element whose attribute is to be set
   @param attr the name of the attribute
   @param value the value to which the attribute should be set
*)
val setElementAttribute : element -> string -> string -> unit

(**
   Sets a property on the given element.
   
   @param elem the element whose property is to be set
   @param prop the name of the property to be set
   @param value the new property value
*)
val setElementProperty : element -> string -> string -> unit

(**
   Sets a boolean property on the given element.
   
   @param elem the element whose property is to be set
   @param prop the name of the property to be set
   @param value the new property value as a boolean
*)
val setElementPropertyBoolean : element -> string -> bool -> unit

(**
   Sets an int property on the given element.
   
   @param elem the element whose property is to be set
   @param prop the name of the property to be set
   @param value the new property value as an int
*)
val setElementPropertyInt : element -> string -> int -> unit

(**
   Sets the {@link EventListener} to receive events for the given element.
   Only one such listener may exist for a single element.
   
   @param elem the element whose listener is to be set
   @param listener the listener to receive {@link Event events}
*)
val setEventListener : element -> eventListener -> unit

(**
   Sets the src attribute of an img element. This method ensures that imgs
   only ever have their contents requested one single time from the server.
   
   @param img a non-null img whose src attribute will be set.
   @param src a non-null url for the img
*)
val setImgSrc : element -> string -> unit

(**
   Sets the HTML contained within an element.
   
   @param elem the element whose inner HTML is to be set
   @param html the new html
*)
val setInnerHTML : element -> string -> unit

(**
   Sets the text contained within an element. If the element already has
   children, they will be destroyed.
   
   @param elem the element whose inner text is to be set
   @param text the new text
*)
val setInnerText : element -> string -> unit

(**
   Sets an integer attribute on the given element's style.
   
   @param elem the element whose style attribute is to be set
   @param attr the name of the style attribute to be set
   @param value the style attribute's new integer value
*)
val setIntStyleAttribute : element -> string -> int -> unit

(**
   Sets the option text of the given select object.
   
   @param select the select object whose option text is being set
   @param text the text to set
   @param index the index of the option whose text should be set
*)
val setOptionText : element -> string -> int -> unit

(**
   Sets an attribute on the given element's style.
   
   @param elem the element whose style attribute is to be set
   @param attr the name of the style attribute to be set
   @param value the style attribute's new value
*)
val setStyleAttribute : element -> string -> string -> unit

(**
   Sets the current set of events sunk by a given element. These events will
   be fired to the nearest {@link EventListener} specified on any of the
   element's parents.
   
   @param elem the element whose events are to be retrieved
   @param eventBits a bitfield describing the events sunk on this element (its
            possible values are described in {@link Event})
*)
val sinkEvents : element -> int -> unit

(**
   Returns a stringized version of the element. This string is for debugging
   purposes and will NOT be consistent on different browsers.
   
   @param elem the element to stringize
   @return a string form of the element
*)
val toString : element -> string

(**
   This method is called directly by native code when any event is fired.
   
   @param evt the handle to the event being fired.
   @param elem the handle to the element that received the event.
   @param listener the listener associated with the element that received the
            event.
*)
val dispatchEvent : event -> element -> eventListener -> unit

(**
   Initialize the event system if it has not already been initialized.
*)
val maybeInitializeEventSystem : unit -> unit

(**
   This method is called directly by native code when event preview is being
   used.
   
   @param evt a handle to the event being previewed
   @return <code>false</code> to cancel the event
*)
val previewEvent : event -> bool
