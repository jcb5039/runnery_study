// 5주차 1일 해설 — 클래스와 객체
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 클래스를 정의한 줄과 객체를 만든 줄을 구분해 보세요.
// 예상 결과:
// 3.0

void main() {
  final record = PracticeRun();
  print(record.distanceKm);
}

class PracticeRun {
  double distanceKm = 3.0;
}
