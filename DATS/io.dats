staload "libats/libc/SATS/stdio.sats"
staload UN = "prelude/SATS/unsafe.sats"

fn fread_v { l : addr | l != null }{ sz : nat | sz >= 1 }{f:fm}(pfr : fmlte(f, r), pf : !bytes_v(l, sz)
                                                               | inp : !FILEptr1(f), bufsize : size_t(sz), p : ptr(l)) :
  [ m : nat | m <= sz ] size_t(m) =
  let
    extern
    castfn as_fileref(x : !FILEptr1) :<> FILEref
    
    var n = $extfcall(size_t, "fread", p, sizeof<byte>, bufsize, as_fileref(inp))
  in
    $UN.cast(n)
  end

extern
fn fclose_silent(FILEptr1) : void =
  "mac#fclose"
