(* The following code has an expression in it (42), but is not itself an expression. Rather,
It's a definition. Definitions bind values to names. Definitions are not expressions, 
not are expressions definitions.(Distinct syntatic classes) *)
let x = 42;;

(* But definitions can have expressions nested inside them: *)
let x = (2 + 2);;

(* You have to explicitly add a keyword("rec") to make a function recursive *)
(* Anywhere "let x = e1 in e2"(let expression) appears in program, we could replace it with 
"(fun x -> e2) e1":  *)

(let x = 1 in (x+1));; (* same as *)
(fun x -> (x+1)) 1;;

(* Let expressions are a just syntatic sugar for anonymous function application *)
(* Identity function is the function that simply returns its input Ex: *)

let id x = x;; (* Output: id : 'a -> 'a = <fun> *)

(* ('a) is a type variable: it stands for an unknown type, just like regular variable stands for an 
unknown value *)

(* We can apply the identity function to any type of value we like: *)

id 42;;
id true;;
id "bigred";;

(* Two ways of writing an increment function *)
let inc  x = x + 1;;
let inc = fun x -> x + 1;;

(* Anonymous functions are also called lambda expressions *)

(* Because you can apply id to many types of values, it is a polymorphic function: it can be applied
to many (poly) forms (morphs) *)

(* OCaml supports labeled arguments to functions. You can declare this kind of function 
using the following syntax: *)

let f ~name1:arg1 ~name2:arg2 = arg1 + arg2;; (* Output: val f : name1:int -> name2:int -> int = <fun>
*)

(* This function can be called by passing the labeled arguments in either order: *)

f ~name2:3 ~name1:4;; (* Or: f ~name1:4 ~name2:3;; *)

(* Labels for arguments are often the same as the variable names for them. OCaml provides 
a shorthand for this case. The following are equivalent: *)

let f ~name1 ~name2 = name1+name2
(* Instead of *)
let f ~name1:name1 ~name2:name2 = name1+name2

(* syntax to write both a labeled argument and an explicit type annotation is: *)
let f ~name1:(arg1:int) ~name2:(arg2:int) = arg1 + arg2

(* It is possible to make arguments optional: *)

let f ?name:(arg1=8) arg2 = arg1 + arg2;;

(* You can then call a function with or without the argument: *)

f ~name:2 7;; (* Output: - : int = 9 *)
f 7;; (* Output: - : int = 15 (arg1 := 8) *)

(* [Math-logic] A predicate becomes a proposition when we assign it fixed values. However, another 
way to make a predicate into a proposition is to quantify it (using either the Universal quantifier
 or Existential quantifier) *)
 
(* Manual type annotations *)
let id_int(x : int) : int = x;; 
(* Same function as "id" except we can only apply the function with int type arguments *)

(* Another way of writing id_int would be in terms of "id" *)
let id_int': int -> int = id;;
(* One way to think about this is in terms of behavior. *)

(* The following are wrong. *)
let id' : 'a -> 'a = fun x -> x + 1;; (* Wrong because "+" infix only accepts integers values *)
let id'' : 'a -> 'a = id_int;; (* when evaluating the application id 5,
 the argument x is instantiated with value 5. Likewise, 
the 'a in the type of id (in function id_int') is being instantiated with type int at that application. 
We cannot revert instantiations? then *)

(* To make that precise: *)
let x = e [in e'];; 

(* Ocaml infers x has a type t that includes some type variables 'a, 'b, etc.
  Then we are permitted to instantiate those type variables. We can do that by applying
  the function to arguments that reveal what the type instantiations should be (as in "id 5")
  or by a type annotation (as in id_int'), among other ways. But we have to be consistent 
  with the instantiation. 
*)
(* For example, we cannot take a function of type 'a -> 'b -> 'a and instantiate it at type 
    int -> 'b -> string, because the instantiation of 'a is not the same in each  of the two
    places it occurred:
*)

let first x y = x;;
let first_int : int -> 'b -> int = first;; 
let bad_int : int -> 'b -> string = first;; (* CAN'T DO THIS *)



let rec pow a = function
  | 0 -> 1
  | 1 -> a
  | n -> 
    let b = pow a (n / 2) in
    b * b * (if n mod 2 = 0 then 1 else a);;

