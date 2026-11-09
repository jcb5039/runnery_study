// 3주차 4일 — 두 입력과 조건부 반환
// 실행 위치: ~/src/runnery-study
// 실행: dart run week03/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week03/README.md의 "2. 입력을 받고 값을 돌려주는 함수 — 2~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 호출하는 자리(①)와 함수를 만드는 자리(②)가 붙어 있어요. 위로 다시 올라갈 필요 없어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(exampleRemaining(8, 3));

  // [한 줄씩 읽기]
  // 1. 8이 goal, 3이 done으로 들어가요.
  // 2. done이 goal 이상이면 0을 반환하고 함수가 끝나요.
  // 3. 그 외에는 차이를 반환해요.
  // [예제 예상 출력]
  // 5

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

int exampleRemaining(int goal, int done) {
  if (done >= goal) return 0;
  return goal - done;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] int biggerKm(int a, int b)를 정의하세요. a가 b 이상이면 a를, 아니면 b를 반환하세요.
//        step1 안에서 biggerKm(3, 7), biggerKm(9, 2)를 각각 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 7
// 9

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 int biggerKm(int a, int b)를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] int remainingKm(int target, int total)을 정의하세요.
//        total이 target 이상이면 0, 아니면 target - total을 반환하세요.
//        step2 안에서 remainingKm(10, 6), remainingKm(10, 12)를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 4
// 0
// [값을 바꾸어 다시 실행] remainingKm(10, 10)은 0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 int remainingKm(int target, int total)을 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽고 옮기기 ━━━━━━━━━━
// Runnery의 RunningFormat.time은 기록 시각을 '오후 7:42'처럼 보여줘요. 그 안에 이런 두 줄이 있어요.
//
//   final period = t.hour < 12 ? '오전' : '오후';
//   final h = t.hour % 12 == 0 ? 12 : t.hour % 12;
//
// 읽는 법: t.hour는 0~23시예요. '조건 ? A : B'는 조건이 참이면 A, 아니면 B예요(10주차에 다시 배워요).
//   첫 줄: 12시 전이면 '오전', 아니면 '오후'
//   둘째 줄: 12로 나눈 나머지가 0이면 12, 아니면 그 나머지
// [문제]
// (1) 같은 규칙을 if와 return으로 두 함수에 옮기세요.
//     String period(int hour): hour가 12보다 작으면 '오전', 아니면 '오후'를 반환
//     int hour12(int hour): hour % 12가 0이면 12, 아니면 hour % 12를 반환
// (2) 실행 전에 9시, 19시, 12시, 0시가 각각 어떻게 표시될지 [내 예측]에 적으세요. 특히 12시와 0시를 주의해요.
// (3) step3 안에서 아래처럼 네 시각을 출력하세요. 같은 모양으로 19, 12, 0도 출력해요.
//       print('${period(9)} ${hour12(9)}시');
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 오전 9시
// 오후 7시
// 오후 12시
// 오전 12시

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 9, 19, 12, 0시를 차례로 출력하세요.
}

// TODO ②: 여기에 String period(int hour)와 int hour12(int hour)를 정의하세요.

// [내 말로 설명]
// 첫 번째 return 뒤의 코드는 그 호출에서 실행되나요?
