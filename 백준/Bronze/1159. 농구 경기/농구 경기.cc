// 1159_농구_경기.cpp
#include <bits/stdc++.h>
using namespace std;

int N;
int alphabets[26];
string s;
string ans = "";

int main() {
    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> s;
        alphabets[s[0] - 'a']++;
    }   

    for (int i = 0; i < 26; i++) {
        if (alphabets[i] > 4) ans += char(97 + i);
    }
    
    ans.length() == 0 ? cout << "PREDAJA" : cout << ans;
    return 0;
}