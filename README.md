# OCaml-utils
<br/><br/>
<a href="http://ocaml.org">
  <img src="http://ocaml.org/logo/Colour/PNG/colour-logo.png"
       alt="OCaml"
       width=200px />
</a>
<br/><br/>
Some basic OCaml utility functions I will keep updating while learning functional programming

## Usage
```ocaml
$ ocaml
        OCaml version 4.07.0

# #use "ocaml-utils.ml";;
```

## Current functions

```ocaml
val list_reverse : 'a list -> 'a list = <fun>

val list_size : 'a list -> int = <fun>

val list_index_of : 'a list -> 'a -> int = <fun>

val list_contains : 'a list -> 'a -> bool = <fun>

val list_get_element : 'a list -> int -> 'a = <fun>

val map : ('a -> 'b) -> 'a list -> 'b list = <fun>

val list_replace_element : 'a list -> 'a -> 'a -> 'a list = <fun>

val fib : int -> int = <fun>

val fac : int -> int = <fun>

val map_is_empty : 'a list -> bool = <fun>

val map_get : 'a -> ('a * 'b) list -> 'b option = <fun>

val map_put : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list = <fun>

val map_contains_key : 'a -> ('a * 'b) list -> bool = <fun>

val map_remove : 'a -> ('a * 'b) list -> ('a * 'b) list = <fun>

val map_keys : ('a * 'b) list -> 'a list = <fun>

val map_values : ('a * 'b) list -> 'b list = <fun>

```
