#11279.py
import sys
import heapq

n = int(sys.stdin.readline().strip())
arr = [0]

for i in range(n):
    num = int(sys.stdin.readline().strip())
    if (num == 0 and (len(arr) == 1)) :
        print(0)

    elif (num == 0 and (len(arr) != 1)):
        print(-heapq.heappop(arr))
    else :
        heapq.heappush(arr,-num)

        
