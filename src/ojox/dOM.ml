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

open Ocamljs.Inline
open DOMTypes

(* The current event being fired *)
let currentEvent = ref << null >>

let sCaptureElem = ref << null >>

let appendChild parent child = ignore (Node.appendChild parent child)
let clone = Node.cloneNode

let createAnchor () = (Document.createAnchorElement (Document.get ()) :> element)
let createButton () = (Document.createButtonElement (Document.get ()) :> element)
let createCaption () = Document.createCaptionElement (Document.get ())
let createCol () = Document.createColElement (Document.get ())
let createColGroup () = Document.createColGroupElement (Document.get ())
let createDiv () = Document.createDivElement (Document.get ())
let createElement tagName = Document.createElement (Document.get ()) tagName
let createFieldSet () = Document.createFieldSetElement (Document.get ())
let createForm () = Document.createFormElement (Document.get ())
let createIFrame () = Document.createIFrameElement (Document.get ())
let createImg () = (Document.createImageElement (Document.get ()) :> element)
let createInputCheck () = (Document.createCheckInputElement (Document.get ()) :> element)
let createInputPassword () = (Document.createPasswordInputElement (Document.get ()) :> element)
let createInputRadio name = (Document.createRadioInputElement (Document.get ()) name :> element)
let createInputText () = (Document.createTextInputElement (Document.get ()) :> element)
let createLabel () = Document.createLabelElement (Document.get ())
let createLegend () = Document.createLegendElement (Document.get ())
let createOption () = (Document.createOptionElement (Document.get ()) :> element)
let createSelect ?multiple () = (Document.createSelectElement ?multiple (Document.get ()) :> element)
let createSpan () = Document.createSpanElement (Document.get ())
let createTable () = Document.createTableElement (Document.get ())
let createTBody () = Document.createTBodyElement (Document.get ())
let createTD () = Document.createTDElement (Document.get ())
let createTextArea () = Document.createTextAreaElement (Document.get ())
let createTFoot () = Document.createTFootElement (Document.get ())
let createTH () = Document.createTHElement (Document.get ())
let createTHead () = Document.createTHeadElement (Document.get ())
let createTR () = Document.createTRElement (Document.get ())
let createUniqueId () = Document.createUniqueId (Document.get ())

let eventCancelBubble = DOMImpl_.eventCancelBubble
let eventGetAltKey = NativeEvent.getAltKey
let eventGetButton = NativeEvent.getButton
let eventGetClientX = NativeEvent.getClientX
let eventGetClientY = NativeEvent.getClientY
let eventGetCtrlKey = NativeEvent.getCtrlKey
let eventGetCurrentEvent () = !currentEvent
let eventGetCurrentTarget event = JavaScriptObject.cast (NativeEvent.getCurrentEventTarget event)
let eventGetFromElement = DOMImpl_.eventGetFromElement
let eventGetKeyCode = NativeEvent.getKeyCode
let eventGetMetaKey = NativeEvent.getMetaKey
let eventGetMouseWheelVelocityY = NativeEvent.getMouseWheelVelocityY
let eventGetScreenX = NativeEvent.getScreenX
let eventGetScreenY = NativeEvent.getScreenY
let eventGetShiftKey = NativeEvent.getShiftKey
let eventGetTarget event = JavaScriptObject.cast (NativeEvent.getEventTarget event)
let eventGetToElement = DOMImpl_.eventGetToElement
let eventGetType = DOMImpl_.eventGetTypeInt
let eventGetTypeString = NativeEvent.getType
let eventPreventDefault = NativeEvent.preventDefault
let eventToString = NativeEvent.getString
let getAbsoluteLeft = Element.getAbsoluteLeft
let getAbsoluteTop = Element.getAbsoluteTop
let getCaptureElement () = !sCaptureElem
let getChild = DOMImpl_.getChild
let getChildCount = DOMImpl_.getChildCount
let getChildIndex = DOMImpl_.getChildIndex
let getElementAttribute = Element.getAttribute
let getElementById id = Document.getElementById (Document.get ()) id
let getElementProperty = Element.getPropertyString
let getElementPropertyBoolean = Element.getPropertyBoolean
let getElementPropertyInt = Element.getPropertyInt
let getEventListener = DOMImpl_.getEventListener
let getEventsSunk = DOMImpl_.getEventsSunk
let getFirstChild = Element.getFirstChildElement
let getImgSrc img = ImageElement.getSrc (JavaScriptObject.cast img)
let getInnerHTML = Element.getInnerHTML
let getInnerText = Element.getInnerText

