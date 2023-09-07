def solution(arr1, arr2):
    
    n = len(arr1)
    m = len(arr1[0])
    
    answer = []
    
    for a,b in zip(arr1, arr2):
        sum = []
        for i in range(0, m):
            sum.append(a[i]+b[i])
        answer.append(sum)
        
        
    return answer