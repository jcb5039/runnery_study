// 5주차 4일 해설 — getter로 계산한 값 읽기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 초를 시간으로 바꾸는 3600은 왜 필요한가요?
// 예상 결과:
// 6.0
// 0.0

void main() {
  print(PracticeRun(2.0, 1200).averageSpeed);
  print(PracticeRun(2.0, 0).averageSpeed);
}

class PracticeRun {
  final double distanceKm;
  final int seconds;
  PracticeRun(this.distanceKm, this.seconds);
  double get averageSpeed {
    if (seconds <= 0) return 0;
    return distanceKm / (seconds / 3600);
  }
}
