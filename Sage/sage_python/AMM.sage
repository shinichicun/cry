from Crypto.Util.number import *
from gmpy2 import *
import random
import math
p=14213355454944773291
q=61843562051620700386348551175371930486064978441159200765618339743764001033297
c=105002138722466946495936638656038214000043475751639025085255113965088749272461906892586616250264922348192496597986452786281151156436229574065193965422841
gift=9751789326354522940
K = Zmod(p)
e = int(K(gift % p).nth_root(0x10001) - 114514)


def onemod(e, q):
    p = random.randint(1, q-1)
    while(powmod(p, (q-1)//e, q) == 1):  # (r,s)=1
        p = random.randint(1, q)
    return p

def AMM_rth(o, r, q):  # r|(q-1)
    assert((q-1) % r == 0)
    p = onemod(r, q)

    t = 0
    s = q-1
    while(s % r == 0):
        s = s//r
        t += 1
    k = 1
    while((s*k+1) % r != 0):
        k += 1
    alp = (s*k+1)//r

    a = powmod(p, r**(t-1)*s, q)
    b = powmod(o, r*a-1, q)
    c = powmod(p, s, q)
    h = 1

    for i in range(1, t-1):
        d = powmod(int(b), r**(t-1-i), q)
        if d == 1:
            j = 0
        else:
            j = (-math.log(d, a)) % r
        b = (b*(c**(r*j))) % q
        h = (h*c**j) % q
        c = (c*r) % q
    result = (powmod(o, alp, q)*h)
    return result

def ALL_Solution(m, q, rt, cq, e):
    mp = []
    for pr in rt:
        r = (pr*m) % q
        # assert(pow(r, e, q) == cq)
        mp.append(r)
    return mp


def calc(mp, mq, mr, e, p, q, r):
    i = 1
    j = 1
    t1 = invert(q*r, p)
    t2 = invert(p*r, q)
    t3 = invert(p*q, r)
    for mp1 in mp:
        for mq1 in mq:
            for mr1 in mr:
                j += 1
                if j % 100000 == 0:
                    print(j)
                ans = (mp1*t1*q*r+mq1*t2*p*r+mr1*t3*p*q) % (p*q*r)
                if check(ans):
                    return
    return


def check(m):
    try:
        a = long_to_bytes(m)
        if b'flag' in a:
            print(a)
            return True
        else:
            return False
    except:
        return False


def ALL_ROOT2(r, q):  # use function set() and .add() ensure that the generated elements are not repeated
    li = set()
    while(len(li) < r):
        p = powmod(random.randint(1, q-1), (q-1)//r, q)
        li.add(p)
    return li

cp = c % p

mp = AMM_rth(cp, e, p)


rt1 = ALL_ROOT2(e, p)


amp = ALL_Solution(mp, p, rt1, cp, e)

for i in amp:
    m = long_to_bytes(int(i))
    if b'flag{' in m:
        print(m)
        break
'''calc(amp, amq, amr, e, p, q, r)  # 这里你改一下函数就可以输出了'''