let getIntStyleAttribute elem attr = << parseInt($elem$.style[$attr$]) || 0 >>

let getNextSibling elem = JavaScriptObject.cast (Node.getNextSibling elem)
let getParent elem = JavaScriptObject.cast (Node.getParentElement elem)
let getStyleAttribute elem attr = Style.getProperty (Element.getStyle elem) attr
let insertBefore parent child before = ignore (Node.insertBefore parent ~refChild:before child)
let insertChild = DOMImpl_.insertChild

let insertListItem selectElem item value index =
  let select = JavaScriptObject.cast selectElem in
  let option = Document.createOptionElement (Document.get ()) in
  OptionElement.setText option item;
  OptionElement.setValue option value;

  if index = -1 || index = SelectElement.getLength select
  then SelectElement.add select option
  else
    let before = (SelectElement.getOptions select).(index) in
    SelectElement.add select ~before option

let isOrHasChild = Node.isOrHasChild

let releaseCapture elem =
  if not (Ocamljs.is_null !sCaptureElem) && elem = !sCaptureElem
  then sCaptureElem := << null >>;
  DOMImpl_.releaseCapture elem

let removeChild parent child = ignore (Node.removeChild parent child)
let removeElementAttribute = Element.removeAttribute
let scrollIntoView = Element.scrollIntoView

let setCapture elem =
  sCaptureElem := elem;
  DOMImpl_.setCapture elem

let setElementAttribute = Element.setAttribute
let setElementProperty = Element.setPropertyString
let setElementPropertyBoolean = Element.setPropertyBoolean
let setElementPropertyInt = Element.setPropertyInt
let setEventListener = DOMImpl_.setEventListener

let setImgSrc img src = ImageElement.setSrc (JavaScriptObject.cast img) src

let setInnerHTML = Element.setInnerHTML
let setInnerText = Element.setInnerText

let setIntStyleAttribute elem attr value =
  Style.setProperty (Element.getStyle elem) attr (string_of_int value)

let setOptionText select text index =
  OptionElement.setText (SelectElement.getOptions (JavaScriptObject.cast select)).(index) text

let setStyleAttribute elem attr value =
  Style.setProperty (Element.getStyle elem) attr value

let sinkEvents = DOMImpl_.sinkEvents
let toString = Element.getString

let dispatchEventImpl evt elem listener =
  (* If this element has capture... *)
  if elem = !sCaptureElem 
  then
    (* ... and it's losing capture, clear sCaptureElem. *)
    if eventGetType evt = Event.oNLOSECAPTURE
    then sCaptureElem := << null >>;

  (* Pass the event to the listener. *)
  listener evt

let dispatchEvent evt elem listener =
  (* Preserve the current event in case we are in a reentrant event dispatch. *)
  let prevCurrentEvent = !currentEvent in
  currentEvent := evt;
  dispatchEventImpl evt elem listener;
  currentEvent := prevCurrentEvent

let _ = DOMImpl_.domDispatchEvent := dispatchEvent

let maybeInitializeEventSystem = DOMImpl_.maybeInitializeEventSystem

let previewEvent evt =
  (* Fire a NativePreviewEvent to NativePreviewHandlers *)
  let ret = NativePreviewEvent.fireNativePreviewEvent evt in

  (* If the preview cancels the event, stop it from bubbling and performing
     its default action. Check for a null evt to allow unit tests to run. *)
  if not ret && not (Ocamljs.is_null evt)
  then begin
    eventCancelBubble evt true;
    eventPreventDefault evt;
  end;

  ret

let _ = DOMImpl_.domPreviewEvent := previewEvent
