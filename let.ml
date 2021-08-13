let y = 42 in y + 1;; (* Let expression # Identifier scope limited to the expression "y + 1" *)
(* Here we're binding the value 42 to the "y" identifier, then using that inside the expression "y + 1"*)

let x = 41;; (* Let definition # You can still use identifier x *)

(* OCaml uses snake_case not camelCase *)

(* The compiler's type inference determines what the type of the variable is, or the programmer could explicitly annotate it with the following syntax *)

let y : int = 42

(*	---You type:---		Top-level understands as	---Meaning:---
* 	let a = "big";;						let a = "big" in
*	let b = "red";;						let b = "red" in 
*	let c = a^b;; 						let c = a^b in...
*	^ = concatenation
*	
*	* How to evaluate just "x" at the toplevel? 
*	--> Substitution from that giant nested let expression.
*	
*	--> Scope of an identifier(variable) is where its name is meaningful.
*	
*	*)

(* --- Overlapping bindings of the same name --- *)
let z = 5 in (let z = 6 in z) (* This will evaluate to 6 *) 
let z = 5 in (* I. *) z + (let z = 6 in (* I. *) z) (* This will evaluate to 11 *)
(* * --> Principle of Name Irrelevance (alpha equivalence) <-- * Substituting z to 5 in I. is the same as substituting z to 6 in II. (name of the identifier does not matter) *)

(* --------------------------------------------- *)

let z = 42 in (* w is not meaningful here *) z + (let w = "3110" in into_of_string w (* w is meaningfull here *))
 
