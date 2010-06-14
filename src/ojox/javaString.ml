(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
 * Original file (user/super/com/google/gwt/emul/java/lang/String.java
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

let charAt s index = << $s$.charCodeAt($index$) >>

let equalsIgnoreCase s1 s2 = <:rstmt<
  if ($s2$ == null)
    return false;
  return ($s1$ == $s2$) || ($s1$.toLowerCase() == $s2$.toLowerCase());
>>

let fromCharCode ch = << String.fromCharCode ch >>

let indexOf s ?startIndex str = << $s$.indexOf($str$, $Ocamljs.nullable_of_option startIndex$) >>

let contains s1 s2 = indexOf s1 s2 != -1

let length s = << $s$.length >>

let substring s ?endIndex beginIndex =
  let len =
    match endIndex with
      | None -> length s - beginIndex
      | Some endIndex -> endIndex - beginIndex in
  << $s$.substr($beginIndex$, $len$) >>

let toLowerCase s = << $s$.toLowerCase() >>

let trim s = <:rstmt<
  if ($s$.length == 0 || ($s$[0] > '\u0020' && $s$[$s$.length-1] > '\u0020')) {
    return $s$;
  }
  var r1 = $s$.replace(/^(\s*)/, '');
  var r2 = r1.replace(/\s*$/, '');
  return r2;
>>
