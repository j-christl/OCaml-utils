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
module YList :
  sig
    val list_reverse : 'a list -> 'a list
    val list_size : 'a list -> int
    val list_index_of : 'a list -> 'a -> int
    val list_contains : 'a list -> 'a -> bool
    val list_get_element : 'a list -> int -> 'a
    val list_map : ('a -> 'b) -> 'a list -> 'b list
    val list_replace_element : 'a list -> 'a -> 'a -> 'a list
    val list_set_at_index : 'a list -> int -> 'a -> 'a list = <fun>
  end
module YSequences :
  sig
    val fib : int -> int
    val fac : int -> int
  end
module YMap :
  sig
    val map_is_empty : 'a list -> bool
    val map_get : 'a -> ('a * 'b) list -> 'b option
    val map_put : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list
    val map_contains_key : 'a -> ('a * 'b) list -> bool
    val map_remove : 'a -> ('a * 'b) list -> ('a * 'b) list
    val map_keys : ('a * 'b) list -> 'a list
    val map_values : ('a * 'b) list -> 'b list
  end
module YBintree :
  sig
    type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree
    type traverse_order = PREORDER | INORDER | POSTORDER
    val bintree_insert : 'a -> ('a -> 'a -> int) -> 'a bintree -> 'a bintree
    val bintree_print : 'a bintree -> traverse_order -> ('a -> unit) -> unit
    val bintree_contains : 'a -> ('a -> 'a -> int) -> 'a bintree -> bool
  end
module YBasic :
  sig
    val string_to_charlist : string -> char list
    val is_balanced : string -> bool
  end
```
