// 5주차 6일 해설 — import로 도구 가져오기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: import와 객체 생성은 각각 어떤 역할인가요?
// 예상 결과:
// 4
// 7

import 'dart:math' as math;

void main() {
  final first = 4;
  final second = 7;
  print(math.min(first, second));
  print(math.max(first, second));
}
