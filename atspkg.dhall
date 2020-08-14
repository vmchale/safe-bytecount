let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall sha256:69bdde38a8cc01c91a1808ca3f45c29fe754c9ac96e91e6abd785508466399b4

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
          , dependencies = prelude.mapPlainDeps [ "ats-bench" ]
          , compiler = [ 0, 4, 2 ]
          , version = [ 0, 4, 2 ]
          , atsLib = False
          }
      )
