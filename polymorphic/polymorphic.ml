(* 
	Function "max1"(polymorphic) is slower than function "max2" because OCaml will need to call a C function to  
	compare the values.
*)
let max1 a b = 
	if a > b then a else b;;

let max2 (a : int) (b : int) = 
	if a > b then a else b;;

