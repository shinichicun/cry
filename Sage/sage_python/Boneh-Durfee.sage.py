

# This file was *autogenerated* from the file Boneh-Durfee.sage
from sage.all_cmdline import *   # import sage library

_sage_const_0xd231f2c194d3971821984dec9cf1ef58d538975f189045ef8a706f6165aab4929096f61a3eb7dd8021bf3fdc41fe3b3b0e4ecc579b4b5e7e035ffcc383436c9656533949881dca67c26d0e770e4bf62a09718dbabc2b40f2938f16327e347f187485aa48b044432e82f5371c08f6e0bbde46c713859aec715e2a2ca66574f3eb = Integer(0xd231f2c194d3971821984dec9cf1ef58d538975f189045ef8a706f6165aab4929096f61a3eb7dd8021bf3fdc41fe3b3b0e4ecc579b4b5e7e035ffcc383436c9656533949881dca67c26d0e770e4bf62a09718dbabc2b40f2938f16327e347f187485aa48b044432e82f5371c08f6e0bbde46c713859aec715e2a2ca66574f3eb); _sage_const_0x5b5961921a49e3089262761e89629ab6dff2da1504a0e5eba1bb7b20d63c785a013fd6d9e021c01baf1b23830954d488041b92bca2fe2c92e3373dedd7e625da11275f6f18ee4aef336d0637505545f70f805902ddbacb21bb8276d34a0f6dfe37ede87dd95bb1494dbb5763639ba3984240f1178e32aa36ee3c5fcc8115dde5 = Integer(0x5b5961921a49e3089262761e89629ab6dff2da1504a0e5eba1bb7b20d63c785a013fd6d9e021c01baf1b23830954d488041b92bca2fe2c92e3373dedd7e625da11275f6f18ee4aef336d0637505545f70f805902ddbacb21bb8276d34a0f6dfe37ede87dd95bb1494dbb5763639ba3984240f1178e32aa36ee3c5fcc8115dde5); _sage_const_0x6a88a8fa2b8f28d96284298bab2061efeb35e3a086370e19523c15c429f5d783b9d4f32e31a402916f45ad4f2760ab30e77177335af44756bfbeef0f168b5e0dc8c3ddf75d141c358969cca0e7c2b8ab99ef8e33b031be1cbccd95b687682ac7b0dcc0d56f5651ee671d6358128d2e0801f247a6af4fe0dc5e8fb199eba0780f = Integer(0x6a88a8fa2b8f28d96284298bab2061efeb35e3a086370e19523c15c429f5d783b9d4f32e31a402916f45ad4f2760ab30e77177335af44756bfbeef0f168b5e0dc8c3ddf75d141c358969cca0e7c2b8ab99ef8e33b031be1cbccd95b687682ac7b0dcc0d56f5651ee671d6358128d2e0801f247a6af4fe0dc5e8fb199eba0780f); _sage_const_7 = Integer(7); _sage_const_0 = Integer(0); _sage_const_1 = Integer(1); _sage_const_60 = Integer(60); _sage_const_2 = Integer(2); _sage_const_p216 = RealNumber('.216')
from Crypto.Util.number import *

N2=_sage_const_0xd231f2c194d3971821984dec9cf1ef58d538975f189045ef8a706f6165aab4929096f61a3eb7dd8021bf3fdc41fe3b3b0e4ecc579b4b5e7e035ffcc383436c9656533949881dca67c26d0e770e4bf62a09718dbabc2b40f2938f16327e347f187485aa48b044432e82f5371c08f6e0bbde46c713859aec715e2a2ca66574f3eb 
e2=_sage_const_0x5b5961921a49e3089262761e89629ab6dff2da1504a0e5eba1bb7b20d63c785a013fd6d9e021c01baf1b23830954d488041b92bca2fe2c92e3373dedd7e625da11275f6f18ee4aef336d0637505545f70f805902ddbacb21bb8276d34a0f6dfe37ede87dd95bb1494dbb5763639ba3984240f1178e32aa36ee3c5fcc8115dde5 
c2=_sage_const_0x6a88a8fa2b8f28d96284298bab2061efeb35e3a086370e19523c15c429f5d783b9d4f32e31a402916f45ad4f2760ab30e77177335af44756bfbeef0f168b5e0dc8c3ddf75d141c358969cca0e7c2b8ab99ef8e33b031be1cbccd95b687682ac7b0dcc0d56f5651ee671d6358128d2e0801f247a6af4fe0dc5e8fb199eba0780f 
"""
Setting debug to true will display more informations
about the lattice, the bounds, the vectors...
"""
debug = False

"""
Setting strict to true will stop the algorithm (and
return (-1, -1)) if we don't have a correct
upperbound on the determinant. Note that this
doesn't necesseraly mean that no solutions
will be found since the theoretical upperbound is
usualy far away from actual results. That is why
you should probably use `strict = False`
"""
strict = False

