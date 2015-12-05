module type Modulus = sig
  val modulus : int
end

module type ModInt = sig
  type t

  val of_int : int -> t

  val value : t -> int

  val modulus : int

  val add : t -> t -> t

  val sub : t -> t -> t

  val mul : t -> t -> t
end

module Make (M : Modulus) : ModInt = struct
  type t = int

  let rec of_int x =
    if x < 0 then
      of_int (x + M.modulus)
    else
      x mod M.modulus

  let value x =
    x

  let modulus =
    M.modulus

  let add a b =
    of_int (a + b)

  let sub a b =
    of_int (a - b)

  let mul a b =
    of_int (a * b)

  let div a b =
    of_int (a / b)
end

let make n =
  (module Make(struct let modulus = n end) : ModInt)
