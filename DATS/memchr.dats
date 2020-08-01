staload "SATS/pointer.sats"

#define BUFSZ 32768

fn safe_memchr { l : addr | l != null }{m:nat}{ n : nat | n <= m }(pf : !bytes_v(l, m)
                                                                  | ptr : ptr(l), c : char, bufsz : size_t(n)) : int =
  let
    var res: int = 0
    var i: size_t
    val () = for* { i : nat | i <= n } .<i>. (i : size_t(i)) =>
        (i := bufsz ; i != 0 ; i := i - 1)
        let
          var current_char = byteview_read_as_char(pf | add_ptr_bsz(ptr, i))
        in
          if current_char = c then
            res := res + 1
          else
            ()
        end
    var current_char = byteview_read_as_char(pf | ptr)
    val () = if current_char = c then
      res := res + 1
    else
      ()
  in
    res
  end
