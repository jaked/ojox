(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/Node.java
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

let eLEMENT_NODE = 1
let tEXT_NODE = 3
let dOCUMENT_NODE = 9

let is o = << (!!$o$) && (!!$o$.nodeType) >>

let as_ o =
  assert (is o);
  (Obj.magic o : DOMTypes.node)

let appendChild (this : #node) newChild = this#appendChild newChild

let cloneNode (this : #node) deep = this#cloneNode deep

let getChildNodes (this : #node) = this#_get_childNodes

let getChildCount this = Array.length (getChildNodes this)

let getChild (this : #node) index =
  if index < 0 || index < getChildCount this
  then failwith "Child index out of bounds";
  (getChildNodes this).(index)

let getFirstChild (this : #node) = this#_get_firstChild

let getLastChild (this : #node) = this#_get_lastChild

let getNextSibling (this : #node) = this#_get_nextSibling

let getNodeName this = this#_get_nodeName

let getNodeType this = this#_get_nodeType

let getNodeValue this = this#_get_nodeValue

let getOwnerDocument (this : #node) = this#_get_ownerDocument

let getParentElement this = DOMImpl.getParentElement this

let getParentNode (this : #node) = this#_get_parentNode

let getPreviousSibling (this : #node) = this#_get_previousSibling

let hasChildNodes this = this#hasChildNodes

let hasParentElement this = Ocamljs.is_null (getParentElement this)

let insertBefore (this : #node) ?refChild newChild =
  let refChild = match refChild with None -> << null >> | Some rc -> rc in
  this#insertBefore newChild refChild

let insertAfter this ?refChild newChild =
  let next = match refChild with None -> << null >> | Some rc -> getNextSibling rc in
  if Ocamljs.is_null next
  then appendChild this newChild
  else insertBefore this ~refChild:next newChild

let insertFirst this child =
  let refChild = Ocamljs.option_of_nullable (getFirstChild this) in
  insertBefore this ?refChild child

let isOrHasChild this child = DOMImpl.isOrHasChild this child

let removeChild (this : #node) oldChild = this#removeChild oldChild

let removeFromParent this =
  let parent = getParentElement this in
  if not (Ocamljs.is_null parent)
  then ignore(removeChild parent this)

let replaceChild (this : #node) newChild oldChild = this#replaceChild newChild oldChild

let setNodeValue this nodeValue = this#_set_nodeValue nodeValue
