# 以下是使用说明及注意事项
# Franklin-Reiter attack against RSA.
# If two messages differ only by a known fixed difference between the two messages
# and are RSA encrypted under the same RSA modulus N
# then it is possible to recover both of them.

# Inputs are modulus, known difference, ciphertext 1, ciphertext2.
# Ciphertext 1 corresponds to smaller of the two plaintexts. (The one without the fixed difference added to it)
def franklinReiter(n,e,r,c1,c2):
    R.<X> = Zmod(n)[]
    f1 = X^e - c1
    f2 = (X + r)^e - c2
    # coefficient 0 = -m, which is what we wanted!
    return Integer(n-(compositeModulusGCD(f1,f2)).coefficients()[0])

  # GCD is not implemented for rings over composite modulus in Sage
  # so we do our own implementation. Its the exact same as standard GCD, but with
  # the polynomials monic representation
def compositeModulusGCD(a, b):
    if(b == 0):
        return a.monic()
    else:
        return compositeModulusGCD(b, a % b)

def CoppersmithShortPadAttack(e,n,C1,C2,eps=1/30):
    """
    Coppersmith's Shortpad attack!
    Figured out from: https://en.wikipedia.org/wiki/Coppersmith's_attack#Coppersmith.E2.80.99s_short-pad_attack
    """
    import binascii
    P.<x,y> = PolynomialRing(ZZ)
    ZmodN = Zmod(n)
    g1 = x^e - C1
    g2 = (x+y)^e - C2
    res = g1.resultant(g2)
    P.<y> = PolynomialRing(ZmodN)
    # Convert Multivariate Polynomial Ring to Univariate Polynomial Ring
    rres = 0
    for i in range(len(res.coefficients())):
        rres += res.coefficients()[i]*(y^(res.exponents()[i][1]))

    diff = rres.small_roots(epsilon=eps)
    recoveredM1 = franklinReiter(n,e,diff[0],C1,C2)
    print(recoveredM1)
    print("Message is the following hex, but potentially missing some zeroes in the binary from the right end")
    print(hex(recoveredM1))
    print("Message is one of:")
    for i in range(8):
        msg = hex(Integer(recoveredM1*pow(2,i)))
        if(msg[:2]=='0x'):
            msg = msg[2:]
        if(len(msg)%2 == 1):
            msg = '0' + msg
        msg = binascii.unhexlify(msg)
        if msg[:6] == b'VNCTF{':
            print(msg)


e = 7
n = 143224951702807798608353389056046982493788310072914995404719898237226283884553121669729599925829562704800197375580487019006702401282671268969358774635337351738915083955659230582177495821699251999928502338923489031347921151957398310960671307216790020399224115377846788378990638367296298663795893865325304226511
c1 = 74797173657575640598140788410852016843612519588375968190579734420951374103129570637822547217967978911328419808529204143522454142303138959013220811558490951614314306849367068478190797885056922705403028856734095288522290055309880572321557493798362056216783777593386133347693892941928131945986087712737862263761
c2 = 9209695919437085323423940852135308337887271742988391422139555924185234849146079306139570263602339983687993333013333937719071267190971983543492940032646907167417161479697805991443259327402389097539126399994414628326218438416138199892253597375493026563369334352434282120293396846427418323600336867792587721214
CoppersmithShortPadAttack(e, n, c1, c2, 1 / 80)