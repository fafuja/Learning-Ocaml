(*  OCaml has built-in printing functions for a few of the built-in primitive types: 
    "print_char", "print_string", "print_int", and "print_float". 
    There's also a "print_endline" function, which is like print_string, but also outputs a
    newline.  
*)

print_endline (* - : string -> unit = <fun> *)

print_string (* - : string -> unit = <fun> *)

(*  They both take a string as input and return a value of type "unit",
which we haven't seen yet. 
    There is only one value of this type, which is written "()" and is also pronounced
"unit".
    So "unit" is like bool, except there is one fewer value of type "unit" than 
there is of "bool"
*)

(*  Unit is used when you need to take an argument or return a value, but there's
no interesting value to pass or return. (Equivalent of "void" in Java and "None" in Python)
*)

(*  Unit is often used when you're writing or using code that has side effects.

    If you want to print one thing after another, you could sequence some print 
functions using nested let expressions. Example:
*)

let _ = print_endline "Camels" in
let _ = print_endline "are" in 
print_endline "bae."

(* Or *)

let () = print_endline "Camels" in
let () = print_endline "are" in 
print_endline "bae."

(* - : unit = () *)

(*  "let _ = e" or "let () = e" syntax above is a way of evaluating "e" but not binding its value to
    any name.
*)

(*  But either way, the boilerplate of all the "let..in" is annoying to have to write.
    
    So there's a special syntax that can be used to chain together multiple functions
that return "unit". 
    The expression "e1; e2" first evaluates e1, which SHOULD evaluate to "()", 
then discards that value, and evaluates e2. So we could rewrite the above code as:
*)

print_endline "Camels";
print_endline "are";
print_endline "bae" (* ! OBS: There is no semicolon after final "print_endline" *)
(* A semicolon is a statement separator, not a statement terminator. *)

(* - : unit = () *)

(*  Ignore 
    If e1 does not have type "unit", then "e1; e2" will give a warning, because you are
discarding a potentially useful value. If that is TRULY your intent, you can call 
the built-in function "ignore : 'a -> unit" to convert any value to "()"
    Example:
*)
(ignore 3); 5;; (* - : int = 5 *)

(* Actually "ignore" is easy to implement yourself: *)
let ignore x = ()

(* Or you can even write underscore to indicate the function takes in a value 
but does not bind that value to a name. That means the function can never use
that value in its body. *)

let ignore _ = ();;

(*  For complicated text outputs, using the built-in functions for primitive type
    printing quickly becomes tedious. For example:
*)

let print_stat name num = 
    print_string name;
    print_string ": ";
    print_float num;
    print_newline ()

print_stat "mean" 84.39;; (* mean: 84.39 *)
(* - : unit = () *)

(*  How could we shorten "print_stat"? In Java you might use the overloaded + operator
to turn all objects into string: 

    void print_stat(String name, double num) {
        System.out.println(name + ": " + num);
    }

    But OCaml values are not objects, and they do not have a toString() method they
inherit from some root Object class. Nor does OCaml permit overloading of operators.

    Long ago though, FORTRAN invented a different solution that others languages like C 
and Java and others support.

    The idea is to use a format specifier to - as the name suggest - specify how to 
format output.
    
    Here's how we'd use "printf" to re-implement "print_stat":
*)
let print_stat name num =
    Printf.printf "%s: %F\n%!" name num 
(* val print_stat : string -> float -> unit = <fun> *)

(*  If the type of an argument in incorrect with respect to the conversion specifier,
    OCaml will detect that.
    Example:    
*)
let print_stat name (num : int) =
    Printf.printf "%s: %F\n%" name num

(* 
    File "[14]", line 2, characters 34-37:
    2 |   Printf.printf "%s: %F\n%!" name num
                                      ^^^
    Error: This expression has type int but an expression was expected of type
             float
*)
(* To fix that, we can change to the conversion specifier for "int", which is "%i": *)

let print_stat name (num : int) = 
    Printf.printf "%s: %i\n%" name num 

(* val print_stat : string -> int -> unit = <fun> *)

(* Another very useful variant of "printf" in "sprintf", which collects the output 
in string instead of printing it: (It doesn't return a "unit" value) *)

let string_of_stat name num = 
    Print.sprintf "%s: %F" name num

string_of_stat "mean" 84.39

(* - : string = "mean: 84.39" *)
