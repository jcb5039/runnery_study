// 3주차 2일 해설 — print와 return
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: printTriple은 안에서 print를 해서 12가 보여요. 돌려주는 값은 없어요(void).
//            returnTriple은 12를 돌려주기만 해요. tripled + 1을 print해서 13이 보여요.
//            returnTriple(10);은 30을 돌려주지만 받아서 출력하는 코드가 없어서 아무것도 보이지 않아요.
//            void 함수는 돌려주는 값이 없어서 final wrong = printTriple(4);처럼 변수에 담을 수 없어요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final result = addTwo(5);
  print(result);
}

int addTwo(int number) {
  return number + 2;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final result = doubleNumber(6);
  print(result);
}

int doubleNumber(int number) {
  return number * 2;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
void printTriple(int n) {
  print(n * 3);
}

int returnTriple(int n) {
  return n * 3;
}

void step3() {
  print('--- 3단계 ---');
  printTriple(4);
  final tripled = returnTriple(4);
  print(tripled + 1);
  returnTriple(10);
}
