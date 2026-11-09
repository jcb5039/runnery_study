// 5주차 3일 해설 — 객체 안의 함수: 메서드
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: label()은 별도 입력 없이 어떤 값을 읽나요?
// 예상 결과:
// 3.0km

void main() {
  final record = PracticeRun(3.0);
  print(record.label());
}

class PracticeRun {
  final double distanceKm;
  PracticeRun(this.distanceKm);
  String label() => '${distanceKm}km';
}
