#include <iostream>
using namespace std;

int main(int argc, char **argv)
{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int N, M;
    int sum = 0;
    int S[100001] = {0};
    int temp;

    cin >> N >> M;

    for (int i = 1; i <= N; i++)
    {
        cin >> temp;
        sum += temp;
        S[i] = sum;
    }

    for (int i = 0; i < M; i++)
    {
        int start, end;
        cin >> start >> end;
        cout << S[end] - S[start - 1] << "\n";
    }
}