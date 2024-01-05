#include <iostream>
using namespace std;

int main()
{
    int n;
    string numbers;

    cin >> n;
    cin >> numbers;

    int sum = 0;
    for (int i = 0; i < numbers.length(); i++)
    {
        sum += numbers[i] - '0';
    }
    cout << sum << endl;
    return 0;
}