staload "libats/libc/SATS/stdio.sats"

#include "$PATSHOMELOCS/ats-bench-0.3.3/bench.dats"
#include "share/atspre_staload.hats"
#include "share/HATS/atslib_staload_libats_libc.hats"
#include "DATS/wc.dats"
#include "DATS/pointer.dats"

extern
castfn fp_is_null { l : addr | l == null }{m:fm} (FILEptr(l,m)) :<> void

fn harness_naive(fp : string) : void =
  let
    var inp = fopen(fp, file_mode_r)
    val () = if FILEptr_is_null(inp) then
      let
        val () = fp_is_null(inp)
        val () = println!("failed to open file")
      in end
    else
      let
        var newlines = count_lines_file(file_mode_lte_r_r | inp)
        val () = fclose_silent(inp)
      in end
  in end

val harness_naive_delay: io = lam () =>
    harness_naive("bench/data/sqlite3.c")

implement main0 () =
  print_slope("sqlite.c (for loop)", 9, harness_naive_delay)
