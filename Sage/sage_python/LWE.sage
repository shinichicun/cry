# sage
from sage.all import *
from sage.modules.free_module_integer import IntegerLattice


key = [[185, 96, 351, 118, 421, 449, 350, 349, 388, 95, 341, 327, 29, 156, 399, 283, 292, 461, 445, 120, 126], [495, 358, 192, 300, 279, 277, 478, 335, 231, 241, 178, 314, 453, 251, 133, 391, 213, 132, 254, 388, 46], [428, 44, 100, 483, 12, 311, 57, 443, 289, 90, 478, 495, 399, 89, 324, 275, 322, 99, 343, 489, 133], [420, 358, 472, 260, 267, 136, 303, 491, 390, 248, 430, 117, 154, 244, 62, 217, 204, 334, 277, 231, 325], [11, 96, 61, 67, 456, 361, 292, 278, 424, 237, 345, 109, 475, 473, 29, 250, 195, 430, 114, 13, 199], [17, 91, 330, 73, 384, 134, 437, 161, 166, 185, 499, 491, 342, 129, 348, 162, 478, 216, 189, 311, 502], [396, 437, 98, 421, 120, 443, 113, 432, 9, 476, 243, 122, 416, 508, 287, 45, 84, 322, 504, 287, 251], [187, 489, 407, 204, 127, 10, 302, 101, 389, 113, 469, 184, 249, 131, 113, 18, 350, 106, 486, 406, 295], [265, 425, 30, 478, 471, 211, 162, 323, 163, 205, 187, 422, 452, 226, 230, 367, 478, 229, 365, 395, 294], [360, 193, 180, 253, 337, 453, 16, 352, 243, 107, 171, 46, 25, 234, 46, 479, 267, 267, 171, 188, 127], [379, 360, 109, 360, 403, 343, 75, 306, 138, 40, 41, 253, 428, 401, 464, 495, 21, 296, 319, 410, 440], [28, 209, 1, 233, 458, 266, 301, 359, 469, 304, 264, 368, 339, 25, 490, 343, 404, 488, 275, 262, 274], [180, 372, 133, 341, 29, 352, 326, 89, 323, 479, 68, 76, 247, 225, 159, 163, 180, 160, 171, 7, 322], [322, 295, 28, 467, 361, 169, 190, 71, 456, 140, 456, 202, 295, 424, 428, 18, 286, 233, 470, 303, 429], [234, 37, 128, 175, 282, 509, 54, 186, 177, 23, 348, 487, 473, 377, 81, 225, 154, 511, 364, 120, 280], [262, 82, 383, 490, 128, 448, 289, 420, 239, 374, 392, 149, 217, 398, 441, 480, 453, 503, 318, 285, 418], [0, 347, 223, 381, 469, 208, 424, 435, 404, 64, 107, 73, 490, 116, 445, 392, 194, 287, 66, 325, 261], [99, 26, 489, 114, 3, 351, 494, 174, 369, 354, 379, 187, 90, 202, 286, 37, 48, 397, 298, 65, 499], [455, 114, 349, 401, 5, 139, 314, 227, 134, 258, 270, 135, 287, 332, 298, 272, 167, 43, 271, 484, 177], [448, 78, 479, 324, 170, 7, 230, 173, 214, 65, 91, 497, 68, 391, 44, 205, 364, 471, 460, 312, 122], [452, 360, 448, 169, 240, 496, 302, 3, 354, 266, 46, 22, 151, 498, 461, 314, 169, 88, 30, 487, 258], [282, 222, 260, 503, 106, 420, 315, 307, 202, 238, 224, 329, 351, 190, 137, 294, 171, 309, 19, 186, 391], [69, 501, 283, 96, 159, 459, 437, 192, 293, 479, 79, 49, 299, 205, 177, 360, 36, 414, 118, 194, 270], [6, 419, 459, 254, 97, 455, 445, 239, 277, 278, 226, 23, 146, 151, 273, 378, 141, 281, 480, 388, 213], [181, 508, 347, 447, 467, 351, 503, 262, 375, 74, 49, 48, 364, 492, 400, 305, 25, 207, 278, 163, 11], [320, 94, 400, 15, 201, 53, 130, 137, 219, 57, 20, 239, 467, 352, 373, 395, 58, 4, 446, 332, 41], [205, 385, 446, 185, 470, 268, 308, 461, 265, 75, 75, 104, 108, 14, 334, 499, 207, 363, 94, 505, 363], [299, 292, 112, 203, 7, 240, 499, 343, 396, 482, 383, 61, 476, 101, 187, 265, 428, 53, 24, 342, 201], [421, 286, 305, 79, 324, 216, 163, 193, 362, 57, 472, 449, 169, 33, 280, 202, 237, 376, 382, 2, 1], [379, 33, 151, 51, 353, 295, 145, 220, 147, 251, 90, 344, 96, 31, 185, 250, 270, 420, 365, 373, 356], [228, 299, 87, 113, 458, 52, 26, 228, 294, 97, 384, 493, 380, 209, 257, 20, 375, 2, 316, 129, 492], [479, 346, 57, 488, 183, 185, 18, 422, 209, 318, 461, 159, 469, 145, 44, 58, 441, 490, 510, 194, 192], [254, 398, 510, 159, 371, 280, 331, 23, 99, 150, 175, 151, 42, 473, 164, 35, 97, 174, 115, 24, 270], [280, 76, 254, 293, 491, 76, 128, 301, 240, 357, 192, 372, 343, 34, 386, 468, 313, 41, 285, 507, 282], [271, 91, 507, 16, 128, 8, 326, 102, 355, 371, 313, 292, 433, 2, 459, 14, 258, 498, 146, 446, 309], [386, 88, 502, 4, 399, 272, 49, 69, 51, 465, 291, 289, 417, 271, 374, 337, 46, 393, 19, 429, 91], [407, 35, 337, 51, 41, 460, 222, 448, 499, 381, 59, 468, 440, 216, 86, 236, 91, 18, 123, 68, 145], [384, 30, 454, 419, 275, 164, 72, 195, 489, 458, 419, 148, 269, 150, 358, 188, 109, 27, 42, 34, 123], [500, 184, 195, 193, 68, 19, 329, 511, 280, 69, 113, 124, 102, 274, 43, 374, 408, 64, 314, 309, 473], [72, 145, 242, 2, 367, 371, 143, 166, 325, 74, 414, 94, 269, 196, 124, 94, 14, 351, 111, 465, 503], [70, 47, 439, 170, 306, 82, 233, 36, 346, 234, 157, 468, 83, 85, 424, 157, 258, 120, 270, 136, 286], [442, 173, 254, 271, 420, 507, 297, 473, 296, 511, 98, 133, 37, 498, 468, 17, 260, 318, 168, 490, 124], [50, 35, 252, 472, 406, 400, 439, 89, 309, 393, 332, 324, 260, 215, 8, 322, 357, 252, 124, 358, 457], [93, 102, 478, 224, 428, 10, 238, 368, 113, 502, 148, 7, 395, 97, 73, 306, 40, 395, 9, 254, 319], [282, 277, 295, 425, 59, 21, 136, 230, 207, 1, 29, 170, 14, 337, 371, 437, 359, 10, 100, 374, 24], [3, 270, 289, 179, 434, 489, 470, 343, 478, 156, 177, 72, 13, 266, 475, 23, 148, 102, 210, 270, 323], [464, 466, 277, 191, 426, 20, 266, 33, 41, 249, 452, 475, 265, 421, 282, 250, 233, 287, 495, 170, 300], [379, 35, 137, 106, 155, 81, 154, 382, 30, 237, 294, 478, 321, 384, 48, 111, 150, 4, 454, 446, 28], [57, 355, 94, 253, 297, 424, 415, 480, 68, 356, 415, 73, 41, 171, 491, 130, 92, 180, 506, 326, 463], [279, 43, 202, 35, 397, 257, 120, 11, 231, 369, 221, 332, 47, 236, 58, 278, 75, 117, 33, 130, 358], [142, 335, 339, 112, 38, 82, 426, 211, 174, 389, 137, 96, 431, 113, 112, 500, 145, 44, 313, 96, 187], [246, 211, 400, 415, 294, 234, 367, 46, 371, 479, 412, 197, 204, 498, 18, 140, 67, 237, 510, 457, 298], [258, 3, 136, 284, 149, 161, 456, 122, 114, 383, 251, 240, 453, 227, 330, 33, 241, 160, 306, 254, 409], [391, 115, 92, 102, 359, 182, 489, 313, 204, 275, 206, 447, 436, 286, 229, 377, 374, 162, 22, 384, 40], [427, 491, 362, 240, 358, 296, 154, 178, 278, 284, 324, 422, 52, 295, 490, 56, 39, 378, 174, 202, 496], [29, 454, 436, 6, 287, 82, 154, 474, 92, 272, 400, 238, 352, 140, 386, 504, 19, 32, 334, 30, 450], [469, 123, 353, 422, 175, 260, 294, 18, 268, 479, 60, 114, 456, 55, 403, 446, 166, 259, 294, 215, 48], [404, 187, 426, 362, 296, 239, 226, 416, 306, 336, 1, 448, 47, 403, 367, 357, 501, 425, 310, 41, 303], [339, 115, 478, 416, 10, 90, 188, 229, 217, 441, 288, 152, 394, 219, 422, 376, 325, 375, 6, 454, 238], [226, 226, 149, 107, 418, 419, 209, 108, 87, 127, 202, 320, 179, 234, 87, 335, 195, 5, 273, 142, 115], [464, 177, 77, 101, 76, 19, 73, 397, 296, 34, 360, 107, 491, 460, 510, 342, 198, 118, 105, 337, 239], [464, 25, 191, 113, 455, 129, 247, 488, 303, 27, 242, 423, 336, 125, 283, 332, 244, 372, 175, 276, 49], [211, 367, 406, 314, 177, 496, 320, 385, 193, 51, 423, 80, 258, 44, 154, 362, 215, 296, 260, 424, 160], [384, 161, 92, 402, 414, 443, 129, 279, 272, 224, 294, 319, 75, 169, 242, 85, 315, 402, 4, 268, 88]]
c1 = [1702, 795, 740, 373, 535, 1308, 1050, 502, 40, 672, 1354, 1843, 515, 231, 774, 65, 978, 1340, 455, 2137, 733, 307, 1604, 723, 1023, 1253, 275, 1817, 404, 2035, 267, 1475, 14, 2127, 15, 487, 317, 757, 290, 541, 100, 951, 2049, 1042, 1404, 1676, 655, 1460, 1532, 273, 916, 1454, 1690, 1628, 1751, 1656, 139, 156, 2102, 264, 243, 455, 1564, 2072]
c2 = [884, 1584, 681, 1713, 1916, 609, 1840, 177, 1723, 1049, 254, 864, 1671, 121, 2021, 1353, 1290, 1891, 556, 1786, 1553, 1548, 727, 1967, 1800, 422, 1559, 1290, 642, 1406, 441, 1928, 395, 279, 1125, 1273, 99, 1131, 395, 76, 733, 416, 924, 571, 506, 822, 877, 887, 860, 1755, 1385, 1861, 1754, 1851, 1046, 1724, 1866, 1427, 378, 351, 146, 1367, 756, 505]

