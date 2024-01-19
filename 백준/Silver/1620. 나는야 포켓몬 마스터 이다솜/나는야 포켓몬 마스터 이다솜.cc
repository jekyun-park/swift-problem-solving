// 1620_나는야_포켓몬_마스터_이다솜.cpp
#include <bits/stdc++.h>
using namespace std;
int N, M;
map<int, string> mp;
map<string, int> mp2;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);cout.tie(NULL);
    cin >> N >> M;
    for (int i = 0; i < N;i++) {
        string tmp;
        cin >> tmp;
        mp[i + 1] = tmp;
        mp2[tmp] = i + 1;
    }

    for (int i = 0; i < M;i++) {
        string s;
        cin >> s;
        int idx = atoi(s.c_str());
        if (idx)
            cout << mp[idx] << "\n";
        else cout << mp2[s] << "\n"; 
    }
}