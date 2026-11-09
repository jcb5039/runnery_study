// 3주차 2일 — print와 return
// 실행 위치: ~/src/runnery-study
// 실행: dart run week03/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week03/README.md의 "2. 입력을 받고 값을 돌려주는 함수 — 2~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 호출하는 자리(①)와 함수를 만드는 자리(②)가 붙어 있어요. 위로 다시 올라갈 필요 없어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = addOne(4);
  print(example);

  // [한 줄씩 읽기]
  // 1. addOne(4)의 4가 number에 들어가요.
  // 2. return number + 1이 5를 호출한 자리로 돌려줘요.
  // 3. example에 담긴 5를 print가 출력해요.
  // [예제 예상 출력]
  // 5

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

int addOne(int number) {
  return number + 1;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] int addTwo(int number)를 정의하세요. number에 2를 더한 값을 반환하세요.
//        step1 안에서 final result = addTwo(5);로 호출하고 result를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 7

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 addTwo(5)를 호출해 result에 담고 출력하세요.
  var result = addTwo(5);
  print(result);
}

// TODO ②: 여기에 int addTwo(int number)를 정의하세요.
int addTwo(int number) {
  return number + 2;
}


// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] int doubleNumber(int number)를 정의하세요. number의 두 배를 반환하세요.
//        step2 안에서 final result = doubleNumber(6);으로 호출하고 result를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 12
// [값을 바꾸어 다시 실행] 입력 6을 3으로 바꾸면 6이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 doubleNumber(6)을 호출해 result에 담고 출력하세요.
  var result = doubleNumber(6);
  print(result);
}

// TODO ②: 여기에 int doubleNumber(int number)를 정의하세요.
int doubleNumber(int number) {
  return number * 2;
}

// ━━━━━━━━━━ 3단계: 출력하는 함수와 돌려주는 함수 읽기 ━━━━━━━━━━
// Runnery의 RunningCalc.hetbahnCount는 계산한 값을 돌려주기만 하고 직접 출력하지 않아요.
// 화면의 Text가 그 값을 받아서 보여줘요. 바로 아래 [주어진 코드]의 두 함수를 비교하세요.
// [문제]
// (1) 실행하기 전에, step3 안에 아래 세 줄을 차례로 쓰면 무엇이 출력될지 [내 예측]에 적으세요.
//       printTriple(4);
//       final tripled = returnTriple(4);
//       print(tripled + 1);
// (2) step3의 TODO에 세 줄을 작성하고, 그 아래에 returnTriple(10); 한 줄을 더 쓰세요. 실행해서 비교하세요.
// (3) returnTriple(10);은 왜 아무것도 출력하지 않나요?
// (4) final wrong = printTriple(4);를 잠깐 써 보고 빨간 줄의 메시지를 읽은 뒤 지우세요. 왜 안 되나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 12
// 13

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
void printTriple(int n) {
  print(n * 3);
}

int returnTriple(int n) {
  return n * 3;
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 위 문제 (2)의 네 줄을 작성하세요.
  printTriple(4);
  final tripled = returnTriple(4);
  print(tripled + 1);
  returnTriple(10);
}

// [내 말로 설명]
// return만 쓰고 print를 지우면 콘솔에는 무엇이 보이나요?
