(* Partial Application *)
(* We could define an addition function as follows: *)
let add x y = x + y

(* Here's  a rather similar function: *)
let addx x = fun y -> x + y

(* Function addx takes an integer x as input and returns a function of type int -> int that
will add x to whatever is passed to it *)

(* The type of addx is int -> int -> int. The type of add is also int -> int -> int. 
So from the perspective of their types, they are the same function. But the form of addx
suggests something interesting: we can apply it to just a single argument. *)
let add5 = addx 5;;

add5 2;; (* Output: - : int = 7 *) 

(* ~Or~ *)
(addx 5) 2;; (* Output: - : int = 7 *)

(* It turns out the same can be done with add: *)

let add5 = add 5;;
add5 2;; (* Output: - : int = 7 *)

(* ~Or~ *)
(add 5) 2;; (* Output: - : int = 7 *)

(* This works because the following three functions are syntactically different but semantically
equivalent. That is, they are different ways of expressing the same computation: *)
let add x y = x + y
let add x = fun y -> x + y
let add = fun x -> (fun y -> x + y)

(* So add is really a function that takes an argument x and returns a function (fun y -> x+y).
Which leads to a deep truth...  *)

(* Every multi-argument function in Ocaml is really 
just a chain of single-argument functions *)

(* "fun x y z -> e" becomes "fun x -> (fun y -> (fun z -> e) )" *) 

(* Function associativity *)

let f x1 x2 ... xn = e (* semantically equivalent to *)
let f =
  fun x1 ->
    (fun x2 ->
       (...
          (fun xn -> e)...))

(* Every OCaml function takes exactly one argument. *)

(* Function types are right associative: 
    -> The type of such a function:
        t1 -> t2 -> t3 -> t4

    ->  really means the same as:
        t1 -> (t2 -> (t3 -> t4)))
*)
(* Function application, on the other hand, is left associative: 

      " e1 e2 e3 e4 " really means the same as
      "((e1 e2) e3) e4"

      The intuition here is that the left-most expression 
      grabs the next expression to its right as its single argument.
*)