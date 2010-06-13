(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/shared/HandlerManager.java
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

type handlerRegistration = unit -> unit
type 'a handler = 'a -> unit

class handlerRegistry =
object (self)
  val map = Hashtbl.create 17

  method find : 'a. 'a OjoxEvent.tag -> 'a handler list = fun tag ->
    Hashtbl.find (Obj.magic map : (_ OjoxEvent.tag, (_ -> unit) list) Hashtbl.t) tag

  method replace : 'a. 'a OjoxEvent.tag -> 'a handler list -> unit = fun tag handlers ->
    Hashtbl.replace (Obj.magic map : (_ OjoxEvent.tag, (_ -> unit) list) Hashtbl.t) tag handlers

  method get : 'a. 'a OjoxEvent.tag -> 'a handler list = fun tag ->
    try self#find tag
    with Not_found -> []

  method addHandler : 'a. 'a OjoxEvent.tag -> 'a handler -> unit = fun tag handler ->
    let l = self#get tag in
    self#replace tag (handler::l)

  method fireEvent : 'a. (#OjoxEvent.c as 'a) -> bool -> unit = fun event isReverseOrder ->
    let tag = event#getAssociatedType in
    let l = (Obj.magic self#get tag : _ handler list) in
    let l = if isReverseOrder then l else List.rev l in
    List.iter (fun h -> h event) l

  method getHandler : 'a. 'a OjoxEvent.tag -> int -> 'a handler = fun tag n ->
    List.nth (self#get tag) n

  method getHandlerCount : 'a. 'a OjoxEvent.tag -> int = fun tag ->
    List.length (self#get tag)

  method isEventHandled : 'a. 'a OjoxEvent.tag -> bool = fun tag ->
    self#get tag <> []

  method removeHandler : 'a. 'a OjoxEvent.tag -> 'a handler -> unit = fun tag handler ->
    match self#get tag with
      | [] -> ()
      | l -> self#replace tag (List.filter (fun h -> not (h == handler)) l)
end

class c ?(isReverseOrder=false) source =
object
  val mutable firingDepth = 0
  val registry = new handlerRegistry
  val mutable deferredDeltas = []

  method addHandler : 'a. 'a OjoxEvent.tag -> 'a handler -> handlerRegistration = fun tag handler ->
    if firingDepth > 0
    then deferredDeltas <- (fun () -> registry#addHandler tag handler)::deferredDeltas
    else registry#addHandler tag handler;
    (fun () -> registry#removeHandler tag handler)

  method fireEvent : 'a. (#OjoxEvent.c as 'a) -> unit = fun event ->
    if not (event#isLive)
    then event#revive;

    let oldSource = try Some event#getSource with Not_found -> None in
    event#setSource source;

    let finally () =
      firingDepth <- firingDepth - 1;
      if firingDepth = 0
      then begin
        List.iter (fun d -> d ()) (List.rev deferredDeltas);
        deferredDeltas <- []
      end in
    begin try
      firingDepth <- firingDepth + 1;
      registry#fireEvent event isReverseOrder;
      finally ();
    with e ->
      finally ();
      raise e
    end;

    match oldSource with
      | None -> event#kill
      | Some s -> event#setSource s

  method getHandler : 'a. 'a OjoxEvent.tag -> int -> 'a handler = fun tag n ->
    registry#getHandler tag n

  method getHandlerCount : 'a. 'a OjoxEvent.tag -> int = fun tag ->
    registry#getHandlerCount tag

  method isEventHandled : 'a. 'a OjoxEvent.tag -> bool = fun tag ->
    registry#isEventHandled tag
end
