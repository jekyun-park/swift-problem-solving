// 10808_알파벳_개수.cpp
#include <bits/stdc++.h>
using namespace std;

int main()
{
    int alphabets[26];
    for (int i = 0; i < 26; i++)
        alphabets[i] = 0;

    string s;
    cin >> s;

    for (char i : s)
        alphabets[int(i) - 97] += 1;
    for (int i : alphabets)
        cout << i << " ";

    return 0;
}