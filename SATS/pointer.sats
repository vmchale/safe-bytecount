fn byteview_read_as_char {l0:addr}{m:nat}{ l1 : addr | l1 <= l0+m } (pf : !bytes_v(l0, m) | p : ptr(l1)) : char
