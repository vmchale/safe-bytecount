# safe-bytecount

A safe version of `bytecount` that gets optimized beyond
[bytecount](https://docs.rs/bytecount) by GCC and clang.

## Results

| Compiler | Time |
| -------- | ---- | 
| GCC 8.4.0 | 579.43 μs |
| rustc 1.45.1 | 639.94 μs |
| clang 9.0.0 | 570.92 μs |
| ICC 19.1.2.254 | 8.156 ms |
