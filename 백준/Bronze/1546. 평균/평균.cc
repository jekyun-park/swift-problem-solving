#include <iostream>
using namespace std;

int main()
{
    int n;
    int scores[1000];

    cin >> n;
    for (int i = 0; i < n; i++)
    {
        cin >> scores[i];
    }

    long sum = 0;
    long max = 0;

    for (int i = 0; i < n; i++)
    {
        if (scores[i] > max)
        {
            max = scores[i];
        }
        sum += scores[i];
    }
    double result = sum * 100.0 / n / max;
    cout << result << endl;
    return 0;
}