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

let oNBLUR = 0x01000
let oNCHANGE = 0x00400
let oNCLICK = 0x00001
let oNDBLCLICK = 0x00002
let oNERROR = 0x10000
let oNFOCUS = 0x00800
let oNKEYDOWN = 0x00080
let oNKEYPRESS = 0x00100
let oNKEYUP = 0x00200
let oNLOAD = 0x08000
let oNLOSECAPTURE = 0x02000
let oNMOUSEDOWN = 0x00004
let oNMOUSEMOVE = 0x00040
let oNMOUSEOUT = 0x00020
let oNMOUSEOVER = 0x00010
let oNMOUSEUP = 0x00008
let oNMOUSEWHEEL = 0x20000
let oNPASTE = 0x80000
let oNSCROLL = 0x04000
let oNCONTEXTMENU = 0x40000
let fOCUSEVENTS = oNFOCUS lor oNBLUR
let kEYEVENTS = oNKEYDOWN lor oNKEYPRESS lor oNKEYUP
let mOUSEEVENTS = oNMOUSEDOWN lor oNMOUSEUP lor oNMOUSEMOVE lor oNMOUSEOVER lor oNMOUSEOUT
