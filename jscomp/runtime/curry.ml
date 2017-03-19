
(* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. *)


(** *)

(** Generated by scripts/curry_gen.ml *)  
external function_length : 'a -> int = "#function_length"
external apply_args : ('a -> 'b) -> _ array -> 'b = "#apply"
external sub : 'a array -> int -> int -> 'a array = "caml_array_sub"

let rec app f args = 
  let arity = function_length f in
  let arity = if arity = 0 then 1 else arity in (* TOOD: optimize later *) 
  let len = Array.length args in
  let d = arity - len in 
  if d = 0 then 
    apply_args f  args (**f.apply (null,args) *)
  else if d < 0 then 
    (** TODO: could avoid copy by tracking the index *)
    app (Obj.magic (apply_args f (sub args 0 arity)))
      (sub args arity (-d))
  else 
    Obj.magic (fun x -> app f (Caml_array.append args [|x|] ))
  

external apply1 : ('a0 -> 'a1) -> 'a0 -> 'a1 = "#apply1"
external apply2 : ('a0 -> 'a1 -> 'a2) -> 'a0 -> 'a1 -> 'a2 = "#apply2"
external apply3 : ('a0 -> 'a1 -> 'a2 -> 'a3) -> 'a0 -> 'a1 -> 'a2 -> 'a3 = "#apply3"
external apply4 : ('a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4) -> 'a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 = "#apply4"
external apply5 : ('a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5) -> 'a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5 = "#apply5"
external apply6 : ('a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5 -> 'a6) -> 'a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5 -> 'a6 = "#apply6"
external apply7 : ('a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5 -> 'a6 -> 'a7) -> 'a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5 -> 'a6 -> 'a7 = "#apply7"
external apply8 : ('a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5 -> 'a6 -> 'a7 -> 'a8) -> 'a0 -> 'a1 -> 'a2 -> 'a3 -> 'a4 -> 'a5 -> 'a6 -> 'a7 -> 'a8 = "#apply8"

let curry_1 o a0 arity =
  match arity with
  | 0 -> apply1 (Obj.magic o) a0
  | 1 -> apply1 (Obj.magic o) a0
  | 2 -> apply2 (Obj.magic o) a0
  | 3 -> apply3 (Obj.magic o) a0
  | 4 -> apply4 (Obj.magic o) a0
  | 5 -> apply5 (Obj.magic o) a0
  | 6 -> apply6 (Obj.magic o) a0
  | 7 -> apply7 (Obj.magic o) a0
  | _ -> Obj.magic (app o [|a0|])    

let _1 o a0 =
  let arity = function_length o in
  if arity = 1 then apply1 o a0
  else curry_1 o a0 arity     

let __1 o =
  let arity = function_length o in
  if arity = 1 then o
  else fun a0 -> _1 o a0


let curry_2 o a0 a1 arity =
  match arity with
  | 0 -> app (apply1 (Obj.magic o) a0) [|a1|] 
  | 1 -> app (apply1 (Obj.magic o) a0) [|a1|]
  | 2 -> apply2 (Obj.magic o) a0 a1
  | 3 -> apply3 (Obj.magic o) a0 a1
  | 4 -> apply4 (Obj.magic o) a0 a1
  | 5 -> apply5 (Obj.magic o) a0 a1
  | 6 -> apply6 (Obj.magic o) a0 a1
  | 7 -> apply7 (Obj.magic o) a0 a1
  | _ -> Obj.magic (app o [|a0;a1|])    

let _2 o a0 a1 =
  let arity = function_length o in
  if arity = 2 then apply2 o a0 a1
  else curry_2 o a0 a1 arity     

let __2 o =
  let arity = function_length o in
  if arity = 2 then o
  else fun a0 a1 -> _2 o a0 a1


let curry_3 o a0 a1 a2 arity =
  match arity with
  | 0 -> app (apply1 (Obj.magic o) a0) [|a1;a2|] 
  | 1 -> app (apply1 (Obj.magic o) a0) [|a1;a2|]
  | 2 -> app (apply2 (Obj.magic o) a0 a1) [|a2|]
  | 3 -> apply3 (Obj.magic o) a0 a1 a2
  | 4 -> apply4 (Obj.magic o) a0 a1 a2
  | 5 -> apply5 (Obj.magic o) a0 a1 a2
  | 6 -> apply6 (Obj.magic o) a0 a1 a2
  | 7 -> apply7 (Obj.magic o) a0 a1 a2
  | _ -> Obj.magic (app o [|a0;a1;a2|])    

let _3 o a0 a1 a2 =
  let arity = function_length o in
  if arity = 3 then apply3 o a0 a1 a2
  else curry_3 o a0 a1 a2 arity     

let __3 o =
  let arity = function_length o in
  if arity = 3 then o
  else fun a0 a1 a2 -> _3 o a0 a1 a2


let curry_4 o a0 a1 a2 a3 arity =
  match arity with
  | 0 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3|] 
  | 1 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3|]
  | 2 -> app (apply2 (Obj.magic o) a0 a1) [|a2;a3|]
  | 3 -> app (apply3 (Obj.magic o) a0 a1 a2) [|a3|]
  | 4 -> apply4 (Obj.magic o) a0 a1 a2 a3
  | 5 -> apply5 (Obj.magic o) a0 a1 a2 a3
  | 6 -> apply6 (Obj.magic o) a0 a1 a2 a3
  | 7 -> apply7 (Obj.magic o) a0 a1 a2 a3
  | _ -> Obj.magic (app o [|a0;a1;a2;a3|])    

let _4 o a0 a1 a2 a3 =
  let arity = function_length o in
  if arity = 4 then apply4 o a0 a1 a2 a3
  else curry_4 o a0 a1 a2 a3 arity     

let __4 o =
  let arity = function_length o in
  if arity = 4 then o
  else fun a0 a1 a2 a3 -> _4 o a0 a1 a2 a3


let curry_5 o a0 a1 a2 a3 a4 arity =
  match arity with
  | 0 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4|] 
  | 1 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4|]
  | 2 -> app (apply2 (Obj.magic o) a0 a1) [|a2;a3;a4|]
  | 3 -> app (apply3 (Obj.magic o) a0 a1 a2) [|a3;a4|]
  | 4 -> app (apply4 (Obj.magic o) a0 a1 a2 a3) [|a4|]
  | 5 -> apply5 (Obj.magic o) a0 a1 a2 a3 a4
  | 6 -> apply6 (Obj.magic o) a0 a1 a2 a3 a4
  | 7 -> apply7 (Obj.magic o) a0 a1 a2 a3 a4
  | _ -> Obj.magic (app o [|a0;a1;a2;a3;a4|])    

