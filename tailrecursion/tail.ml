let rec loop () =
  print_string "I go on forever ...";
  loop ()
  
let () = loop ()
