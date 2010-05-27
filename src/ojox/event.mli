(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/Event.java
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
   An opaque handle to a native DOM Event. An <code>Event</code> cannot be
   created directly. Instead, use the <code>Event</code> type when returning a
   native DOM event from JSNI methods. An <code>Event</code> passed back into
   JSNI becomes the original DOM event the <code>Event</code> was created from,
   and can be accessed in JavaScript code as expected. This is typically done by
   calling methods in the {@link com.google.gwt.user.client.DOM} class.
*)

val oNBLUR : int
val oNCHANGE : int
val oNCLICK : int
val oNDBLCLICK : int
val oNERROR : int
val oNFOCUS : int
val oNKEYDOWN : int
val oNKEYPRESS : int
val oNKEYUP : int
val oNLOAD : int
val oNLOSECAPTURE : int
val oNMOUSEDOWN : int
val oNMOUSEMOVE : int
val oNMOUSEOUT : int
val oNMOUSEOVER : int
val oNMOUSEUP : int
val oNMOUSEWHEEL : int
val oNPASTE : int
val oNSCROLL : int
val oNCONTEXTMENU : int
val fOCUSEVENTS : int
val kEYEVENTS : int
val mOUSEEVENTS : int
