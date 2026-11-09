// 3주차 4일 해설 — 두 입력과 조건부 반환
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 12시는 12보다 작지 않아서 '오후', 12 % 12는 0이라 12시예요.
//            0시는 12보다 작아서 '오전', 0 % 12도 0이라 12시예요. 그래서 자정은 '오전 12시'예요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(biggerKm(3, 7));
  print(biggerKm(9, 2));
}

int biggerKm(int a, int b) {
  if (a >= b) return a;
  return b;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(remainingKm(10, 6));
  print(remainingKm(10, 12));
}

int remainingKm(int target, int total) {
  if (total >= target) return 0;
  return target - total;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
void step3() {
  print('--- 3단계 ---');
  print('${period(9)} ${hour12(9)}시');
  print('${period(19)} ${hour12(19)}시');
  print('${period(12)} ${hour12(12)}시');
  print('${period(0)} ${hour12(0)}시');
}

String period(int hour) {
  if (hour < 12) return '오전';
  return '오후';
}

int hour12(int hour) {
  if (hour % 12 == 0) return 12;
  return hour % 12;
}
