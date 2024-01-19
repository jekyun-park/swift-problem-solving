#include <bits/stdc++.h>
using namespace std;
int N;
string p, f, pre, suf;
int main()
{
    cin >> N;
    cin >> p;
    
    int pos = p.find('*');
    pre = p.substr(0, pos);
    suf = p.substr(pos + 1);

    for (int i = 0; i < N; i++) {
        cin >> f;
        bool flag = true;
        if (pre.size()+suf.size()>f.size()) flag = false;
        else {
            if (!(pre == f.substr(0,pre.size()) && suf == f.substr(f.size()-suf.size()))) {
                flag = false;
            }
        }
        flag ? cout << "DA\n" : cout << "NE\n";
    }
}