(* OCaml-utils
 * ************
 * Some basic OCaml utility functions
 * I will keep updating while learning
 * functional programming
 * https://github.com/yoshc/OCaml-utils
 * ************
 *)


(* -----
 * List functions
 * ----- 
 *)
 

(* list_reverse : list -> list
 *
 * Reverses a given list of polymorphic type
 * Examples:  # list_reverse [1;2;3;4] = [4; 3; 2; 1]
 *            # list_reverse ["hello";"world"] = ["world"; "hello"]
 *)
let list_reverse l =
  let rec list_reverse_rec li result =
    match li with []    -> result
                | x::xs -> list_reverse_rec xs (x::result)
  in list_reverse_rec l []


(* list_size : list -> int
 *
 * Returns the size of a given polymorphic list
 * Examples:  # list_size [] = 0
 *            # list_size [1;2;3] = 3
 *)
let list_size l =
  let rec list_size_rec li count =
    match li with []    -> count
                | x::xs -> list_size_rec xs (count+1)
  in list_size_rec l 0


(* list_index_of : list -> 'a -> int
 *
 * Returns the index where a specific element first occurs in a given
 * polymorphic list, starting at 0.
 * Returns -1 if the element is not in the list
 * Examples:  # list_index_of [1;2;3;4;5] 2 = 1
 *            # list_index_of [1;2;3;4;5] 4 = 3
 *            # list_index_of [1;2;3;4;5] 6 = -1
*)
let list_index_of l obj =
  let rec list_index_of_rec li obj count =
    match li with []    -> -1
                | x::xs -> if x = obj then count
                           else list_index_of_rec xs obj (count+1) 
  in list_index_of_rec l obj 0


(* list_contains : list -> 'a -> bool
 *
 * Returns if a given polymorphic list contains a specific object
 * Examples:  # list_contains ['a';'c';'e'] 'a' = true
 *            # list_contains ['a';'c';'e'] 'b' = false
*)
let list_contains l obj = (list_index_of l obj) >= 0


(* -----
 * Sequence functions
 * ----- 
 *)


 (* fib : int -> int
  *
  * Returns fib(x) with fib being the fibonacci sequence.
  * fib(0) = fib(1) = 1 and fib(x) = fib(x-1) + fib(x-2) with x >= 2
  *
  *)
let rec fib x = if x <= 1 then 1 else (fib (x-1)) + (fib (x-2))
