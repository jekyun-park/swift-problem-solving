// 2309. 일곱 난쟁이
#include <bits/stdc++.h>
using namespace std;

int main()
{
    vector<int> a;

    for (int i = 0; i < 9; i++) {
        int tmp;
        cin >> tmp;
        a.push_back(tmp);
    }

    sort(a.begin(), a.end());

    do {
        int tmp = 0;
        for (int i = 0; i < 7; i++) {
            tmp += a[i];
        }
        if (tmp == 100)
            break;
    } while (next_permutation(a.begin(), a.end()));

    for (int i = 0; i < 7; i++)
        cout << a[i] << "\n";

    return 0;
}