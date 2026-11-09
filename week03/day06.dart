// 3주차 6일 — 한 줄 함수와 일반 함수
// 실행 위치: ~/src/runnery-study
// 실행: dart run week03/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 호출하는 자리(①)와 함수를 만드는 자리(②)가 붙어 있어요. 위로 다시 올라갈 필요 없어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(exampleDouble(3));
  print(exampleDoubleShort(3));

  // [한 줄씩 읽기]
  // 1. 일반 함수는 중괄호 안의 return으로 값을 돌려줘요.
  // 2. => 뒤에는 하나의 식을 써요. 그 식의 결과가 반환돼요.
  // 3. 두 함수는 같은 입력에 같은 결과를 줘요.
  // [예제 예상 출력]
  // 6
  // 6

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

int exampleDouble(int n) {
  return n * 2;
}

int exampleDoubleShort(int n) => n * 2;

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] int plusFive(int n)을 => 모양으로 정의하세요. n에 5를 더한 값을 반환해요.
//        step1 안에서 plusFive(10)을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 15

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 plusFive(10)을 print 안에 넣으세요.
}

// TODO ②: 여기에 int plusFive(int n) => ... 를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] int square(int number)를 일반 함수로, int squareShort(int number)를 => 함수로 정의하세요.
//        두 함수 모두 number * number를 반환하세요. step2 안에서 각각 4를 전달하고 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 16
// 16
// [값을 바꾸어 다시 실행] 입력을 0으로 바꾸면 둘 다 0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 square(4), squareShort(4)를 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 int square(int number)와 int squareShort(int number)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽고 옮기기 ━━━━━━━━━━
// Runnery의 RunningFormat에는 => 로 쓴 한 줄 함수가 많아요. 기록 화면의 거리와 칼로리 글자를 만드는 두 줄이에요.
//
//   static String km(double meters) => (meters / 1000).toStringAsFixed(2);
//   static String kcal(double kcal) => kcal.round().toString();
//
// 읽는 법:
//   - 반환 타입이 String이에요. 숫자가 아니라 화면에 쓸 글자를 돌려줘요.
//   - toStringAsFixed(2): 소수 둘째 자리까지 맞춘 글자로 바꿔요. 0.5는 '0.50'이 돼요.
//   - round(): 가장 가까운 정수로 반올림해요. toString(): 숫자를 글자로 바꿔요.
// [문제]
// (1) String kmText(double meters)를 => 없이 { } 와 return을 쓰는 모양으로 정의하세요.
//     return 뒤에는 원본의 => 뒤에 있는 식을 그대로 써요.
// (2) String kcalText(double kcal)는 원본처럼 => 모양 그대로 정의하세요.
// (3) 실행 전에 kmText(5240), kmText(500), kcalText(314.6)의 결과를 [내 예측]에 적으세요.
// (4) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.24
// 0.50
// 315

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 String kmText(double meters)와 String kcalText(double kcal)를 정의하세요.

// [내 말로 설명]
// => 뒤에 return을 또 쓰지 않는 이유를 말해보세요.
