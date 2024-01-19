#include <bits/stdc++.h>
using namespace std;

int N, K;

int main() {
    cin >> N >> K;
    int ans = -(100000 * 100)-4;
    vector<int> a = { 0 };
    vector<int> psum(N+1, 0);
    
    for (int i = 1; i <= N;i++) {
        int tmp;
        cin >> tmp;
        a.push_back(tmp);
        psum[i] = psum[i-1] + tmp;
    }

    for (int i = K; i <= N; i++) {
        ans = max(ans, psum[i] - psum[i-K]);
    }

    cout << ans;
}