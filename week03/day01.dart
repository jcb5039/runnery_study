// 3주차 1일 — 함수 정의와 호출
// 실행 위치: ~/src/runnery-study
// 실행: dart run week03/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 호출하는 자리(①)와 함수를 만드는 자리(②)가 붙어 있어요. 위로 다시 올라갈 필요 없어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print('시작');
  showExample();
  print('끝');

  // [한 줄씩 읽기]
  // 1. print('시작')이 먼저 실행돼요.
  // 2. showExample()을 호출하면 아래 함수로 이동해요.
  // 3. 함수가 끝나면 호출 다음 줄로 돌아와 '끝'을 출력해요.
  // [예제 예상 출력]
  // 시작
  // 예제 함수
  // 끝

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

void showExample() {
  print('예제 함수');
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] void showStart()를 정의하고, 함수 안에서 '출발 준비 완료'를 출력하세요.
//        step1 안에서 showStart()를 한 번 호출하세요. 입력값과 반환값은 없어요.
// [예상 출력]
// --- 1단계 ---
// 출발 준비 완료

void step1() {
  print('--- 1단계 ---');
  showStart();
  // TODO ①: 여기서 showStart()를 호출하세요.
}

// TODO ②: 여기에 void showStart()를 정의하세요.
void showStart() {
  print('출발 준비 완료');
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] void showReady()를 정의하고, 함수 안에서 '달릴 준비'를 출력하세요.
//        step2 안에서 showReady()를 두 번 호출하세요. 입력값과 반환값은 없어요.
// [예상 출력]
// --- 2단계 ---
// 달릴 준비
// 달릴 준비
// [값을 바꾸어 다시 실행] 호출을 한 번으로 줄이면 달릴 준비도 한 번만 나와요.

void step2() {
  print('--- 2단계 ---');
  showReady();
  showReady();
  // TODO ①: 여기서 showReady()를 두 번 호출하세요.
}
void showReady() {
  print('달릴 준비');
}

// TODO ②: 여기에 void showReady()를 정의하세요.

// ━━━━━━━━━━ 3단계: 함수 안에서 함수 호출 읽기 ━━━━━━━━━━
// Runnery의 RunningFormat.fullDate 함수는 안에서 monthDay라는 다른 함수를 호출해요.
// 큰 코드에는 이렇게 함수가 함수를 부르는 모양이 많아요. 바로 아래 [주어진 코드]를 읽으세요.
// [문제]
// (1) 실행하기 전에, step3 안에서 아래 두 줄을 차례로 호출하면 무엇이 출력될지 [내 예측]에 적으세요.
//       coolDown();
//       runRoutine();
// (2) step3의 TODO에 두 줄을 그대로 작성하고 실행해서 예측과 비교하세요.
// (3) 정의는 runRoutine이 coolDown보다 아래에 있는데, 왜 '정리 운동'이 먼저 나오는지 설명하세요.
// [내 예측]
//정리운동 달리기
// [예상 출력]
// --- 3단계 ---
// 정리 운동
// 몸 풀기
// 달리기
// 정리 운동

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
void warmUp() {
  print('몸 풀기');
}

void coolDown() {
  print('정리 운동');
}

void runRoutine() {
  warmUp();
  print('달리기');
  coolDown();
}

void step3() {
  print('--- 3단계 ---');
  coolDown();
  runRoutine();
  // TODO ①: 여기서 coolDown()과 runRoutine()을 차례로 호출하세요.
}

// [내 말로 설명]
// 함수 정의를 읽는 것과 함수 호출을 실행하는 것은 어떻게 다른가요?
