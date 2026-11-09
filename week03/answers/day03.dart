// 3주차 3일 해설 — 단위를 바꾸는 함수
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 입력은 칼로리(kcal), 반환값은 햇반 개수예요. 315kcal가 햇반 1개라서 630kcal는 2.0개예요.
//            Runnery 원본의 => kcal / RunningConfig.hetbahnKcal 은 { return kcal / 315.0; }과 같은 뜻이에요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(minutesToHours(90));
  print(minutesToHours(30));
}

double minutesToHours(int minutes) {
  return minutes / 60;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(metersToKm(1500));
  print(metersToKm(3200));
}

double metersToKm(int meters) {
  return meters / 1000;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
void step3() {
  print('--- 3단계 ---');
  print(hetbahnCount(315.0));
  print(hetbahnCount(630.0));
  print(hetbahnCount(157.5));
}

double hetbahnCount(double kcal) {
  return kcal / 315.0;
}
