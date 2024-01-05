#include <iostream>
#include <vector>
using namespace std;

int main() {
  ios::sync_with_stdio(false);
  cin.tie(NULL);
  cout.tie(NULL);

  int N, M;
  cin >> N >> M;

  // 크기가 N+1 이고, 모든 원소가 vector<int>(N+1, 0)으로 초기화된 벡터 선언
  // vector<int>(N+1, 0): 크기가 N+1 이고, 모든 원소가 0으로 초기화된 벡터 선언
  vector<vector<int> > A(N + 1, vector<int>(N + 1, 0));
  vector<vector<int> > S(N + 1, vector<int>(N + 1, 0));

  for (int i = 1; i <= N; i++) {
    for (int j = 1; j <= N; j++) {
      cin >> A[i][j];
      S[i][j] = S[i][j-1] + S[i-1][j] - S[i-1][j-1] + A[i][j];
    }
  }

  for (int i = 0; i < M; i++) {
    int x1, y1, x2, y2;
    cin >> x1 >> y1 >> x2 >> y2;
    
    int result = S[x2][y2] - S[x2][y1-1] - S[x1-1][y2] + S[x1-1][y1-1];
    cout << result << "\n";
  }
}