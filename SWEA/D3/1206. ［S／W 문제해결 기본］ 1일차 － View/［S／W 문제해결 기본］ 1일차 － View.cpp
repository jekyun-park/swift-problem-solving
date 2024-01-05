#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

int main()
{
    for (int i = 0; i<10; i++) {
        
        int N;
        cin >> N;
        int answer = 0;
        vector<int> building(N,0);
        
        for(int i = 0; i < N; i++) {
            cin >> building[i];
        }
        
        for(int i=2; i < N-2; i++) {
            if (building[i] == 0) { continue; }
            int l1 = building[i] - building[i-1];
            int l2 = building[i] - building[i-2];
            int r1 = building[i] - building[i+1];
            int r2 = building[i] - building[i+2];
            
            if ( (l1>0) && (l2>0) && (r1>0) && (r2>0)) {
                answer += min({l1, l2, r1, r2});
            }
        }
        
        cout << "#" << i+1 << " " << answer << "\n";
    }
}