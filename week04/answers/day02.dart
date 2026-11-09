// 4주차 2일 해설 — 빈 목록과 평균
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 빈 목록인지 확인하지 않고 0으로 나누면 평균을 의미 있게 표시할 수 있나요?
// 예상 결과:
// 4.0
// 0.0

void main() {
  print(averageKm([2.0, 4.0, 6.0]));
  print(averageKm([]));
}

double averageKm(List<double> distances) {
  if (distances.isEmpty) return 0;
  var total = 0.0;
  for (final km in distances) {
    total += km;
  }
  return total / distances.length;
}
