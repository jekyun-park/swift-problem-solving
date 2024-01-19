// 9375_패션왕_신해빈.cpp
#include <bits/stdc++.h>
using namespace std;

int T;

int main() {
    cin >> T;
    for (int i = 0; i<T; i++) {
        int n, ans = 1;
        cin >> n;
        map<string, vector<string>> mp;

        for (int i=0; i<n; i++) {
            string c, s;
            cin >> c >> s;
            mp[s].push_back(c);
        }

        for (auto a : mp) {
            ans *= a.second.size() + 1;
        }
        cout << ans - 1 << "\n";
    }
}