import numpy as np

def count(num):
    fun = lambda n:np.prod (np.array(list(str(n)), dtype=np.int64))
    count = 0
    while True:
        count += 1
        num = fun(num)
        if num in list(range(10)): break
    return count

N=100000000
max_times = 1
for i in range(N):
     if '0' in str(i):
         continue
     else:
         times = count(i)
         if max_times < times:
             max_times = times
             print("i: {}  times: {}".format(i,times))
