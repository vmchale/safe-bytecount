# safe-memchr

A safe version of `memchr` that gets optimized beyond
[memchr](https://crates.io/crates/memchr) by GCC and clang.

## Results

| Compiler | Time |
| -------- | ---- | 
| GCC 8.4.0 | 579.43 μs |
| rustc 1.45.1 | 639.94 μs |
| clang 9.0.0 | 570.92 μs |
| ICC 19.1.2.254 | 8.156 ms |
