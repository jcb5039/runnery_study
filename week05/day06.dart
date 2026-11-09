// 5주차 6일 — import로 도구 가져오기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week05/README.md의 "4. static과 import — 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:math' as math;

void main() {
  // [짧은 실행 예제]
  print(math.max(2, 5));

  // [한 줄씩 읽기]
  // 1. 파일 맨 위 import가 Dart의 수학 도구를 가져와요.
  // 2. as math는 이 파일에서 쓸 이름이에요.
  // 3. math.max는 두 값 중 큰 값을 반환해요. 다른 날짜 파일은 가져오지 않아요.
  // [예제 예상 출력]
  // 5

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 math.sqrt(25)를 출력하세요. import는 이미 파일 맨 위에 있어요.
// [예상 출력]
// --- 1단계 ---
// 5.0

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 math.sqrt(25)를 print 안에 넣으세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 first = 4, second = 7을 선언하세요.
//        math.min으로 작은 값, math.max로 큰 값을 차례로 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 4
// 7
// [값을 바꾸어 다시 실행] 두 입력을 5, 5로 바꾸면 둘 다 5예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 first, second 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 최고 속도와 math.max ━━━━━━━━━━
// RunningRecord의 최고 속도 getter예요. 4주차 2일에는 반복문으로 바꿔 읽었어요.
//
//   import 'dart:math' as math;
//   ...
//   double get maxSpeed => speeds.isEmpty ? 0 : speeds.reduce(math.max);
//
// 읽는 법: 파일 맨 위에서 dart:math를 math라는 이름으로 가져와요. 그래서 math.max를 쓸 수 있어요.
//   reduce는 아직 안 배웠어요. 바로 아래 [주어진 코드]는 4주차의 fold와 math.max로 같은 일을 해요.
// [문제]
// (1) 실행 전에 maxSpeed([8.5, 11.2, 9.0])과 maxSpeed([])의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 두 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) maxSpeed([8.5, 11.2, 9.0])에서 best가 0 → ? → ? → ?로 바뀌는 과정을 적으세요.
// (4) 파일 맨 위 import 줄을 지우면 math.max에 어떤 빨간 줄이 생길까요? (확인 후 되돌려요)
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 11.2
// 0.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
double maxSpeed(List<double> speeds) {
  return speeds.fold<double>(0, (best, s) => math.max(best, s));
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// import와 객체 생성은 각각 어떤 역할인가요?
