n = 153342396916538105228389844604657707491428056788672847550697727306332965113688161734184928502340063389805944751606853233980691631740462201365232680640173140929264281005775085463371950848223467977601447652530169573444881112823791610262204408257868244728097216834146410851717107402761308983285697611182983074893
hint = 3551084838077090433831900645555386063043442912976229080632434410289074664593196489335469532063370582988952492150862930160920594215273070573601780382407014
 
bits = 512
 
def get_pq(p,q, idx):
    t = p*q
    if t == n:
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1')
        print('p = ', p)
        print('q = ', q)
        exit()
        return True
    
    if idx>=bits//2:
        return False
    
    if t > n:
        return False
    
    if ((t^n)&((1<<idx)-1)) != 0:
        return False
 
    #中间全写1，不能小于n
    k = (1<<(bits - idx) ) -  (1<<idx)
    if (p+k)*(q+k) < n:
        return False 
    
    b1 = int(hint[idx])
    b2 = int(hint[-idx-1])
    bleft = 1<<(bits-idx-1)
    bright = 1<<idx
        
    '''
    if (b1 == 1) and (b2 == 1):
        get_pq(p + bleft + bright, q,                  idx+1)
        get_pq(p + bleft,          q + bleft,          idx+1)
        get_pq(p + bright,         q + bright,         idx+1)
        get_pq(p,                  q + bleft + bright, idx+1)
    elif (b1 == 0) and (b2 == 0):
        get_pq(p + bleft + bright, q + bleft + bright, idx+1)
        get_pq(p + bleft,          q + bright,         idx+1)
        get_pq(p + bright,         q + bleft,          idx+1)
        get_pq(p,                  q,                  idx+1)
    elif (b1 == 1) and (b2 == 0):
        get_pq(p + bleft + bright, q + bleft,          idx+1)
        get_pq(p + bleft,          q,                  idx+1)
        get_pq(p + bright,         q + bleft + bright, idx+1)
        get_pq(p,                  q + bright,         idx+1)
    elif (b1 == 0) and (b2 == 1):
        get_pq(p + bleft + bright, q + bright,         idx+1)
        get_pq(p + bleft,          q + bleft + bright, idx+1)
        get_pq(p + bright,         q,                  idx+1)
        get_pq(p,                  q + bleft,          idx+1)
    else:
        pass
    '''   
 
    way = [
        [[1,1,1,1],[1,0,0,1],[0,1,1,0],[0,0,0,0]],   #00左右都相同
        [[1,1,0,1],[1,0,1,1],[0,1,0,0],[0,0,1,0]],   #01左同右不同
        [[1,1,1,0],[1,0,0,0],[0,1,1,1],[0,0,0,1]],   #10右同左不同
        [[1,1,0,0],[1,0,1,0],[0,1,0,1],[0,0,1,1]],   #11左右都不同
    ]
    
    for v in way[b1*2+b2]:
        get_pq(p + v[0]*bleft + v[1]*bright, q + v[2]*bleft + v[3]*bright, idx+1)
 
    return False
        
    
hint = bin(hint)[2:].zfill(bits)
print('h:',hint)
p = (1<<(bits-1))+1
q = (1<<(bits-1))+1
get_pq(p,q,1)