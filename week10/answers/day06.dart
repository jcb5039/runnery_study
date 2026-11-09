// 10주차 6일 해설 — 밀리초가 있으면 우선 사용하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: null과 0을 같은 것으로 취급하지 않는 이유를 설명하세요.
// 예상 결과:
// 1.5
// 1.0

void main() {
  print(effectiveSeconds(1, 1500));
  print(effectiveSeconds(1, null));
}

double effectiveSeconds(int seconds, int? milliseconds) {
  if (milliseconds != null) return milliseconds / 1000;
  return seconds.toDouble();
}
