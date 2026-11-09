// 5주차 2일 해설 — 생성자와 this
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: this.distanceKm의 this는 어느 객체를 뜻하나요?
// 예상 결과:
// 2.0
// 5.0

void main() {
  final first = PracticeRun(2.0, 1200);
  final second = PracticeRun(5.0, 1800);
  print(first.distanceKm);
  print(second.distanceKm);
}

class PracticeRun {
  final double distanceKm;
  final int seconds;
  PracticeRun(this.distanceKm, this.seconds);
}
