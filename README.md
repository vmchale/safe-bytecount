# safe-bytecount

A safe version of `bytecount` that gets optimized beyond
[bytecount](https://docs.rs/bytecount) by GCC and clang.

## Results

| Compiler | Time |
| -------- | ---- | 
| GCC 9.3.0 | 575.58 μs |
| rustc 1.45.2 | 656.00 μs |
| clang 10.0.0 | 576.50 μs |
| ICC 19.1.2.254 | 4.7482 ms |
