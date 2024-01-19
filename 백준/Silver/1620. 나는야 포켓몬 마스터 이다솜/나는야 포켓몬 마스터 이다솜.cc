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
        try {
            int input = stoi(s);
            cout << mp[input] << "\n";
        } catch(std::invalid_argument&) {
            cout << mp2[s] << "\n";
        }
    }
}