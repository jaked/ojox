(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/Button.java
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
   A standard push-button widget.
   
   <p>
   <img class='gallery' src='doc-files/Button.png'/>
   </p>
   
   <h3>CSS Style Rules</h3>
   <dl>
   <dt>.gwt-Button</dt>
   <dd>the outer element</dd>
   </dl>
   
   <p>
   <h3>Example</h3>
   {@example com.google.gwt.examples.ButtonExample}
   </p>
 *)

(**
   Creates a button with the given HTML caption and click listener.
   
   @param html the HTML caption
   @param handler the click handler
 *)
class c : ?html:string -> ?handler:ClickEvent.c HandlerManager.handler -> ?element:DOMTypes.element -> unit ->
object
  inherit ButtonBase.c

  (**
     Programmatic equivalent of the user clicking the button.
   *)
  method click : unit

  (**
     Get the underlying button element.
     
     @return the {@link ButtonElement}
   *)
  method getButtonElement : DOMTypes.buttonElement
end

(**
   Creates a Button widget that wraps an existing &lt;button&gt; element.
   
   This element must already be attached to the document. If the element is
   removed from the document, you must call
   {@link RootPanel#detachNow(Widget)}.
   
   @param element the element to be wrapped
 *)
val wrap : DOMTypes.element -> c
