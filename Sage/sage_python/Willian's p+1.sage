from Crypto.Util.number import *
from gmpy2 import *
from itertools import count

n = 63398538193562720708999492397588489035970399414238113344990243900620729661046648078623873637152448697806039260616826648343172207246183989202073562200879290937
e = 65537
c = 26971181342240802276810747395669930355754928952080329914687241779532014305320191048439959934699795162709365987652696472998140484810728817991804469778237933925

def mlucas(v, a, n):
    v1, v2 = v, (v ** 2 - 2) % n
    for bit in bin(a)[3:]: v1, v2 = ((v1 ** 2 - 2) % n, (v1 * v2 - v) % n) if bit == "0" else (
        (v1 * v2 - v) % n, (v2 ** 2 - 2) % n)
    return v1

def primegen():
    yield 2
    yield 3
    yield 5
    yield 7
    yield 11
    yield 13
    ps = primegen()  # yay recursion
    p = ps.__next__() and ps.__next__()
    q, sieve, n = p ** 2, {}, 13
    while True:
        if n not in sieve:
            if n < q:
                yield n
            else:
                next, step = q + 2 * p, 2 * p
                while next in sieve:
                    next += step
                sieve[next] = step
                p = ps.__next__()
                q = p ** 2
        else:
            step = sieve.pop(n)
            next = n + step
            while next in sieve:
                next += step
            sieve[next] = step
        n += 2

def ilog(x, b):  # greatest integer l such that b**l <= x.
    l = 0
    while x >= b:
        x /= b
        l += 1
    return l

def attack(n):
    for v in count(1):
        for p in primegen():
            e = ilog(isqrt(n), p)
            if e == 0:
                break
            for _ in range(e):
                v = mlucas(v, p, n)
            g = gcd(v - 2, n)
            if 1 < g < n:
                return int(g), int(n // g)  # g|n
            if g == n:
                break

p, q = attack(n)


phi = (p-1)*(q-1)
d = invert(e, phi)
m = powmod(c, d, n)
print(long_to_bytes(m))