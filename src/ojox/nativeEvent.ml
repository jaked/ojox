(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/NativeEvent.java
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

let bUTTON_LEFT = 1
let bUTTON_MIDDLE = 4
let bUTTON_RIGHT = 2

let getAltKey = DOMImpl.eventGetAltKey
let getButton = DOMImpl.eventGetButton
let getClientX = DOMImpl.eventGetClientX
let getClientY = DOMImpl.eventGetClientY
let getCtrlKey = DOMImpl.eventGetCtrlKey
let getCurrentEventTarget = DOMImpl.eventGetCurrentTarget
let getEventTarget = DOMImpl.eventGetTarget
let getKeyCode = DOMImpl.eventGetKeyCode
let getMetaKey = DOMImpl.eventGetMetaKey
let getMouseWheelVelocityY = DOMImpl.eventGetMouseWheelVelocityY
let getRelatedEventTarget = DOMImpl.eventGetRelatedTarget
let getScreenX = DOMImpl.eventGetScreenX
let getScreenY = DOMImpl.eventGetScreenY
let getShiftKey = DOMImpl.eventGetShiftKey
let getString = DOMImpl.eventToString
let getType = DOMImpl.eventGetType
let preventDefault = DOMImpl.eventPreventDefault
let stopPropagation = DOMImpl.eventStopPropagation
