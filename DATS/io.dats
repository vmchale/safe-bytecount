staload "libats/libc/SATS/stdio.sats"
staload UN = "prelude/SATS/unsafe.sats"

fn fread_v { l : addr | l != null }{ sz : nat | sz >= 1 }{m:fm}(pfr : fmlte(m, r), pf : !bytes_v(l, sz)
                                                               | inp : !FILEptr1(m), bufsize : size_t(sz), p : ptr(l)) :
  sizeLte(sz) =
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
