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