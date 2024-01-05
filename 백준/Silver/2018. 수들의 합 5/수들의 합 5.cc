#include <iostream>
using namespace std;

int main() {

  int answer = 1;
  int N;
  int start_index = 1, end_index = 1;
  int sum = 1;
  cin >> N;

  while (end_index != N) {
    if (sum == N) {
      answer++;
      end_index++;
      sum += end_index;
    } else if (sum < N) {
      end_index++;
      sum += end_index;
    } else {
      sum -= start_index;
      start_index++;
    }
  }

  cout << answer;
}