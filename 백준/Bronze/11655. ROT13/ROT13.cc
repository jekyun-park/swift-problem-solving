// 11655_ROT13.cpp
#include <bits/stdc++.h>
using namespace std;

string s, ans="";

char ROT13(char c) {
    if (islower(c)) {
        return (c - 'a' + 13) % 26 + 'a';
    } else if (isupper(c)) {
        return (c - 'A' + 13) % 26 + 'A';
    } 
    return c;
}

int main() {
    getline(cin, s);
    for (char i: s) ans += ROT13(i);
    cout << ans;
}