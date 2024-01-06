#include<iostream>
#include<string>
using namespace std;

int main() {    
	int T;
    cin>>T;
    int N;
    string S;

    for(int i = 1; i <= T; ++i) {
        
        cin >> N;
        cin >> S;
        
        if (N%2==0 && S.substr(0, N/2).compare(S.substr(N/2)) == 0) {
            cout << "#" << i << " Yes\n";
            continue;
        }
        cout << "#" << i << " No\n";
	}
	
}