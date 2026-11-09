// 3주차 1일 해설 — 함수 정의와 호출
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 정의는 파일 아래에 있어도 실행 순서는 main에서 호출한 순서를 따라요.
//            coolDown()을 먼저 호출했으니 '정리 운동'이 먼저 나와요. runRoutine 안에서 다시 coolDown을 호출해요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  showStart();
}

void showStart() {
  print('출발 준비 완료');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  showReady();
  showReady();
}

void showReady() {
  print('달릴 준비');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
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
}
