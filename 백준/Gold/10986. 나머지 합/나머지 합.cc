#include <iostream>
#include <vector>
using namespace std;

int main() {

    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int N, M;
    long answer = 0;
    cin >> N >> M;
    vector<long> S(N, 0);
    vector<long> C(M, 0);
    cin >> S[0];

    for (int i = 1; i < N; i++) {
        int temp = 0;
        cin >> temp;
        S[i] = S[i - 1] + temp;
    }

    for (int i = 0; i < N; i++) {
        int remainder = S[i] % M;
        if (remainder == 0) {
            answer++;
        }
        C[remainder]++;
    }

    for (int i = 0; i < M; i++) {
        if (C[i] > 1) {
          answer += (C[i] * (C[i] - 1) / 2);
        }
    }

    cout << answer << "\n";
}