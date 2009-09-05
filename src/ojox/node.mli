(*
 * This file is part of ojox, a library for web browser programming
 * Copyright (C) 2009 Jacob Donham
 * Original file (user/src/com/google/gwt/dom/client/Node.java
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

class type c =
object
  inherit JavaScriptObject.c

  (**
   * Adds the node newChild to the end of the list of children of this node. If
   * the newChild is already in the tree, it is first removed.
   * 
   * @param newChild The node to add
   * @return The node added
   *)
  method appendChild : 'a.'a -> 'a

  (**
   * Returns a duplicate of this node, i.e., serves as a generic copy
   * constructor for nodes. The duplicate node has no parent; (parentNode is
   * null.).
   * 
   * Cloning an Element copies all attributes and their values, including those
   * generated by the XML processor to represent defaulted attributes, but this
   * method does not copy any text it contains unless it is a deep clone, since
   * the text is contained in a child Text node. Cloning an Attribute directly,
   * as opposed to be cloned as part of an Element cloning operation, returns a
   * specified attribute (specified is true). Cloning any other type of node
   * simply returns a copy of this node.
   * 
   * @param deep If true, recursively clone the subtree under the specified
   *          node; if false, clone only the node itself (and its attributes, if
   *          it is an {@link Element})
   * @return The duplicate node
   *)
  method cloneNode : bool -> c

  (**
   * A NodeList that contains all children of this node. If there are no
   * children, this is a NodeList containing no nodes.
   *)
  method _get_childNodes : c array

  (**
   * The first child of this node. If there is no such node, this returns null.
   *)
  method _get_firstChild : c

  (**
   * The last child of this node. If there is no such node, this returns null.
   *)
  method _get_lastChild : c

  (**
   * The node immediately following this node. If there is no such node, this
   * returns null.
   *)
  method _get_nextSibling : c

  (**
   * The name of this node, depending on its type; see the table above.
   *)
  method _get_nodeName : string

  (**
   * A code representing the type of the underlying object, as defined above.
   *)
  method _get_nodeType : int

  (**
   * The value of this node, depending on its type; see the table above. When it
   * is defined to be null, setting it has no effect.
   *)
  method _get_nodeValue : string

  (**
   * The Document object associated with this node. This is also the
   * {@link Document} object used to create new nodes.
   *)
  (* method _get_ownerDocument : Document *)
  (* Document and Node can't refer to one another *)

  (**
   * The parent of this node. All nodes except Document may have a parent.
   * However, if a node has just been created and not yet added to the tree, or
   * if it has been removed from the tree, this is null.
   *)
  method _get_parentNode : c

  (**
   * The node immediately preceding this node. If there is no such node, this
   * returns null.
   *)
  method _get_previousSibling : c

  (**
   * Returns whether this node has any children.
   *)
  method _get_hasChildNodes : bool

  (**
   * Inserts the node newChild before the existing child node refChild. If
   * refChild is <code>null</code>, insert newChild at the end of the list of children.
   * 
   * @param newChild The node to insert
   * @param refChild The reference node (that is, the node before which the new
   *          node must be inserted), or <code>null</code> 
   * @return The node being inserted
   *)
  method insertBefore : c -> c -> c

  (**
   * Removes the child node indicated by oldChild from the list of children, and
   * returns it.
   * 
   * @param oldChild The node being removed
   * @return The node removed
   *)
  method removeChild : c -> c

  (**
   * Replaces the child node oldChild with newChild in the list of children, and
   * returns the oldChild node.
   * 
   * @param newChild The new node to put in the child list
   * @param oldChild The node being replaced in the list
   * @return The node replaced
   *)
  method replaceChild : c -> c -> c

  (**
   * The value of this node, depending on its type; see the table above. When it
   * is defined to be null, setting it has no effect.
   *)
  method _set_nodeValue : string -> unit

  constraint 'a = #c
end

(**
 * The node is an {@link Element}.
 *)
val eLEMENT_NODE : int

(**
 * The node is a {@link Text} node.
 *)
val tEXT_NODE : int

(**
 * The node is a {@link Document}.
 *)
val dOCUMENT_NODE : int

(**
 * Assert that the given {@link JavaScriptObject} is a DOM node and
 * automatically typecast it.
 *)
val as_ : JavaScriptObject.c -> c

(**
 * Determines whether the given {@link JavaScriptObject} is a DOM node. A
 * <code>null</code> object will cause this method to return
 * <code>false</code>.
 *)
val is : JavaScriptObject.c -> bool
