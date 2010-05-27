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

open Ocamljs.Inline
open DOMTypes

let get () = << $$doc >>

let createElement = DOMImpl.createElement

let createAnchorElement this = createElement this AnchorElement.tAG
let createAreaElement this = createElement this AreaElement.tAG
let createBaseElement this = createElement this BaseElement.tAG
let createBlockQuoteElement this = createElement this QuoteElement.tAG_BLOCKQUOTE
let createBRElement this = createElement this BRElement.tAG
let createButtonElement this = createElement this ButtonElement.tAG
let createButtonInputElement this = DOMImpl.createInputElement this "button"
let createCaptionElement this = createElement this TableCaptionElement.tAG
let createCheckInputElement this = DOMImpl.createInputElement this "checkbox"
let createColElement this = createElement this TableColElement.tAG_COL
let createColGroupElement this = createElement this TableColElement.tAG_COLGROUP
let createDelElement this = createElement this ModElement.tAG_DEL
let createDivElement this = createElement this DivElement.tAG
let createDLElement this = createElement this DListElement.tAG
let createFieldSetElement this = createElement this FieldSetElement.tAG
let createFileInputElement this = DOMImpl.createInputElement this "file"
let createFormElement this = createElement this FormElement.tAG
let createFrameElement this = createElement this FrameElement.tAG
let createFrameSetElement this = createElement this FrameSetElement.tAG
let createHeadElement this = createElement this HeadElement.tAG
let createIFrameElement this = createElement this IFrameElement.tAG
let createImageElement this = createElement this ImageElement.tAG
let createImageInputElement this = DOMImpl.createInputElement this "image"
let createInsElement this = createElement this ModElement.tAG_INS
let createLabelElement this = createElement this LabelElement.tAG
let createLegendElement this = createElement this LegendElement.tAG
let createLIElement this = createElement this LIElement.tAG
let createLinkElement this = createElement this LinkElement.tAG

let createHElement this n =
  assert (n >= 1 && n <= 6);
  createElement this ("h" ^ string_of_int n)

let createHiddenInputElement this = DOMImpl.createInputElement this "hidden"
let createHRElement this = createElement this HRElement.tAG
let createMapElement this = createElement this MapElement.tAG
let createMetaElement this = createElement this MetaElement.tAG
let createObjectElement this = createElement this ObjectElement.tAG
let createOLElement this = createElement this OListElement.tAG
let createOptGroupElement this = createElement this OptGroupElement.tAG
let createOptionElement this = createElement this OptionElement.tAG
let createParamElement this = createElement this ParamElement.tAG
let createPasswordInputElement this = DOMImpl.createInputElement this "password"
let createPElement this = createElement this ParagraphElement.tAG
let createPreElement this = createElement this PreElement.tAG
let createPushButtonElement this = DOMImpl.createButtonElement this "button"
let createQElement this = createElement this QuoteElement.tAG_Q
let createRadioInputElement this name = DOMImpl.createInputRadioElement this name
let createResetButtonElement this = DOMImpl.createButtonElement this "reset"
let createResetInputElement this = DOMImpl.createInputElement this "reset"

let createScriptElement ?source this =
  match source with
    | None -> createElement this ScriptElement.tAG
    | Some source -> DOMImpl.createScriptElement this source

let createSelectElement ?(multiple=false) this = DOMImpl.createSelectElement this multiple
let createSpanElement this = createElement this SpanElement.tAG
let createStyleElement this = createElement this StyleElement.tAG
let createSubmitButtonElement this = DOMImpl.createButtonElement this "submit"
let createSubmitInputElement this = DOMImpl.createInputElement this "submit"
let createTableElement this = createElement this TableElement.tAG
let createTBodyElement this = createElement this TableSectionElement.tAG_TBODY
let createTDElement this = createElement this TableCellElement.tAG_TD
let createTextAreaElement this = createElement this TextAreaElement.tAG
let createTextInputElement this = DOMImpl.createInputElement this "text"
let createTextNode this data = this#createTextNode data
let createTFootElement this = createElement this TableSectionElement.tAG_TFOOT
let createTHeadElement this = createElement this TableSectionElement.tAG_THEAD
let createTHElement this = createElement this TableCellElement.tAG_TH
let createTitleElement this = createElement this TitleElement.tAG
let createTRElement this = createElement this TableRowElement.tAG
let createULElement this = createElement this UListElement.tAG

