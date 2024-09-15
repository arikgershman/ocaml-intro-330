open Funs 

(***********************************)
(* Part 1: Non-Recursive Functions *)
(***********************************)

let abs x = if x < 0 then x - 2 * x else x

let rev_tup tup = match tup with
(a,b,c) -> (c,b,a)

let is_even x = if x mod 2 = 0 then true else false

let area point1 point2 = match point1, point2 with
(a,b), (c,d) -> (abs (c-a) * abs (d-b))

(*******************************)
(* Part 2: Recursive Functions *)
(*******************************)

let fibonacci n = let rec helper n a b = if n = 0 then a else helper (n-1) (a+b) a in helper n 0 1

let rec pow x p = match p with
| 0 -> 1
| a -> x * pow x (p-1)

let log x y = let rec helper x y ans = match y > 0 with
| false -> ans
| true -> helper x (y/x) (ans+1)
in helper x y (-1)

let gcf x y = let rec helper x y l = match x,l with
| 0,0 -> 0
| c,0 -> c
| a,b -> if x mod l = 0 && y mod l = 0 then l else helper x y (l - 1)
in helper x y y

(*****************)
(* Part 3: Lists *)
(*****************)

let reverse lst = let rec helper lst = match lst with
[] -> []
| h::t -> (helper t) @ (h::[])
in helper lst

let rec zip lst1 lst2 = match lst1,lst2 with
[],[] -> []
| [],_ -> []
| _,[] -> []
| h1::t1, h2::t2 -> (match h1,h2 with 
  | (a,b),(c,d) -> (a,b,c,d))::(zip t1 t2)

let rec merge lst1 lst2 = let rec helper l1 l2 ret = match l1,l2 with
[],[] -> ret
| h::t,[] -> helper t l2 (h::ret)
| [],h::t -> helper l1 t (h::ret)
| h1::t1,h2::t2 -> if h1 < h2 then helper t1 l2 (h1::ret) else helper l1 t2 (h2::ret)
in reverse (helper lst1 lst2 [])

let rec is_present lst v = match lst with
[] -> false
| h::t -> if h=v then true else is_present t v

let every_nth n lst = let rec helper n lst i = match lst with
[] -> []
| h::t -> if i mod n = 0 then h::(helper n t (i+1)) else (helper n t (i+1))
in helper n lst 1
      
let jumping_tuples lst1 lst2 = let vals1 = let rec helper l1 l2 i = match l1,l2 with
[],[] -> []
| [],h::t -> [match h with (a,b)->b]
| h::t,[] -> [match h with (a,b)->a]
| h1::t1,h2::t2 -> if (i mod 2 = 1) then 
  (*take 2nd elt from l2*) (match h2 with (a,b)->b)::helper l1 t2 (i+1) else
  (*take 1st elt from l1*) (match h1 with (a,b)->a)::helper t1 l2 (i+1)
in helper (*list of every_nth 2 starting/including index 1*)(every_nth 2 lst1)  
          (*list of every_nth 2 starting/including index 0*)(match lst2 with []->[] | h::t -> h::(every_nth 2 t)) 1
in let vals2 = let rec helper l1 l2 i = match l1,l2 with
[],[] -> []
| [],h::t -> [match h with (a,b)->b]
| h::t,[] -> [match h with (a,b)->a]
| h1::t1,h2::t2 -> if (i mod 2 = 1) then 
  (*take 1st elt from l1*) (match h1 with (a,b)->a)::helper t1 l2 (i+1) else
  (*take 2nd elt from l2*) (match h2 with (a,b)->b)::helper l1 t2 (i+1)
in helper (*list of every_nth 2 starting/including index 0*)(match lst1 with []->[] | h::t -> h::(every_nth 2 t))
          (*list of every_nth 2 starting/including index 1*)(every_nth 2 lst2) 1
in (vals1) @ (vals2)

let rec max_func_chain init funcs = let vals = let rec helper init funcs ret prev = match funcs with
[] -> ret
| f::t -> helper init t ((f init)::(f prev)::ret) (f prev)
in helper init funcs [init] init
in let rec max v c = match v with
[] -> c
| h::t -> if h > c then max t h else max t c
in max vals init

(*****************)
(* Part 4: HOF *)
(*****************)

let is_there lst x = fold (fun a y -> if a then true else y=x) false lst

let count_occ lst target = fold (fun a y -> if target = y then a+1 else a) 0 lst

                                   (* copied is_there func from above (checks if y is already in a)        *)
let uniq lst = fold (fun a y -> if (let is l x = fold (fun b z -> if b then true else z=x) false l in is a y) then a else y::a) [] lst

let every_xth x lst = let ret = fold (fun (a,i) y -> if (i mod x = 0) then (a@[y], i+1) else (a, i+1)) ([],1) lst
in match ret with ([],_)->[] | (l,_)->l