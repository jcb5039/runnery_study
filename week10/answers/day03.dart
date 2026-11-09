// 10주차 3일 해설 — 평균 속도의 단위
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 속도가 두 배가 되는 입력 변화 한 가지를 설명하세요.
// 예상 결과:
// 10.0
// 0.0
// 0.0

void main() {
  print(averageSpeed(5.0, 1800));
  print(averageSpeed(0.0, 1800));
  print(averageSpeed(5.0, 0));
}

double averageSpeed(double km, int seconds) {
  if (km <= 0 || seconds <= 0) return 0;
  return km / (seconds / 3600);
}
