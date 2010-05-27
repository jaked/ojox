(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/ImageElement.java
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

(**
   Embedded image.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#edef-IMG">W3C HTML Specification</a>
*)

val tAG : string

(**
   Assert that the given {@link Element} is compatible with this class and
   automatically typecast it.
 *)
val as_ : element -> imageElement

(**
   Alternate text for user agents not rendering the normal content of this
   element.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-alt">W3C HTML Specification</a>
 *)
val getAlt : imageElement -> string

(**
   Height of the image in pixels.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-height-IMG">W3C HTML Specification</a>
 *)
val getHeight : imageElement -> int

(**
   URI designating the source of this image.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-src-IMG">W3C HTML Specification</a>
 *)
val getSrc : imageElement -> string

(**
   The width of the image in pixels.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-width-IMG">W3C HTML Specification</a>
 *)
val getWidth : imageElement -> int

(**
   Use server-side image map.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-ismap">W3C HTML Specification</a>
 *)
val isMap : imageElement -> bool

(**
   Alternate text for user agents not rendering the normal content of this
   element.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-alt">W3C HTML Specification</a>
 *)
val setAlt : imageElement -> string -> unit

(**
   Height of the image in pixels.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-height-IMG">W3C HTML Specification</a>
 *)
val setHeight : imageElement -> int -> unit

(**
   Use server-side image map.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-ismap">W3C HTML Specification</a>
 *)
val setIsMap : imageElement -> bool -> unit

(**
   URI designating the source of this image.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-src-IMG">W3C HTML Specification</a>
 *)
val setSrc : imageElement -> string -> unit

(**
   Use client-side image map.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-usemap">W3C HTML Specification</a>
 *)
val setUseMap : imageElement -> bool -> unit

(**
   The width of the image in pixels.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-width-IMG">W3C HTML Specification</a>
 *)
val setWidth : imageElement -> int -> unit

(**
   Use client-side image map.
   
   @see <a href="http://www.w3.org/TR/1999/REC-html401-19991224/struct/objects.html#adef-usemap">W3C HTML Specification</a>
 *)
val useMap : imageElement -> bool -> unit
