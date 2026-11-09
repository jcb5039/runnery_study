// 5주차 6일 해설 — import로 도구 가져오기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: best는 0 → 8.5 → 11.2 → 11.2예요. 빈 목록은 처음 값 0이 그대로 나와요.
//            import가 없으면 math라는 이름을 몰라서 실행 전에 오류가 나요.

import 'dart:math' as math;

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(math.sqrt(25));
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final first = 4;
  final second = 7;
  print(math.min(first, second));
  print(math.max(first, second));
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
double maxSpeed(List<double> speeds) {
  return speeds.fold<double>(0, (best, s) => math.max(best, s));
}

void step3() {
  print('--- 3단계 ---');
  print(maxSpeed([8.5, 11.2, 9.0]));
  print(maxSpeed([]));
}
