// 5주차 7일 해설 — 복습: 두 기록의 평균 속도
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 같은 getter가 서로 다른 값을 반환하는 이유를 객체의 필드로 설명하세요.
// 예상 결과:
// 6.0
// 10.0

void main() {
  final records = [
    PracticeRun(distanceKm: 2.0, seconds: 1200),
    PracticeRun(distanceKm: 5.0, seconds: 1800),
  ];
  for (final record in records) {
    print(record.averageSpeed);
  }
}

class PracticeRun {
  final double distanceKm;
  final int seconds;
  PracticeRun({required this.distanceKm, required this.seconds});
  double get averageSpeed {
    if (seconds <= 0) return 0;
    return distanceKm / (seconds / 3600);
  }
}
