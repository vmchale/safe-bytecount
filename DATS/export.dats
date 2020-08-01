staload UN = "prelude/SATS/unsafe.sats"

#include "share/atspre_staload.hats"
#include "share/HATS/atslib_staload_libats_libc.hats"
#include "DATS/memchr.dats"

extern
fn ats_memchr { l : addr | l != null }{m:nat}{ n : nat | n <= m }(pf : !bytes_v(l, m) | ptr(l), char, size_t(n)) : int =
  "ext#"

implement ats_memchr (pf | p, c, s) =
  safe_memchr(pf | p, c, s)
