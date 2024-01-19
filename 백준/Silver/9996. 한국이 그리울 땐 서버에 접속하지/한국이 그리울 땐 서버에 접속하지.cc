#include <bits/stdc++.h>
using namespace std;
int N;
string p, f, np;

int main()
{
    cin >> N;
    cin >> p;

    for (int i = 0; i < N;i++) {
        cin >> f;
        np = p;
        bool flag = true;

        if (p.size() != f.size()) {
            if (p.size() > f.size()) {
                np.erase(p.find('*'), 1);
                if (np != f) {
                    flag = false;
                }
            } else {
                int n = f.size() - p.size();
                string tmp = "";
                for (int i = 0; i < n;i++) tmp += '*';
                np.insert(p.find('*'), tmp);

                for (int i = 0; i < np.size();i++) {
                    if (np[i] != f[i]) {
                        if ((np[i] != '*') && np[i] != f[i]) {
                            flag = false;
                        } 
                    } 
                }
            }
        } else {
            for (int i = 0; i < np.size();i++) {
                if (np[i] != f[i]) {
                    if ((np[i] != '*') && np[i] != f[i]) {
                        flag = false;
                    } 
                } 
            }
        }

        flag ? cout << "DA\n" : cout << "NE\n";
    }
}