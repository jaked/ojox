(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/user/client/ui/UIObject.java
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
   The superclass for all user-interface objects. It simply wraps a DOM element,
   and cannot receive events. Most interesting user-interface classes derive
   from {@link com.google.gwt.user.client.ui.Widget}.
   
   <h3>Styling With CSS</h3>
   <p>
   All <code>UIObject</code> objects can be styled using CSS. Style names that
   are specified programmatically in Java source are implicitly associated with
   CSS style rules. In terms of HTML and CSS, a GWT style name is the element's
   CSS "class". By convention, GWT style names are of the form
   <code>[project]-[widget]</code>.
   </p>
   
   <p>
   For example, the {@link Button} widget has the style name
   <code>gwt-Button</code>, meaning that within the <code>Button</code>
   constructor, the following call occurs:
   
   <pre class="code">
   setStyleName("gwt-Button");</pre>
   
   A corresponding CSS style rule can then be written as follows:
   
   <pre class="code">
   // Example of how you might choose to style a Button widget 
   .gwt-Button {
     background-color: yellow;
     color: black;
     font-size: 24pt;
   }</pre>
   
   Note the dot prefix in the CSS style rule. This syntax is called a <a
   href="http://www.w3.org/TR/REC-CSS2/selector.html#class-html">CSS class
   selector</a>.
   </p>
   
   <h3>Style Name Specifics</h3>
   <p>
   Every <code>UIObject</code> has a <i>primary style name</i> that identifies
   the key CSS style rule that should always be applied to it. Use
   {@link #setStylePrimaryName(String)} to specify an object's primary style
   name. In most cases, the primary style name is set in a widget's constructor
   and never changes again during execution. In the case that no primary style
   name is specified, it defaults to the first style name that is added.
   </p>
   
   <p>
   More complex styling behavior can be achieved by manipulating an object's
   <i>secondary style names</i>. Secondary style names can be added and removed
   using {@link #addStyleName(String)} and {@link #removeStyleName(String)}. The
   purpose of secondary style names is to associate a variety of CSS style rules
   over time as an object progresses through different visual states.
   </p>
   
   <p>
   There is an important special formulation of secondary style names called
   <i>dependent style names</i>. A dependent style name is a secondary style
   name prefixed with the primary style name of the widget itself. See
   {@link #addStyleName(String)} for details.
   </p>
   
   <h3>Use in UiBinder Templates</h3>
   <p>
   Setter methods that follow JavaBean property conventions are exposed as
   attributes in {@link com.google.gwt.uibinder.client.UiBinder UiBinder}
   templates. For example, because UiObject implements {@link #setWidth(String)}
   you can set the width of any widget like so:
   
   <pre>
   &lt;g:Label width='15em'>Hello there&lt;/g:Label></pre>
   
   Generally speaking, values are parsed as if they were Java literals, so
   methods like {@link #setVisible(boolean)} are also available:
   
   <pre>
   &lt;g:Label width='15em' visible='false'>Hello there&lt;/g:Label></pre>
   Enum properties work this way too. Imagine a Bagel widget with a handy Type
   enum and a setType(Type) method:
   
   <pre>
   enum Type { poppy, sesame, raisin, jalapeno }
   
   &lt;my:Bagel type='poppy' /></pre>
   
   There is also special case handling for two common method signatures,
   <code>(int, int)</code> and <code>(double, {@link 
   com.google.gwt.dom.clientStyle.Unit Unit})</code>
   
   <pre>
   &lt;g:Label pixelSize='100, 100'>Hello there&lt;/g:Label></pre>
   
   Finally, a few UiObject methods get special handling. The debug id (see
   {@link #ensureDebugId}) of any UiObject can be set via the
   <code>debugId</code> attribute, and addtional style names and dependent style
   names can be set with the <code>addStyleNames</code> and
   <code>addStyleDependentNames</code> attributes.<pre>
   &lt;g:Label debugId='helloLabel' 
       addStyleNames='pretty rounded big'>Hello there&lt;/g:Label></pre>
   
   Style names can be space or comma separated.
 *)

val dEBUG_ID_PREFIX : string

val mISSING_ELEMENT_ERROR : string

val sETELEMENT_TWICE_ERROR : string

(**
   Set the debug id of a specific element. The id will be appended to the end
   of the base debug id, with a dash separator. The base debug id is the ID of
   the main element in this UIObject.
   
   <p>
   Ensure that elem has an ID property set, which allows it to integrate with
   third-party libraries and test tools. If elem already has an ID, this
   method WILL override it. The ID that you specify will be prefixed by the
   static string {@link #DEBUG_ID_PREFIX}.
   </p>
   
   <p>
   This method will be compiled out and will have no effect unless you inherit
   the DebugID module in your gwt.xml file by adding the following line:
   
   <pre class="code">
   &lt;inherits name="com.google.gwt.user.Debug"/&gt;</pre>
   </p>
   
   @param elem the target {@link Element}
   @param baseID the base ID used by the main element
   @param id the ID to set on the element
 *)
val ensureDebugId : element -> ?baseID:string -> string -> unit

val isVisible : element -> bool

val setVisible : element -> bool -> unit

(**
   Gets all of the element's style names, as a space-separated list.
   
   @param elem the element whose style is to be retrieved
   @return the objects's space-separated style names
 *)
val getStyleName : element -> string

(**
   Gets the element's primary style name.
   
   @param elem the element whose primary style name is to be retrieved
   @return the element's primary style name
 *)
val getStylePrimaryName : element -> string

(**
   Clears all of the element's style names and sets it to the given style.
   
   @param elem the element whose style is to be modified
   @param styleName the new style name
 *)
val setStyleName : element -> string -> unit

(**
   This convenience method adds or removes a style name for a given element.
   This method is typically used to add and remove secondary style names, but
   it can be used to remove primary stylenames as well, but that is not
   recommended. See {@link #setStyleName(String)} for a description of how
   primary and secondary style names are used.
   
   @param elem the element whose style is to be modified
   @param style the secondary style name to be added or removed
   @param add <code>true</code> to add the given style, <code>false</code> to
            remove it
 *)
val setStyleName_add : element -> string -> bool -> unit

(**
   Sets the element's primary style name and updates all dependent style
   names.
   
   @param elem the element whose style is to be reset
   @param style the new primary style name
   @see #setStyleName(Element, String, boolean)
 *)
val setStylePrimaryName : element -> string -> unit

class virtual c :
object
  (**
   * Adds a dependent style name by specifying the style name's suffix. The
   * actual form of the style name that is added is:
   * 
   * <pre class="code">
   * getStylePrimaryName() + '-' + styleSuffix
   * </pre>
   * 
   * @param styleSuffix the suffix of the dependent style to be added.
   * @see #setStylePrimaryName(String)
   * @see #removeStyleDependentName(String)
   * @see #addStyleName(String)
   *)
  method addStyleDependentName : string -> unit

  (**
   * Adds a secondary or dependent style name to this object. A secondary style
   * name is an additional style name that is, in HTML/CSS terms, included as a
   * space-separated token in the value of the CSS <code>class</code> attribute
   * for this object's root element.
   * 
   * <p>
   * The most important use for this method is to add a special kind of
   * secondary style name called a <i>dependent style name</i>. To add a
   * dependent style name, use {@link #addStyleDependentName(String)}, which
   * will prefix the 'style' argument with the result of
   * {@link #getStylePrimaryName()} (followed by a '-'). For example, suppose
   * the primary style name is <code>gwt-TextBox</code>. If the following method
   * is called as <code>obj.setReadOnly(true)</code>:
   * </p>
   * 
   * <pre class="code">
   * public void setReadOnly(boolean readOnly) {
   *   isReadOnlyMode = readOnly;
   *   
   *   // Create a dependent style name.
   *   String readOnlyStyle = "readonly";
   *    
   *   if (readOnly) {
   *     addStyleDependentName(readOnlyStyle);
   *   } else {
   *     removeStyleDependentName(readOnlyStyle);
   *   }
   * }</pre>
   * 
   * <p>
   * then both of the CSS style rules below will be applied:
   * </p>
   * 
   * <pre class="code">
   *
   * // This rule is based on the primary style name and is always active.
   * .gwt-TextBox {
   *   font-size: 12pt;
   * }
   * 
   * // This rule is based on a dependent style name that is only active
   * // when the widget has called addStyleName(getStylePrimaryName() +
   * // "-readonly").
   * .gwt-TextBox-readonly {
   *   background-color: lightgrey;
   *   border: none;
   * }</pre>
   * 
   * <p>
   * Dependent style names are powerful because they are automatically updated
   * whenever the primary style name changes. Continuing with the example above,
   * if the primary style name changed due to the following call:
   * </p>
   * 
   * <pre class="code">setStylePrimaryName("my-TextThingy");</pre>
   * 
   * <p>
   * then the object would be re-associated with following style rules, removing
   * those that were shown above.
   * </p>
   * 
   * <pre class="code">
   * .my-TextThingy {
   *   font-size: 20pt;
   * }
   * 
   * .my-TextThingy-readonly {
   *   background-color: red;
   *   border: 2px solid yellow;
   * }</pre>
   * 
   * <p>
   * Secondary style names that are not dependent style names are not
   * automatically updated when the primary style name changes.
   * </p>
   * 
   * @param style the secondary style name to be added
   * @see UIObject
   * @see #removeStyleName(String)
   *)
  method addStyleName : string -> unit

  (**
   * Ensure that the main {@link Element} for this {@link UIObject} has an ID
   * property set, which allows it to integrate with third-party libraries and
   * test tools. Complex {@link Widget}s will also set the IDs of their
   * important sub-elements.
   * 
   * If the main element already has an ID, this method WILL override it.
   * 
   * The ID that you specify will be prefixed by the static string
   * {@link #DEBUG_ID_PREFIX}.
   * 
   * This method will be compiled out and will have no effect unless you inherit
   * the DebugID module in your gwt.xml file by adding the following line:
   * 
   * <pre class="code">
   * &lt;inherits name="com.google.gwt.user.Debug"/&gt;</pre>
   * 
   * @param id the ID to set on the main element
   *)
  method ensureDebugId : string -> unit

  (**
   * Gets the object's absolute left position in pixels, as measured from the
   * browser window's client area.
   * 
   * @return the object's absolute left position
   *)
  method getAbsoluteLeft : int
  
  (**
   * Gets the object's absolute top position in pixels, as measured from the
   * browser window's client area.
   * 
   * @return the object's absolute top position
   *)
  method getAbsoluteTop : int
  
  (**
   * Gets a handle to the object's underlying DOM element.
   * 
   * This method should not be overridden. It is non-final solely to support
   * legacy code that depends upon overriding it. If it is overridden, the
   * subclass implementation must not return a different element than was
   * previously set using
   * {@link #setElement(com.google.gwt.user.client.Element)}.
   * 
   * @return the object's browser element
   *)
  method getElement : element
  
  (**
   * Gets the object's offset height in pixels. This is the total height of the
   * object, including decorations such as border, margin, and padding.
   * 
   * @return the object's offset height
   *)
  method getOffsetHeight : int
  
  (**
   * Gets the object's offset width in pixels. This is the total width of the
   * object, including decorations such as border, margin, and padding.
   * 
   * @return the object's offset width
   *)
  method getOffsetWidth : int
  
  (**
   * Gets all of the object's style names, as a space-separated list. If you
   * wish to retrieve only the primary style name, call
   * {@link #getStylePrimaryName()}.
   * 
   * @return the objects's space-separated style names
   * @see #getStylePrimaryName()
   *)
  method getStyleName : string
  
  (**
   * Gets the primary style name associated with the object.
   * 
   * @return the object's primary style name
   * @see #setStyleName(String)
   * @see #addStyleName(String)
   * @see #removeStyleName(String)
   *)
  method getStylePrimaryName : string
  
  (**
   * Gets the title associated with this object. The title is the 'tool-tip'
   * displayed to users when they hover over the object.
   * 
   * @return the object's title
   *)
  method getTitle : string
  
  (**
   * Determines whether or not this object is visible.
   * 
   * @return <code>true</code> if the object is visible
   *)
  method isVisible : bool
  
  (**
   * Removes a dependent style name by specifying the style name's suffix.
   * 
   * @param styleSuffix the suffix of the dependent style to be removed
   * @see #setStylePrimaryName(Element, String)
   * @see #addStyleDependentName(String)
   * @see #addStyleName(String)
   *)
  method removeStyleDependentName : string -> unit

  (**
   * Removes a style name. This method is typically used to remove secondary
   * style names, but it can be used to remove primary stylenames as well. That
   * use is not recommended.
   * 
   * @param style the secondary style name to be removed
   * @see #addStyleName(String)
   *)
  method removeStyleName : string -> unit

  (**
   * Sets the object's height. This height does not include decorations such as
   * border, margin, and padding.
   * 
   * @param height the object's new height, in CSS units (e.g. "10px", "1em")
   *)
  method setHeight : string -> unit

  (**
   * Sets the object's size, in pixels, not including decorations such as
   * border, margin, and padding.
   * 
   * @param width the object's new width, in pixels
   * @param height the object's new height, in pixels
   *)
  method setPixelSize : int -> int -> unit

  (**
   * Sets the object's size. This size does not include decorations such as
   * border, margin, and padding.
   * 
   * @param width the object's new width, in CSS units (e.g. "10px", "1em")
   * @param height the object's new height, in CSS units (e.g. "10px", "1em")
   *)
  method setSize : string -> string -> unit

  (**
   * Clears all of the object's style names and sets it to the given style. You
   * should normally use {@link #setStylePrimaryName(String)} unless you wish to
   * explicitly remove all existing styles.
   * 
   * @param style the new style name
   * @see #setStylePrimaryName(String)
   *)
  method setStyleName : string -> unit
  
  (**
   * Sets the object's primary style name and updates all dependent style names.
   * 
   * @param style the new primary style name
   * @see #addStyleName(String)
   * @see #removeStyleName(String)
   *)
  method setStylePrimaryName : string -> unit

  (**
   * Sets the title associated with this object. The title is the 'tool-tip'
   * displayed to users when they hover over the object.
   * 
   * @param title the object's new title
   *)
  method setTitle : string -> unit

  (**
   * Sets whether this object is visible.
   * 
   * @param visible <code>true</code> to show the object, <code>false</code> to
   *          hide it
   *)
  method setVisible : bool -> unit

  (**
   * Sets the object's width. This width does not include decorations such as
   * border, margin, and padding.
   * 
   * @param width the object's new width, in CSS units (e.g. "10px", "1em")
   *)
  method setWidth : string -> unit

  (**
   * Adds a set of events to be sunk by this object. Note that only
   * {@link Widget widgets} may actually receive events, but can receive events
   * from all objects contained within them.
   * 
   * @param eventBitsToAdd a bitfield representing the set of events to be added
   *          to this element's event set
   * @see com.google.gwt.user.client.Event
   *)
  method sinkEvents : int -> unit

  (**
   * This method is overridden so that any object can be viewed in the debugger
   * as an HTML snippet.
   * 
   * @return a string representation of the object
   *)
  method toString : string
  
  (**
   * Removes a set of events from this object's event list.
   * 
   * @param eventBitsToRemove a bitfield representing the set of events to be
   *          removed from this element's event set
   * @see #sinkEvents
   * @see com.google.gwt.user.client.Event
   *)
  method unsinkEvents : int -> unit
  
  (**
   * Template method that returns the element to which style names will be
   * applied. By default it returns the root element, but this method may be
   * overridden to apply styles to a child element.
   * 
   * @return the element to which style names will be applied
   *)
  method getStyleElement : element
  
  (**
   * Called when the user sets the id using the {@link #ensureDebugId(String)}
   * method. Subclasses of {@link UIObject} can override this method to add IDs
   * to their sub elements. If a subclass does override this method, it should
   * list the IDs (relative to the base ID), that will be applied to each sub
   * {@link Element} with a short description. For example:
   * <ul>
   * <li>-mysubelement = Applies to my sub element.</li>
   * </ul>
   * 
   * Subclasses should make a super call to this method to ensure that the ID of
   * the main element is set.
   * 
   * This method will not be called unless you inherit the DebugID module in
   * your gwt.xml file by adding the following line:
   * 
   * <pre class="code">
   * &lt;inherits name="com.google.gwt.user.Debug"/&gt;</pre>
   * 
   * @param baseID the base ID used by the main element
   *)
  method onEnsureDebugId : string -> unit

  (**
   * Sets this object's browser element. UIObject subclasses must call this
   * method before attempting to call any other methods, and it may only be
   * called once.
   * 
   * @param elem the object's element
   *)
  method setElement : element -> unit

  (**
   * Replaces this object's browser element.
   * 
   * This method exists only to support a specific use-case in Image, and should
   * not be used by other classes.
   * 
   * @param elem the object's new element
   *)
  method replaceElement : element -> unit
end

(**
   The implementation of the set debug id method, which does nothing by
   default.
 *)
module DebugIdImpl :
sig
  val ensureDebugId : #c -> string -> unit
  val ensureDebugId_element : element -> string -> string -> unit
end

(**
   The implementation of the setDebugId method, which sets the id of the
   {@link Element}s in this {@link UIObject}.
 *)
module DebugIdImplEnabled :
sig
  val ensureDebugId : #c -> string -> unit
  val ensureDebugId_element : element -> string -> string -> unit
end