let createHtmlEvent = DOMImpl.createHtmlEvent
let createMouseEvent = DOMImpl.createMouseEvent
let createKeyEvent = DOMImpl.createKeyEvent

let createBlurEvent this = createHtmlEvent this "blur" false false
let createChangeEvent this = createHtmlEvent this "change" false true

let createClickEvent this detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey =
  (* We disallow setting the button here, because IE doesn't provide the
     button property for click events. *)
  createMouseEvent
    this "click"
    true true detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey NativeEvent.bUTTON_LEFT << null >>

let createContextMenuEvent this = createHtmlEvent this "contextmenu" true true

let createDblClickEvent this detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey =
  (* We disallow setting the button here, because IE doesn't provide the
     button property for click events. *)
  createMouseEvent
    this "dblclick"
    true true detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey NativeEvent.bUTTON_LEFT << null >>

let createErrorEvent this = createHtmlEvent this "error" false false
let createFocusEvent this = createHtmlEvent this "focus" false false

let createKeyDownEvent this ctrlKey altKey shiftKey metaKey keyCode charCode =
  createKeyEvent this "keydown" true true ctrlKey altKey shiftKey metaKey keyCode charCode

let createKeyPressEvent this ctrlKey altKey shiftKey metaKey keyCode charCode =
  createKeyEvent this "keypress" true true ctrlKey altKey shiftKey metaKey keyCode charCode

let createKeyUpEvent this ctrlKey altKey shiftKey metaKey keyCode charCode =
  createKeyEvent this "keyup" true true ctrlKey altKey shiftKey metaKey keyCode charCode

let createLoadEvent this = createHtmlEvent this "load" false false

let createMouseDownEvent this detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button =
  createMouseEvent
    this "mousedown"
    true true detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button << null >>

let createMouseMoveEvent this detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button =
  createMouseEvent
    this "mousemove"
    true true detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button << null >>

let createMouseOutEvent this detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button relatedTarget =
  createMouseEvent
    this "mouseout"
    true true detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button relatedTarget

let createMouseOverEvent this detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button relatedTarget =
  createMouseEvent
    this "mouseover"
    true true detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button relatedTarget

let createMouseUpEvent this detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button =
  createMouseEvent
    this "mouseup"
    true true detail screenX screenY clientX clientY ctrlKey altKey shiftKey metaKey button << null >>

let createScrollEvent this = createHtmlEvent this "scroll" false false

let createUniqueId this = <:rstmt<
  // In order to force uid's to be document-unique across multiple modules,
  // we hang a counter from the document.
  if (!$this$.ojox_uid) {
    $this$.ojox_uid = 1;
  }

  return "ojox-uid-" + $this$.ojox_uid++;
>>

let getCompatMode this = this#_get_compatMode

let isCSS1Compat this = getCompatMode this = "CSS1Compat"

let getDocumentElement (this : document) = this#_get_documentElement

let getBody this = this#_get_body

let getViewportElement this =
  if isCSS1Compat this
  then getDocumentElement this
  else getBody this

let enableScrolling this enable =
  Style.setProperty (Element.getStyle (getViewportElement this)) "overflow"
    (if enable then "auto" else "hidden")

let getBodyOffsetLeft = DOMImpl.getBodyOffsetLeft
let getBodyOffsetTop = DOMImpl.getBodyOffsetTop

let getClientHeight this = Element.getClientHeight (getViewportElement this)
let getClientWidth this = Element.getClientWidth (getViewportElement this)

let getDomain this = this#_get_domain

let getElementById (this : document) elementId = this#getElementById elementId
let getElementsByTagName (this : document) tagName = this#getElementsByTagName tagName

let getReferrer this = this#_get_referrer

let getScrollHeight this = Element.getScrollHeight (getViewportElement this)

let getScrollLeft = DOMImpl.getScrollLeft_document
let getScrollTop = DOMImpl.getScrollTop

let getScrollWidth this = Element.getScrollWidth (getViewportElement this)

let getTitle this = this#_get_title
let getURL this = this#_get_URL

let importNode (this : document) node deep = this#importNode node deep

let setScrollLeft = DOMImpl.setScrollLeft_document
let setScrollTop = DOMImpl.setScrollTop

let setTitle this title = this#_set_title title
