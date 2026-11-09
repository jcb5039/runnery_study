// 4주차 1일 해설 — 거리 목록 합산
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 목록의 [0]과 for-in의 km는 각각 무엇인가요?
// 예상 결과:
// 2.0
// 12.0

void main() {
  final distances = [2.0, 4.0, 6.0];
  var total = 0.0;
  for (final km in distances) {
    total += km;
  }
  print(distances[0]);
  print(total);
}
