// 10988_팰린드롬인지_확인하기.cpp
#include <bits/stdc++.h>
using namespace std;

int main() {
    string s,r;
    cin >> s;
    r = s;
    reverse(s.begin(), s.end());
    s.compare(r) == 0 ? cout << 1 : cout << 0;
    return 0;
}