prime = 2141

K = matrix(Zmod(prime), key[:21])
C1 = vector(Zmod(prime), c1[:21])
m1 = K.solve_right(C1)   # K.inverse() * C1
flag = ''
for i in m1:
    flag += chr(i)
# print(flag)


# Babai's Nearest Plane algorithm
def Babai_closest_vector(M, G, target):
    small = target
    for _ in range(5):
        for i in reversed(range(M.nrows())):
            c = ((small * G[i]) / (G[i] * G[i])).round()
            small -= M[i] * c
    return target - small


m = 64
n = 21
q = prime

A_values = key
b_values = c2

A = matrix(ZZ, m + n, m)
for i in range(m):
    A[i, i] = q
for x in range(m):
    for y in range(n):
        A[m + y, x] = A_values[x][y]
lattice = IntegerLattice(A, lll_reduce=True)
# print("LLL done")
gram = lattice.reduced_basis.gram_schmidt()[0]
target = vector(ZZ, b_values)
res = Babai_closest_vector(lattice.reduced_basis, gram, target)
# print("Closest Vector: {}".format(res))

R = IntegerModRing(q)
M = Matrix(R, A_values)
ingredients = M.solve_right(res)

# print("Ingredients: {}".format(ingredients))

for i in ingredients:
    flag += chr(i)
print(flag)
