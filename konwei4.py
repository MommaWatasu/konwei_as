import math
import gc
while True:
    i=n-1
    while True:
        if ft==math.factorial(n):
            break
        i=n-1
        while True:
            if i<0:
                i=n-1
            cycles[i]-=1
            if cycles[i]==0:
                indices[i:]=indices[i+1:]+indices[i:i+1]
                cycles[i]=n-i
                i-=1
            else:
                j=cycles[i]
                indices[i],indices[-j]=indices[-j],indices[i]
                i-=1
                ex_p=indices.copy()
                break
        c_ex=ex_p.copy()
        f=0
        ft+=1
        while True:
            a=ex_p[0]
            if a==1:
                break
            ex_p2=ex_p.copy()
            del ex_p2[a:n+1]
            ex_p2.reverse()
            a=0
            b=len(ex_p2)
            while True:
                ex_p[a]=ex_p2[a]
                a+=1
                if a==b:
                    break
            del ex_p2
            gc.collect()
            f+=1
        if f>L:
            bc_ex.clear()
        if f>=L:
            L=f
            numbers=[c_ex]
            bc_ex.extend(numbers)
            del numbers
            gc.collect()
    print("f(",n,")=",L,end='')
    print(bc_ex)
    bc_ex.clear()
    n+=1
