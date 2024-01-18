// 2979_트럭_주차.cpp
#include <bits/stdc++.h>
using namespace std;

int A, B, C, answer;
int a[101];

int main()
{
    cin >> A >> B >> C;

    for (int i = 0; i < 3; i++) {
        int start, end;
        cin >> start >> end;
        for (int j = start; j < end; j++) {
            a[j]++;
        }
    }

    for (int i = 1; i < 101; i++) {
        if (a[i] == 1) {
            answer += A;
        } else if (a[i] == 2) {
            answer += 2 * B;
        } else if (a[i] == 3) {
            answer += 3 * C;
        }
    }

    cout << answer;

    return 0;
}