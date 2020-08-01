let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall sha256:69bdde38a8cc01c91a1808ca3f45c29fe754c9ac96e91e6abd785508466399b4

let libCommon = { name = "safememchr", src = [ "DATS/memchr.dats" ] }

in  prelude.compilerMod
      prelude.gcc
      (   prelude.default
        ⫽ { bench =
            [   prelude.bin
              ⫽ { src = "bench/memchr-bench.dats"
                , target = "${prelude.atsProject}/bench"
                , gcBin = True
                }
            ]
          , libraries =
            [   prelude.staticLib
              ⫽ libCommon
              ⫽ { libTarget = "${prelude.atsProject}/libsafememchr.a" }
            ,   prelude.lib
              ⫽ libCommon
              ⫽ { libTarget = "${prelude.atsProject}/libsafememchr.so" }
            ]
          , dependencies = prelude.mapPlainDeps [ "ats-bench" ]
          , compiler = [ 0, 4, 0 ]
          , version = [ 0, 3, 13 ]
          , atsLib = False
          }
      )
