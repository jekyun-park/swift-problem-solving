def solution(s):
    answer = 10000
    print("jegyun"[:2])
    for slice in range(1,int(len(s)/2)+1):
        
        cnt = 1
        sub = ''
        temp = s[:slice]
        
        for i in range(0,len(s),slice):
            if temp == s[i:i+slice] :
                cnt += 1
            else :
                if cnt == 1 :
                    sub += temp
                else :
                    sub = sub + str(cnt) + temp
                
                temp = s[i:i+slice]
                cnt = 1
        
        answer = min(answer,len(sub))    
        
    return answer