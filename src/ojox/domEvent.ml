(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/DomEvent.java
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

module PrivateMap =
struct
  type t
  let make () = (<< { } >> : t)
  let unsafeGet this key = << $this$[$key$] >>
  let unsafePut this key value = <:stmt< $this$[$key$] = $value$; >>
end

let registered = PrivateMap.make ()

class ['a] tag (eventName : string) (flyweight : 'a) =
object (self)
  inherit ['a] OjoxEvent.tag

  initializer PrivateMap.unsafePut registered eventName self

  method getName = eventName
  method private flyweight = flyweight
end

class virtual c =
object (self : 'self)
  inherit OjoxEvent.c

  val mutable nativeEvent = (<< null >> : nativeEvent)
  val mutable relativeElem = (<< null >> : element)

  method virtual getAssociatedType_dom : 'self tag

  method private nativeEvent = nativeEvent
  method private relativeElem = relativeElem

  method getNativeEvent =
    self#assertLive;
    nativeEvent

  method getRelativeElement =
    self#assertLive;
    relativeElem

  method preventDefault =
    self#assertLive;
    nativeEvent#preventDefault

  method setNativeEvent nativeEvent' = nativeEvent <- nativeEvent'

  method setRelativeElement relativeElem' = relativeElem <- relativeElem'

  method stopPropagation =
    self#assertLive;
    nativeEvent#stopPropagation
end

let fireNativeEvent nativeEvent ?relativeElem (handlerSource : < fireEvent : 'a. (#OjoxEvent.c as 'a) -> unit; .. >) =
  let typeKey = PrivateMap.unsafeGet registered (NativeEvent.getType nativeEvent) in
  if not (Ocamljs.is_null typeKey)
  then
    let relativeElem = Ocamljs.nullable_of_option relativeElem in
    let flyweight = (typeKey#flyweight : #c) in
    (* Store and restore native event just in case we are in recursive
       loop. *)
    let currentNative = flyweight#nativeEvent in
    let currentRelativeElem = flyweight#relativeElem in
    flyweight#setNativeEvent nativeEvent;
    flyweight#setRelativeElement relativeElem;

    handlerSource#fireEvent flyweight;

    flyweight#setNativeEvent currentNative;
    flyweight#setRelativeElement currentRelativeElem
