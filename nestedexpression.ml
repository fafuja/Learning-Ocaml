let x = 42;;
let f y = x + y;; (* compiler only understand this line coz we assigned x before, first x definition is the start of the nested expression. If we tried to write only this line at the toplevel, we would receive the following output: "unbound value x" *)
let x = 22;;
(* each let definition binds an entirely new variable *)
