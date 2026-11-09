// 10주차 5일 해설 — 삼항 연산자와 두 자리 표시
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 0을 0:00 대신 --:--로 표시하면 사용자에게 어떤 의미를 전달하나요?
// 예상 결과:
// 6:05
// --:--

void main() {
  print(paceText(365));
  print(paceText(0));
}

String paceText(int seconds) {
  return seconds <= 0
      ? '--:--'
      : '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}';
}