"""
This is experimental, but has provided remarkable results
so far. It tries to reduce the lattice as much as it can
while keeping its efficiency. I see no reason not to use
this option, but if things don't work, you should try
disabling it
"""
helpful_only = True
dimension_min = _sage_const_7   # stop removing if lattice reaches that dimension


############################################
# Functions
##########################################

# display stats on helpful vectors
def helpful_vectors(BB, modulus):
    nothelpful = _sage_const_0 
    for ii in range(BB.dimensions()[_sage_const_0 ]):
        if BB[ii, ii] >= modulus:
            nothelpful += _sage_const_1 

    print(nothelpful, "/", BB.dimensions()[_sage_const_0 ], " vectors are not helpful")


# display matrix picture with 0 and X
def matrix_overview(BB, bound):
    for ii in range(BB.dimensions()[_sage_const_0 ]):
        a = ('%02d ' % ii)
        for jj in range(BB.dimensions()[_sage_const_1 ]):
            a += '0' if BB[ii, jj] == _sage_const_0  else 'X'
            if BB.dimensions()[_sage_const_0 ] < _sage_const_60 :
                a += ' '
        if BB[ii, ii] >= bound:
            a += '~'
        print(a)


# tries to remove unhelpful vectors
# we start at current = n-1 (last vector)
def remove_unhelpful(BB, monomials, bound, current):
    # end of our recursive function
    if current == -_sage_const_1  or BB.dimensions()[_sage_const_0 ] <= dimension_min:
        return BB

    # we start by checking from the end
    for ii in range(current, -_sage_const_1 , -_sage_const_1 ):
        # if it is unhelpful:
        if BB[ii, ii] >= bound:
            affected_vectors = _sage_const_0 
            affected_vector_index = _sage_const_0 
            # let's check if it affects other vectors
            for jj in range(ii + _sage_const_1 , BB.dimensions()[_sage_const_0 ]):
                # if another vector is affected:
                # we increase the count
                if BB[jj, ii] != _sage_const_0 :
                    affected_vectors += _sage_const_1 
                    affected_vector_index = jj

            # level:0
            # if no other vectors end up affected
            # we remove it
            if affected_vectors == _sage_const_0 :
                # print("* removing unhelpful vector", ii)
                BB = BB.delete_columns([ii])
                BB = BB.delete_rows([ii])
                monomials.pop(ii)
                BB = remove_unhelpful(BB, monomials, bound, ii - _sage_const_1 )
                return BB

            # level:1
            # if just one was affected we check
            # if it is affecting someone else
            elif affected_vectors == _sage_const_1 :
                affected_deeper = True
                for kk in range(affected_vector_index + _sage_const_1 , BB.dimensions()[_sage_const_0 ]):
                    # if it is affecting even one vector
                    # we give up on this one
                    if BB[kk, affected_vector_index] != _sage_const_0 :
                        affected_deeper = False
                # remove both it if no other vector was affected and
                # this helpful vector is not helpful enough
                # compared to our unhelpful one
                if affected_deeper and abs(bound - BB[affected_vector_index, affected_vector_index]) < abs(
                        bound - BB[ii, ii]):
                    # print("* removing unhelpful vectors", ii, "and", affected_vector_index)
                    BB = BB.delete_columns([affected_vector_index, ii])
                    BB = BB.delete_rows([affected_vector_index, ii])
                    monomials.pop(affected_vector_index)
                    monomials.pop(ii)
                    BB = remove_unhelpful(BB, monomials, bound, ii - _sage_const_1 )
                    return BB
    # nothing happened
    return BB


""" 
Returns:
* 0,0   if it fails
* -1,-1 if `strict=true`, and determinant doesn't bound
* x0,y0 the solutions of `pol`
"""


