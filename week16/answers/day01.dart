// 16주차 1일 해설 — Git으로 변경 전후 확인하기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 소수 자리 수가 2에서 1로 줄어 5.24 → 5.2, 0.50 → 0.5가 돼요.
//            기록 화면과 달리기 화면의 거리 글자가 모두 한 자리로 보이게 바뀌어요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final km = 3;
  print('${km}km');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final km = 5;
  print('기록: ${km}km');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
String kmBefore(double meters) => (meters / 1000).toStringAsFixed(2);

String kmAfter(double meters) => (meters / 1000).toStringAsFixed(1);

void step3() {
  print('--- 3단계 ---');
  print(kmBefore(5240));
  print(kmAfter(5240));
  print(kmBefore(500));
  print(kmAfter(500));
}
