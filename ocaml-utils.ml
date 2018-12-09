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
let list_index_of l element =
  let rec list_index_of_rec li element count =
    match li with []    -> -1
                | x::xs -> if x = element then count
                           else list_index_of_rec xs element (count+1) 
  in list_index_of_rec l element 0


(* list_contains : list -> 'a -> bool
 *
 * Returns if a given polymorphic list contains a specific element
 * Examples:  # list_contains ['a';'c';'e'] 'a' = true
 *            # list_contains ['a';'c';'e'] 'b' = false
 *)
let list_contains l element = (list_index_of l element) >= 0


(* list_get_element : 'a list -> int -> 'a
 *
 * Returns the element at a specified index in a polymorphic list.
 * Note that index must be within [0;list_size l],
 * otherwise the function fails with "Index out of bounds"
 * Examples:  # list_get_element [2;4;6;8;10] 0 = 2
 *            # list_get_element [2;4;6;8;10] 4 = 10
 *)
let rec list_get_element l index = if index < 0 then failwith "Index out of bounds" else
  match l with []     -> failwith "Index out of bounds"
            |  x::xs  -> if index = 0 then x else list_get_element xs (index-1)


(* map : ('a -> 'b) -> 'a list -> 'b list
 *
 * Applies f to each element in a given polymorphic list.
 * Examples:  # map (fun x -> x+1) [1;2;3;4] = [2; 3; 4; 5]
 *            # map string_of_int [11;12;13] = ["11"; "12"; "13"]
 *)
let rec map f l =
  match l with []     -> []
            |  x::xs  -> (f x) :: map f xs



(* list_replace_element : 'a list -> 'a -> 'a -> 'a list
 *
 * Replaces all occurrences of element1 by element2 in a polymorphic list.
 * Examples:  # list_replace_element [1;2;3] 2 4 = [1; 4; 3]
 *            # list_replace_element [1;1;1] 1 2 = [2; 2; 2]
 *)
let rec list_replace_element l element1 element2 =
  match l with []     -> []
            |  x::xs  -> (if x = element1 then element2 else x)::list_replace_element xs element1 element2



(* -----
 * Sequence functions
 * ----- 
 *)


(* fib : int -> int
 *
 * Returns fib(x) with fib being the fibonacci sequence.
 * fib(0) = fib(1) = 1 and fib(x) = fib(x-1) + fib(x-2) with x >= 2
 *)
let rec fib x =
  if x <= 1 then 1 else (fib (x-1)) + (fib (x-2))


(* fac : int -> int
 *
 * Returns x! (factorial of x)
 * 0! = 1! and x! = x * (x-1)!
 *)
let rec fac x =
  if x <= 1 then 1 else x * fac (x-1)



(* -----
 * Map functions (associative list)
 * Stores key-value pairs as (k,v) tuples
 * in a list. Uses option types
 * ----- 
 *)


 (* is_empty : 'a list -> bool
 *
 * Returns True if the map is empty, False if not
 *)
let map_is_empty map = (map = []);;

(* get : 'a -> ('a * 'b) list -> 'b option
 *
 * Returns the value of a given key in a map.
 * Uses option type
 *)
let rec map_get key map = 
  match map with
      [] -> None
    | (k,v)::xs -> if key = k then Some v else map_get key xs

(* put : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list
 *
 * Inserts a key-value pair into the map.
 * Overrides existing (k,v)-tuple if it exists
 *)
let map_put key value map =
  if (List.find_opt (fun x -> let k,v = x in k = key) map) = None then (key,value)::map
  else List.map (fun x -> let k,v = x in (if k = key then key,value else k,v)) map

(* contains_key : 'a -> ('a * 'b) list -> bool
 *
 * Returns True if a given key exists in a map
 *)
let map_contains_key key map = (map_get key map <> None)

(* remove : 'a -> ('a * 'b) list -> ('a * 'b) list
 *
 * Removes the key-value pair with given key
 *)
let rec map_remove key map =
  match map with
      []          -> []
    | (k,v)::xs -> if key = k then map_remove key xs else (k,v)::(map_remove key xs)

(* keys : ('a * 'b) list -> 'a list
 *
 * Returns x! (factorial of x)
 * 0! = 1! and x! = x * (x-1)!
 *)
let map_keys map = List.map fst map


(* values : ('a * 'b) list -> 'b list
 *
 * Returns x! (factorial of x)
 * 0! = 1! and x! = x * (x-1)!
 *)
let map_values map = List.map snd map