let _5 o a0 a1 a2 a3 a4 =
  let arity = function_length o in
  if arity = 5 then apply5 o a0 a1 a2 a3 a4
  else curry_5 o a0 a1 a2 a3 a4 arity     

let __5 o =
  let arity = function_length o in
  if arity = 5 then o
  else fun a0 a1 a2 a3 a4 -> _5 o a0 a1 a2 a3 a4


let curry_6 o a0 a1 a2 a3 a4 a5 arity =
  match arity with
  | 0 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4;a5|] 
  | 1 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4;a5|]
  | 2 -> app (apply2 (Obj.magic o) a0 a1) [|a2;a3;a4;a5|]
  | 3 -> app (apply3 (Obj.magic o) a0 a1 a2) [|a3;a4;a5|]
  | 4 -> app (apply4 (Obj.magic o) a0 a1 a2 a3) [|a4;a5|]
  | 5 -> app (apply5 (Obj.magic o) a0 a1 a2 a3 a4) [|a5|]
  | 6 -> apply6 (Obj.magic o) a0 a1 a2 a3 a4 a5
  | 7 -> apply7 (Obj.magic o) a0 a1 a2 a3 a4 a5
  | _ -> Obj.magic (app o [|a0;a1;a2;a3;a4;a5|])    

let _6 o a0 a1 a2 a3 a4 a5 =
  let arity = function_length o in
  if arity = 6 then apply6 o a0 a1 a2 a3 a4 a5
  else curry_6 o a0 a1 a2 a3 a4 a5 arity     

let __6 o =
  let arity = function_length o in
  if arity = 6 then o
  else fun a0 a1 a2 a3 a4 a5 -> _6 o a0 a1 a2 a3 a4 a5


let curry_7 o a0 a1 a2 a3 a4 a5 a6 arity =
  match arity with
  | 0 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4;a5;a6|] 
  | 1 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4;a5;a6|]
  | 2 -> app (apply2 (Obj.magic o) a0 a1) [|a2;a3;a4;a5;a6|]
  | 3 -> app (apply3 (Obj.magic o) a0 a1 a2) [|a3;a4;a5;a6|]
  | 4 -> app (apply4 (Obj.magic o) a0 a1 a2 a3) [|a4;a5;a6|]
  | 5 -> app (apply5 (Obj.magic o) a0 a1 a2 a3 a4) [|a5;a6|]
  | 6 -> app (apply6 (Obj.magic o) a0 a1 a2 a3 a4 a5) [|a6|]
  | 7 -> apply7 (Obj.magic o) a0 a1 a2 a3 a4 a5 a6
  | _ -> Obj.magic (app o [|a0;a1;a2;a3;a4;a5;a6|])    

let _7 o a0 a1 a2 a3 a4 a5 a6 =
  let arity = function_length o in
  if arity = 7 then apply7 o a0 a1 a2 a3 a4 a5 a6
  else curry_7 o a0 a1 a2 a3 a4 a5 a6 arity     

let __7 o =
  let arity = function_length o in
  if arity = 7 then o
  else fun a0 a1 a2 a3 a4 a5 a6 -> _7 o a0 a1 a2 a3 a4 a5 a6


let curry_8 o a0 a1 a2 a3 a4 a5 a6 a7 arity =
  match arity with
  | 0 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4;a5;a6;a7|] 
  | 1 -> app (apply1 (Obj.magic o) a0) [|a1;a2;a3;a4;a5;a6;a7|]
  | 2 -> app (apply2 (Obj.magic o) a0 a1) [|a2;a3;a4;a5;a6;a7|]
  | 3 -> app (apply3 (Obj.magic o) a0 a1 a2) [|a3;a4;a5;a6;a7|]
  | 4 -> app (apply4 (Obj.magic o) a0 a1 a2 a3) [|a4;a5;a6;a7|]
  | 5 -> app (apply5 (Obj.magic o) a0 a1 a2 a3 a4) [|a5;a6;a7|]
  | 6 -> app (apply6 (Obj.magic o) a0 a1 a2 a3 a4 a5) [|a6;a7|]
  | 7 -> app (apply7 (Obj.magic o) a0 a1 a2 a3 a4 a5 a6) [|a7|]
  | _ -> Obj.magic (app o [|a0;a1;a2;a3;a4;a5;a6;a7|])    

let _8 o a0 a1 a2 a3 a4 a5 a6 a7 =
  let arity = function_length o in
  if arity = 8 then apply8 o a0 a1 a2 a3 a4 a5 a6 a7
  else curry_8 o a0 a1 a2 a3 a4 a5 a6 a7 arity     

let __8 o =
  let arity = function_length o in
  if arity = 8 then o
  else fun a0 a1 a2 a3 a4 a5 a6 a7 -> _8 o a0 a1 a2 a3 a4 a5 a6 a7