def boneh_durfee(pol, modulus, mm, tt, XX, YY):
    """
    Boneh and Durfee revisited by Herrmann and May

    finds a solution if:
    * d < N^delta
    * |x| < e^delta
    * |y| < e^0.5
    whenever delta < 1 - sqrt(2)/2 ~ 0.292
    """

    # substitution (Herrman and May)
    PR = PolynomialRing(ZZ, names=('u', 'x', 'y',)); (u, x, y,) = PR._first_ngens(3)
    Q = PR.quotient(x * y + _sage_const_1  - u)  # u = xy + 1
    polZ = Q(pol).lift()

    UU = XX * YY + _sage_const_1 

    # x-shifts
    gg = []
    for kk in range(mm + _sage_const_1 ):
        for ii in range(mm - kk + _sage_const_1 ):
            xshift = x ** ii * modulus ** (mm - kk) * polZ(u, x, y) ** kk
            gg.append(xshift)
    gg.sort()

    # x-shifts list of monomials
    monomials = []
    for polynomial in gg:
        for monomial in polynomial.monomials():
            if monomial not in monomials:
                monomials.append(monomial)
    monomials.sort()

    # y-shifts (selected by Herrman and May)
    for jj in range(_sage_const_1 , tt + _sage_const_1 ):
        for kk in range(floor(mm / tt) * jj, mm + _sage_const_1 ):
            yshift = y ** jj * polZ(u, x, y) ** kk * modulus ** (mm - kk)
            yshift = Q(yshift).lift()
            gg.append(yshift)  # substitution

    # y-shifts list of monomials
    for jj in range(_sage_const_1 , tt + _sage_const_1 ):
        for kk in range(floor(mm / tt) * jj, mm + _sage_const_1 ):
            monomials.append(u ** kk * y ** jj)

    # construct lattice B
    nn = len(monomials)
    BB = Matrix(ZZ, nn)
    for ii in range(nn):
        BB[ii, _sage_const_0 ] = gg[ii](_sage_const_0 , _sage_const_0 , _sage_const_0 )
        for jj in range(_sage_const_1 , ii + _sage_const_1 ):
            if monomials[jj] in gg[ii].monomials():
                BB[ii, jj] = gg[ii].monomial_coefficient(monomials[jj]) * monomials[jj](UU, XX, YY)

    # Prototype to reduce the lattice
    if helpful_only:
        # automatically remove
        BB = remove_unhelpful(BB, monomials, modulus ** mm, nn - _sage_const_1 )
        # reset dimension
        nn = BB.dimensions()[_sage_const_0 ]
        if nn == _sage_const_0 :
            print("failure")
            return _sage_const_0 , _sage_const_0 

    # check if vectors are helpful
    if debug:
        helpful_vectors(BB, modulus ** mm)

    # check if determinant is correctly bounded
    det = BB.det()
    bound = modulus ** (mm * nn)
    if det >= bound:
        # print("We do not have det < bound. Solutions might not be found.")
        # print("Try with highers m and t.")
        if debug:
            diff = (log(det) - log(bound)) / log(_sage_const_2 )
            # print("size det(L) - size e^(m*n) = ", floor(diff))
        if strict:
            return -_sage_const_1 , -_sage_const_1 
    else:
        print("det(L) < e^(m*n) (good! If a solution exists < N^delta, it will be found)")

    # display the lattice basis
    if debug:
        matrix_overview(BB, modulus ** mm)

    # LLL
    if debug:
        print("optimizing basis of the lattice via LLL, this can take a long time")

    BB = BB.LLL()

    if debug:
        print("LLL is done!")

    # transform vector i & j -> polynomials 1 & 2
    if debug:
        print("looking for independent vectors in the lattice")
    found_polynomials = False

    for pol1_idx in range(nn - _sage_const_1 ):
        for pol2_idx in range(pol1_idx + _sage_const_1 , nn):
            # for i and j, create the two polynomials
            PR = PolynomialRing(ZZ, names=('w', 'z',)); (w, z,) = PR._first_ngens(2)
            pol1 = pol2 = _sage_const_0 
            for jj in range(nn):
                pol1 += monomials[jj](w * z + _sage_const_1 , w, z) * BB[pol1_idx, jj] / monomials[jj](UU, XX, YY)
                pol2 += monomials[jj](w * z + _sage_const_1 , w, z) * BB[pol2_idx, jj] / monomials[jj](UU, XX, YY)

            # resultant
            PR = PolynomialRing(ZZ, names=('q',)); (q,) = PR._first_ngens(1)
            rr = pol1.resultant(pol2)

            # are these good polynomials?
            if rr.is_zero() or rr.monomials() == [_sage_const_1 ]:
                continue
            else:
                # print("found them, using vectors", pol1_idx, "and", pol2_idx)
                found_polynomials = True
                break
        if found_polynomials:
            break

    if not found_polynomials:
        # print("no independant vectors could be found. This should very rarely happen...")
        return _sage_const_0 , _sage_const_0 

    rr = rr(q, q)

    # solutions
    soly = rr.roots()

    if len(soly) == _sage_const_0 :
        # print("Your prediction (delta) is too small")
        return _sage_const_0 , _sage_const_0 

    soly = soly[_sage_const_0 ][_sage_const_0 ]
    ss = pol1(q, soly)
    solx = ss.roots()[_sage_const_0 ][_sage_const_0 ]

    #
    return solx, soly


delta = _sage_const_p216   # this means that d < N^delta
m = _sage_const_7   # size of the lattice (bigger the better/slower)
t = int((_sage_const_1  - _sage_const_2  * delta) * m)  # optimization from Herrmann and May
X = _sage_const_2  * floor(N ** delta)  # this _might_ be too much
Y = floor(N ** (_sage_const_1  / _sage_const_2 ))  # correct if p, q are ~ same size
P = PolynomialRing(ZZ, names=('x', 'y',)); (x, y,) = P._first_ngens(2)
A = int((N + _sage_const_1 ) / _sage_const_2 )
pol = _sage_const_1  + x * (A + y)

solx, soly = boneh_durfee(pol, e, m, t, X, Y)

d = int(pol(solx, soly) / e)
print(d)
m = power_mod(c, d, N)
print(long_to_bytes(m))

