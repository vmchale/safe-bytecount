staload "libats/libc/SATS/stdio.sats"
staload "prelude/SATS/pointer.sats"
staload UN = "prelude/SATS/unsafe.sats"
staload "SATS/pointer.sats"
staload "SATS/size.sats"

#include "DATS/bytecount.dats"
#include "DATS/io.dats"

#define BUFSZ 32768

fn count_lines_file {f:fm}(pfr : fmlte(f, r) | inp : !FILEptr1(f)) : int =
  let
    val (pfat, pfgc | p) = malloc_gc(g1i2u(BUFSZ))
    prval () = pfat := b0ytes2bytes_v(pfat)
    
    fun loop { l : addr | l != null }{f:fm}(pfr : fmlte(f, r), pf : !bytes_v(l, BUFSZ)
                                           | inp : !FILEptr1(f), p : ptr(l)) : int =
      let
        var file_bytes = fread_v(pfr, pf | inp, i2sz(BUFSZ), p)
        
        extern
        praxi lt_bufsz {m:nat} (size_t(m)) : [m <= BUFSZ] void
      in
        if file_bytes = 0 then
          0
        else
          let
            var fb_prf = bounded(file_bytes)
            prval () = lt_bufsz(fb_prf)
            var acc = safe_bytecount(pf | p, '\n', fb_prf)
          in
            acc + loop(pfr, pf | inp, p)
          end
      end
    
    var ret = loop(pfr, pfat | inp, p)
    val () = mfree_gc(pfat, pfgc | p)
  in
    ret
  end
