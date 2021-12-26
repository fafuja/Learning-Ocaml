(* Operators as Functions *)

(* The addition operator "+" has type int -> int -> int. 
   It's normally written infix, e.g., "3 + 4".
   By putting parentheses around it, we can make it a prefix operator:
   "( + )"
*)

( + ) 3 4;;

let add3 = ( + ) 3;;

add3 2;; (* - : int = 5 *)

(* Same technique works for any built-in operator *)

(* We can even define our own new infix operators, for example: *)
let ( ^^ ) x y = max x y;;

(* Tail recursion: *)

(* Consider the following function, which counts from 1 to n *)
let rec count n = 
   if n = 0 then 0 else 1 + count(n-1);;

(* Counting to 10 is no problem: *)
count 10;; (* - : int = 10 *)

(* Counting to 100,000 is no problem either: *)
count 100_000;; (* - : int = 100000 *)

(* But try counting to 1,000,000 and you'll get the following error: *)

Stack overflow during evaluation.

(* What's going on here? *)
(* The issue is that the call stack has a limited size. You probably learned in one of your 
introductory programming classes that most languages implement function calls with a stack.
   That stack contains one element for each function call that has been started but not
completed. (See "Call Stack" wikipedia).
   When the evaluation of one function body calls another function, a new element(stack
frame) is pushed on the call stack, and it is popped off when the called function 
completes.
   The size of the stack is usually limited by the operating system(for safety).
   If the stack runs out of space, it becomes impossible to make another function call.
   
   The "count" function isn't ~likely~ to make the stack run out of space, 
but this function would:
*)

let rec count_forever n = 1 + count_forever n;;

(* So the operating system for safety's sake limits the call stack size. 
   That means eventually "count" will run out of stack space on a large enough input.
   Notice how the choice is really independent of the programming language.
*)

(* Tail call optimization: 
   There is a solution to this issue. The solution (tail-call opt.) requires some cooperation 
between the programmer and the compiler. 
   The programmer does a little rewriting of the function, which the compiler then notices 
and applies an optimization.

   Guy L. Steele: "in general, procedure calls may be usefully thought of as GOTO statements
which also pass parameters, and can be uniformly coded as [machine code] JUMP instructions."

   Let's see how it works:
*)

(* Suppose that a recursive function f calls itself then returns the result of that 
recursive call. Our "count" function does not do that:
*)

let rec count n = 
   if n = 0 then 0 else 1 + count(n - 1);;

(* Rather, after the recursive call "count(n - 1)", there is computation remaining
   (the computer still needs to add 1 to the result of that call)

   But we as programmers, could rewrite the count function so that it does not need to do any
additional computation after the recursive call. 
   
   The trick is to create a helper function with an extra parameter:
*)

let rec count_aux n acc = 
   if n = 0 then acc else count_aux (n - 1) (acc + 1)

let count_tr n = count_aux n 0
(* Function count_aux is almost the same as our original count, but it adds an extra parameter
named "acc", which is idiomatic and stands for "accumulator". The idea is that the value
we want to return from the function is slowly, with each recursive call, being accumulated
in it. 
   The remaining computation - addition of 1 - now happens before the recursive call 
not after. 
   When the base case of the recursion finally arrives, the function now returns "acc",
where the answer has been accumulated.
   But the original base case of 0 still needs to exist in the code somewhere. And it does,
as the original value of "acc" that is passed to count_aux. 
   Now "count_tr" works as a replacement for "count".

   Programmer's job to make the function tail-recursive optimized is done.

   Now, a good compiler can notice when a recursive call is in tail position, which is a 
   technical way of saying "there's no more computation to be done after it returns".

   The recursive call to "count_aux" is in tail position; the recursive call to "count" is not.

   Let's compare them:
*)

let rec count n = 
   if n = 0 then 0 else 1 + count(n - 1);;

let rec count_aux n acc = 
   if n = 0 then acc else count_aux (n - 1) (acc + 1);;

(* A recursive call in tail position does not need a new stack frame. It can just reuse
the current one.
   
   That's because there's nothing left of use in the existing stack frame.

   There's no computation left to be done, so none of the local variables, 
or next instruction to execute, etc. matter any more. None of that memory ever needs to
be read again, because that call is effectively already finished.

   So instead of wasting space by allocating another stack frame, the compiler "recycles"
the space used by the previous frame. This is the tail-call optimization.

   The tail-call optimization reduces the stack space requirements from linear to constant.

   Whereas "count" needed O(n) stack frames, "count_aux" needs only O(1), because
the same frame gets reused over and over again for each recursive call. And that means 
"count_tr" actually can count to 1,000,000 . 
*)

count_tr 1_000_000;;

(* Why did we name this function "count_tr"? 

   The "tr" stands for tail recursive. A tail recursive function is a recursive 
function whose recursive calls are all in tail position. In other words, It's a function
will not exhaust the stack.

   It's pretty easy to make a recursive function tail recursive if you want to, 
just by adding an accumulator argument. Or maybe you should rethink how you have designed
the function.

   It's important that the compiler support the optimization. Otherwise, the transformation 
you do to the code as a programmer makes no difference.
   Indeed, most compilers do support it, at least as an option. Java is a notable exception.
*)

(* The Recipe for Tail Recursion: 

   1. Change the function into a helper funtion. Add an extra argument: the accumulator,
often named "acc".
   2. Write a new "main" version of the function that calls the helper. It passes the original
base case's return value as the initial value of the accumulator.
   3. Change the helper function to return the accumulator in the base case.
   4. Change the helper function's recursive case. It now needs to do the extra work on 
the accumulator argument, before the recursive call. This is the only step that requires much
much ingenuity.

   Example: Factorial.
      Before:
*)
 
let rec fac n = 
   if n = 0 then 1 else n * fac(n-1);;

(* With Tail-call optimization: *)

let rec fac_aux n acc = 
   if n = 0 then acc else fac_aux (n-1) (n*acc);;
let fac_tr n = fac_aux n 1;;

(* Here instead of suffering from the lack of stack space, we suffer from integer overflow *)
(* To address that problem, we can use the Ocaml's big integer library, "Zarith".
   To start using the library, just type " #require "zarith.top" "
   (If using top level, type this before importing the library: " #use "topfind" " )
*)

#require "zarith.top";;
let rec zfact_aux n acc = 
   if Z.equal n Z.zero then acc else zfact_aux (Z.pred n) (Z.mul acc n);;

let zfact_tr n = zfact_aux n Z.one;;

(* "#require" loads the library, which provides a module named "Z". (Recall that "Z" is 
   the symbol used in mathematics to denote the integers. )
   
   Generically speaking, "Z.n" means the name "n" defined inside of "Z".
   
   The type "Z.t" is the library's name for the type of big integers.
   
   We use library values "Z.equal" for equality comparison, "Z.zero" for 0, 
   "Z.pred" for predecessor (i.e., subtracting 1), "Z.mul" for multiplication,
   "Z.one" for 1, and "Z.of_int" to convert a primitive integer to a big integer.
*)