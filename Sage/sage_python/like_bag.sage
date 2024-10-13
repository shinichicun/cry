from Crypto.Util.number import *
from gmpy2 import *
import random
import math


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
    t3 = invert(q*p, r)
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


M = 2**54
k = 6
N = 246958014720811275218104076569049326290644239557530068428118798615665805772543413056451802441767739814039814801665470000604369655455176614208872004460306917283189719075937276854208063959712772106122358987076992893882612110212736255979963729589114580019282486129385717120023802438473862301616755666896320219
C = 8
e = 3
c = 2217344750802206381450697759494445960779437717462348681384524178447235038091021161679290442338425818571580297588006934662292632812858663101063323564430837837089747180954075941884140209173607463120289909478482586857884143581315690703171442859404299097275515736999888245377125

"""
mm = [M**i for i in range(3*k, 0, -1)]
L = list(Matrix(3*k+1, 3*k+1))
for i in range(3*k):
    L[i][i] = 1
    L[i][-1] = C*mm[i]
L[-1][-1] = -C*N
L = Matrix(L)
L = L.LLL()[0]
for i in [L]:
    var('x')
    i = list(i)
    i[-1]=(-i[-1])//C
    px = sum([i[j]*(x**(18-j)) for j in range(len(i))])
    #print(px.factor())
    #print("\n")
# (29653*x^6 + 50082*x^5 + 61737*x^4 + 25317*x^3 + 26387*x^2 + 15547*x + 8211)*(16267*x^6 + 22103*x^5 + 12613*x^4 + 34024*x^3 + 37414*x^2 + 8698*x + 57345)*(12826*x^6 + 3281*x^5 + 12822*x^4 + 50811*x^3 + 29210*x^2 + 8471*x + 5913)
"""

p = 29653*x^6 + 50082*x^5 + 61737*x^4 + 25317*x^3 + 26387*x^2 + 15547*x + 8211
q = 16267*x^6 + 22103*x^5 + 12613*x^4 + 34024*x^3 + 37414*x^2 + 8698*x + 57345
r = 12826*x^6 + 3281*x^5 + 12822*x^4 + 50811*x^3 + 29210*x^2 + 8471*x + 5913
mm = [M**j for j in range(k+1)]
# print(mm)
# print(p.list(), q.list(), r.list())
p = Integer(sum([m * n for m, n in zip(mm, p.list())]))
q = Integer(sum([m * n for m, n in zip(mm, q.list())]))
r = Integer(sum([m * n for m, n in zip(mm, r.list())]))
# print(p, q, r)
'''
p = gcd(N, p)
q = gcd(N, q)
r = gcd(N, r)
print(p, q, r)
'''
cp = c % p
cq = c % q
cr = c % r

mp = AMM_rth(cp, e, p)
mq = AMM_rth(cq, e, q)
mr = AMM_rth(cr, e, r)

rt1 = ALL_ROOT2(e, p)
rt2 = ALL_ROOT2(e, q)
rt3 = ALL_ROOT2(e, r)

amp = ALL_Solution(mp, p, rt1, cp, e)
amq = ALL_Solution(mq, q, rt2, cq, e)
amr = ALL_Solution(mr, r, rt3, cr, e)

# calc函数稍微改了一下
calc(amp, amq, amr, e, p, q, r)