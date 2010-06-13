(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2010 Jacob Donham
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

(** DOM class type declarations. *)

class type javaScriptObject =
object
end

class type eventTarget =
object
  inherit javaScriptObject
end

class type nativeEvent =
object
  inherit javaScriptObject

  method initEvent : string -> bool -> bool -> unit
  method initKeyEvent : 'a. string -> bool -> bool -> 'a -> bool -> bool -> bool -> bool -> int -> int -> unit
  method initMouseEvent : 'a 'b. string -> bool -> bool -> 'a -> int -> int -> int -> int -> int -> bool -> bool -> bool -> bool -> int -> 'b -> unit
  method _get_cancelBubble : bool
  method _get_currentTarget : eventTarget
  method _get_relatedTarget : eventTarget
  method _get_target : eventTarget
  method _get_type : string
  method preventDefault : unit
  method _set_altKey : bool -> unit
  method _set_cancelBubble : bool -> unit
  method _set_charCode : char -> unit
  method _set_charCode_int : int -> unit
  method _set_ctrlKey : bool -> unit
  method _set_keyCode : char -> unit
  method _set_keyCode_int : int -> unit
  method _set_metaKey : bool -> unit
  method _set_shiftKey : bool -> unit
  method stopPropagation : unit
  method toString : string
end

class type style =
object
  inherit javaScriptObject

  method _set_opacity : float -> unit
  method _set_opacity_string : string -> unit
end

class type node =
object
  inherit javaScriptObject

  method appendChild : (< .. > as 'a) -> 'a
  method cloneNode : bool -> < .. >
  method contains : < .. > -> bool
  method dispatchEvent : nativeEvent -> unit
  method _get_childNodes : < .. > array
  method _get_firstChild : < .. >
  method _get_lastChild : < .. >
  method _get_nextSibling : < .. >
  method _get_nodeName : string
  method _get_nodeType : int
  method _get_nodeValue : string
  method _get_ownerDocument : < .. >
  method _get_parentNode : < .. >
  method _get_previousSibling : < .. >
  method hasChildNodes : bool
  method insertBefore : (< .. > as 'a) -> < .. > -> 'a
  method removeChild : (< .. > as 'a) -> 'a
  method replaceChild : < .. > -> (< .. > as 'b) -> 'b
  method _set_nodeValue : string -> unit
end

class type text =
object
  inherit node
end

class type element =
object
  inherit node

  method blur : unit
  method focus : unit
  method _get_className : string
  method _get_clientHeight : int
  method _get_clientWidth : int
  method _get_dir : string
  method getElementsByTagName : string -> #node array
  method _get_id : string
  method _get_innerHTML : string
  method _get_lang : string
  method _get_offsetParent : #node
  method _get_outerHTML : string
  method _get_style : style
  method _get_tabIndex : int
  method _get_tagName : string
  method _get_title : string
  method hasAttribute : string -> bool
  method removeAttribute : string -> unit
  method setAttribute : string -> string -> unit
  method _set_className : string -> unit
  method _set_dir : string -> unit
  method _set_id : string -> unit
  method _set_lang : string -> unit
  method _set_scrollLeft : int -> unit
  method _set_scrollTop : int -> unit
  method _set_tabIndex : int -> unit
end

class type anchorElement =
object
  inherit element

  method _get_accessKey : string
end

class type areaElement =
object
  inherit element
end

class type baseElement =
object
  inherit element
end

class type bRElement =
object
  inherit element
end

class type bodyElement =
object
  inherit element
end

class type document =
object
  inherit node

  method createEvent : string -> nativeEvent
  method createElement : string -> #element
  method createTextNode : string -> text
  method _get_body : bodyElement
  method _get_compatMode : string
  method _get_documentElement : #element
  method _get_domain : string
  method getElementById : string -> #element
  method getElementsByTagName : string -> #element array
  method _get_referrer : string
  method _get_title : string
  method _get_URL : string
  method importNode : #node -> bool -> unit
  method _set_title : string -> unit
end

class type buttonElement =
object
  inherit element

  method _set_type : string -> unit
  method click : unit
end

class type divElement =
object
  inherit element
end

class type dListElement =
object
  inherit element
end

class type fieldSetElement =
object
  inherit element
end

class type formElement =
object
  inherit element
end

class type frameElement =
object
  inherit element
end

class type frameSetElement =
object
  inherit element
end

class type headElement =
object
  inherit element
end

class type headingElement =
object
  inherit element
end

class type hRElement =
object
  inherit element
end

class type iFrameElement =
object
  inherit element
end

class type imageElement =
object
  inherit element

  method _get_alt : string
  method _get_height : int
  method _get_src : string
  method _get_width : int
  method _set_alt : string -> unit
  method _set_height : int -> unit
  method _set_isMap : bool -> unit
  method _set_src : string -> unit
  method _set_useMap : bool -> unit
  method _set_width : int -> unit
end

class type inputElement =
object
  inherit element

  method _set_name : string -> unit
  method _set_type : string -> unit
end

class type labelElement =
object
  inherit element
end

class type legendElement =
object
  inherit element
end

class type lIElement =
object
  inherit element
end

class type linkElement =
object
  inherit element
end

class type mapElement =
object
  inherit element
end

class type metaElement =
object
  inherit element
end

class type modElement =
object
  inherit element
end

class type objectElement =
object
  inherit element
end

class type oListElement =
object
  inherit element
end

class type optionElement =
object
  inherit element

  method _get_form : formElement
  method _get_index : int
  method _get_label : string
  method _get_text : string
  method _get_value : string
  method _set_defaultSelected : bool -> unit
  method _set_disabled : bool -> unit
  method _set_label : string -> unit
  method _set_selected : bool -> unit
  method _set_text : string -> unit
  method _set_value : string -> unit
end

class type optGroupElement =
object
  inherit element
end

class type paragraphElement =
object
  inherit element
end

class type paramElement =
object
  inherit element
end

class type preElement =
object
  inherit element
end

class type quoteElement =
object
  inherit element
end

class type scriptElement =
object
  inherit element

  method _get_defer : string
  method _get_src : string
  method _get_text : string
  method _get_type : string
  method _set_defer : string -> unit
  method _set_src : string -> unit
  method _set_text : string -> unit
  method _set_type : string -> unit
end

class type selectElement =
object
  inherit element

  method add : optionElement -> optionElement -> unit
  method _get_disabled : string
  method _get_form : formElement
  method _get_multiple : string
  method _get_name : string
  method _get_options : optionElement array
  method _get_selectedIndex : int
  method _get_size : int
  method _get_type : string
  method _get_value : string
  method remove : int -> unit
  method _set_disabled : bool -> unit
  method _set_disabled_string_ : string -> unit
  method _set_multiple : bool -> unit
  method _set_name : string -> unit
  method _set_selectedIndex : int -> unit
  method _set_size : int -> unit
  method _set_type : string -> unit
  method _set_value : string -> unit
end

class type spanElement =
object
  inherit element
end

class type styleElement =
object
  inherit element
end

class type tableElement =
object
  inherit element
end

class type tableCaptionElement =
object
  inherit element
end

class type tableCellElement =
object
  inherit element
end

class type tableColElement =
object
  inherit element
end

class type tableRowElement =
object
  inherit element
end

class type tableSectionElement =
object
  inherit element
end

class type textAreaElement =
object
  inherit element
end

class type titleElement =
object
  inherit element
end

class type uListElement =
object
  inherit element
end
