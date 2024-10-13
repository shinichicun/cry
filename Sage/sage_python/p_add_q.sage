from Crypto.Util.number import *
from gmpy2 import *
ct = 18440872486403323622510807012978507180529941426106643115456980837956295325764192595485820729772845428753953590301713705078399201869365193708057327848899904074671832807596665367550614919055119509073812499316019447070077472419739116237952486260179612984582496862441609849035603842161839069407115218245681423369
n = 99043577182118444378439642285640047958394971312102035300983634002184849658224373873268060886833728612494565170803226359641468271537155385458029052632983980837449378159671374748926031921883773305189594299358694724069728793519164632228950998545505807640604956250832692344226382573121014842953275020353743587393
p_add_q = 19908296297154261193603784476638931123516240704025306244561930935833463971799128110489967448460913311580547389743367260902522865073200825917723058108366848


PR.<x> = PolynomialRing(Zmod(n))
ok = False
p = 0
def pq_add(tp,tq,tgift,idx, kbit):
    global ok
    global p
    if ok:
        return 
    if tp*tq>n:
        #print('>')
        return 
    
    if (tp+(2<<idx))*(tq+(2<<idx))<n:
        #print('<', hex((tp+(1<<(idx+2))))[:20], hex(tq+(2<<idx))[:20], hex(n)[:20])
        return 
        
    if idx<=kbit:
        try:
            f = tp + x 
            rr = f.monic().small_roots(X=2^kbit, beta=0.44)
            if rr != []:
                """print(rr)
                print(tp)
                print('p = ',f(rr[0]))"""
                p = int(f(rr[0]))
                ok = True
                return
        except:
            pass
        
        return
    
    idx -=1
    b = tgift >>idx 
    one = 1<<idx
    
    #print(hex(tp)[:20],hex(tq)[:20],hex(tgift)[:20],idx,b)
    
    if b==0 or b==1:
        pq_add(tp,tq,tgift,idx, kbit)
    if b==1 or b==2:
        pq_add(tp+one,tq,tgift-one,idx, kbit)
        pq_add(tp,tq+one,tgift-one,idx, kbit)
    if b==2 or b==3:
        pq_add(tp+one,tq+one,tgift-(one<<1),idx, kbit)

tp = 1<<511
tq = 1<<511
tgift = p_add_q -tp -tq
kbit = 60
pq_add(tp,tq,tgift,511, kbit)
print(p)
q = n // p
e = bytes_to_long(b"too desperate!")
phi = (p-1)*(q-1)
d = invert(e, phi)
print(long_to_bytes(int(pow(ct, d, n))))