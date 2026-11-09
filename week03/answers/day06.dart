// 3주차 6일 해설 — 한 줄 함수와 일반 함수
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 5240 / 1000 = 5.24, 500 / 1000 = 0.5 → 소수 둘째 자리까지 맞춰 '0.50'.
//            314.6을 반올림하면 315, toString()으로 글자 '315'가 돼요.
//            kmText의 { return 식; }과 원본의 => 식 은 같은 뜻이에요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(plusFive(10));
}

int plusFive(int n) => n + 5;

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(square(4));
  print(squareShort(4));
}

int square(int number) {
  return number * number;
}

int squareShort(int number) => number * number;

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
void step3() {
  print('--- 3단계 ---');
  print(kmText(5240));
  print(kmText(500));
  print(kcalText(314.6));
}

String kmText(double meters) {
  return (meters / 1000).toStringAsFixed(2);
}

String kcalText(double kcal) => kcal.round().toString();
