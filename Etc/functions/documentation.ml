(*  OCaml provides a tool called OCamldoc that works a lot like Java's Javadoc tool: 
    it extracts specially formatted comments from source code and renders them as HTML, 
    making it easy for programmers to read documentation.

    Example:
*)

(** [sum lst x] is the sum of the elements of [lst] **)
let rec sum lst = ... 

(*  The double asterisk is what causes the comment to be recognized as an OCamldoc comment 
    The square brackets around parts of the comment mean that those parts should be rendered
in html as typewriter font rather than the regular font.
*)
(*  Also like Javadoc, OCamldoc supports documentation tags, such as @author, @deprecated,
@param, @return, etc. For example, in the first line of most programming assignments, we 
ask you to complete like this:
*)

(** @author Your name (your netid) **)

(* Note how there is no need to add tags to redundantly describe parameters or return 
values, as is often done with Javadoc. Everything that needs to be said has already been
said. We strongly discourage documentation like the following:
*)

(** Sum a list
    @param lst The list to be summed.
    @return The sum of the list. 
**)
let rec sum lst = ... 
(* That documentation takes three needlessly hard-to-read lines to say the same thing. *)

(** We can improve the documentation we have by stating explicitly what happens with empty
    lists:    
**)

(** [sum lst] is the sum of the elements of [lst].
    The sum of an empty list is 0.
**)