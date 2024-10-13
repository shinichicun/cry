from Crypto.Util.number import *
from gmpy2 import *
# from pwn import *

# p = remote('node3.anna.nssctf.cn',28709)
# p.interactive()

n = 201354090531918389422241515534761536573
# factor(n) = 13934102561950901579 * 14450452739004884887
c = 20442989381348880630046435751193745753

e = 2

p = 13934102561950901579
q = 14450452739004884887

cs = [c]

def rabin_decrypt(c,p,q):
    mp = Integer(pow(c, (p + 1) // 4, p))
    mq = Integer(pow(c, (q + 1) // 4, q))

    yp = inverse(p,q)
    yq = inverse(q,p)

    r = (yp * p * mq + yq * q * mp) % n
    r_ = n - r
    s = (yp * p * mq - yq * q * mp) % n
    s_ = n - s
    return r,r_,s,s_

for i in range(1):
    ps = []

    for c2 in cs:
        r,r_,s,s_ = rabin_decrypt(c2,p,q)
        if r not in ps:
            ps.append(r)
        if r_ not in ps:
            ps.append(r_)
        if s not in ps:
            ps.append(s)
        if s_ not in ps:
            ps.append(s_)
    print(ps)
    cs = ps

for i in range(len(cs)):
    #if b'flag' in long_to_bytes(cs[i]):
    print(long_to_bytes(cs[i]))
    print("\n")