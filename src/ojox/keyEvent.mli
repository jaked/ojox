(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/event/dom/client/KeyEvent.java
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

(**
   Base class for Key events. The native keyboard events are somewhat a mess
   (http://www.quirksmode.org/js/keys.html), we do some trivial normalization
   here, but do not attempt any complex patching, so user be warned.
   
   @param <H> The event handler type
 *)
class virtual c :
object
  inherit DomEvent.c

  (**
     Is the <code>alt</code> key down?
     
     @return whether the alt key is down
   *)
  method isAltKeyDown : bool

  (**
     Does this event have any modifier keys down? Specifically. is the control,
     meta, shift, or alt key currently pressed?
     
     @return whether this event have any modifier key down
   *)
  method isAnyModifierKeyDown : bool

  (**
     Is the <code>control</code> key down?
     
     @return whether the control key is down
   *)
  method isControlKeyDown : bool

  (**
     Is the <code>meta</code> key down?
     
     @return whether the meta key is down
   *)
  method isMetaKeyDown : bool

  (**
     Is the <code>shift</code> key down?
     
     @return whether the shift key is down
   *)
  method isShiftKeyDown : bool
end

