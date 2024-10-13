from Crypto.Util.number import *
with open("D:\\CTF\\ctf\\ctf_task\\XYCTF\\crypto\\bad\\out.txt","r") as f:
    data=f.readlines()
ms=eval(data[0][3:])
C1s=eval(data[1][4:])
C2s=eval(data[2][4:])
decs=eval(data[3][5:])
print(len(ms))
K = GF(0xfffffffffffffffffffffffffffffffeffffffffffffffff);a = K(0xfffffffffffffffffffffffffffffffefffffffffffffffc);b = K(0x64210519e59c80e70fa7e9ab72243049feb8deecc146b9b1)
E = EllipticCurve(K, (a, b))
G = E(0x188da80eb03090f67cbf20eb43a18800f4ff0afd82ff1012, 0x07192b95ffc8da78631011ed6b24cdd573f977a11e794811)
flag=''
for i in range(len(ms)):
    C1=E(C1s[i])
    C2=E(C2s[i])
    dec=E(decs[i])
    M=E(ms[i])
    D=dec+pow(2,i)*C1
    if D==M:
        flag=flag+'0'
    else:
        flag=flag+'1'
FLAG=int(flag[::-1],2)
print(long_to_bytes(FLAG))