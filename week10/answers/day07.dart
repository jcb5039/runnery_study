// 10주차 7일 해설 — 복습: 기록 계산 모델
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 실제 RunningRecord에서 같은 계산을 찾아 단위와 조건을 설명하세요.
// 예상 결과:
// 10.0
// 360

void main() {
  final record = PracticeRun(5.0, 1800);
  print(record.averageSpeed);
  print(record.paceSeconds);
}

class PracticeRun {
  final double km;
  final int seconds;
  PracticeRun(this.km, this.seconds);
  double get averageSpeed =>
      km <= 0 || seconds <= 0 ? 0 : km / (seconds / 3600);
  int get paceSeconds => km <= 0 || seconds <= 0 ? 0 : (seconds / km).round();
}
