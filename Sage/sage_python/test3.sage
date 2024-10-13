# type:ignore
from Crypto.Util.number import *
import gmpy2
import re

m = 66
n = 200
p = 3
q = 2^20

with open ("D:\\SageMath\\sage_python\\enc.out","r") as f:
    data = f.read().split('\n')
    f.close()

A = matrix(m, n, [int(j) for i in data[1: m + 1] for j in re.findall(r'-?\d+', i)])
B = matrix(m, n, [int(j) for i in data[m + 1: 2 * m + 2] for j in re.findall(r'-?\d+', i)])
C = matrix(m, n, [int(j) for i in data[2 * m + 2: 3 * m + 3] for j in re.findall(r'-?\d+', i)])
b = vector([int(j) for i in data[3 * m + 3:] for j in re.findall(r'-?\d+', i)])

A = block_matrix([[B], [A], [C]])
M = block_matrix([[A, matrix(3 * m, 1, [0] * 3 * m)], [matrix(b), matrix([1])]])
e = M.LLL()[0][:n]
x = A.solve_left(b - e)
for i in x:
    print(chr(i),end="")
