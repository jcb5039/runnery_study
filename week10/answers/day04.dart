// 10주차 4일 해설 — 페이스와 round
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 속도와 페이스 중 숫자가 작아질수록 더 빠른 것은 어느 쪽인가요?
// 예상 결과:
// 360
// 0

void main() {
  print(paceSeconds(5.0, 1800));
  print(paceSeconds(0.0, 1800));
}

int paceSeconds(double km, int seconds) {
  if (km <= 0 || seconds <= 0) return 0;
  return (seconds / km).round();
}
