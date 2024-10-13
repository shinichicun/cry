from Crypto.Util.number import *

p = ...
h = ...
c = ...
L = Matrix(ZZ, [[1, h],
                [0, p]])

f, g = L.LLL()[0]

m = (f*c) % p % g * inverse_mod(f, g) % g

print(long_to_bytes(m))