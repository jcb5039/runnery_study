// 2주차 3일 해설 — 반복하면서 합계 쌓기
// 이 파일은 문제의 정답만 출력해요.
// total은 0 → 1 → 3 → 6 → 10 → 15로 변해요. 출력은 반복문 밖에서 한 번 해요.

void main() {
  final n = 5;
  var total = 0;
  for (var i = 1; i <= n; i++) {
    total += i;
  }
  print(total);
}
