// 3주차 3일 — 단위를 바꾸는 함수
// 실행 위치: ~/src/runnery-study
// 실행: dart run week03/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week03/README.md의 "2. 입력을 받고 값을 돌려주는 함수 — 2~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 호출하는 자리(①)와 함수를 만드는 자리(②)가 붙어 있어요. 위로 다시 올라갈 필요 없어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(secondsToMinutes(90));

  // [한 줄씩 읽기]
  // 1. 호출의 90이 seconds로 전달돼요.
  // 2. /는 나눗셈 결과를 double로 만들어요.
  // 3. return한 1.5를 print로 출력해요.
  // [예제 예상 출력]
  // 1.5

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

double secondsToMinutes(int seconds) {
  return seconds / 60;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] double minutesToHours(int minutes)를 정의하세요. 60으로 나눈 값을 반환하세요.
//        step1 안에서 minutesToHours(90), minutesToHours(30)을 각각 print 안에서 호출하세요.
// [예상 출력]
// --- 1단계 ---
// 1.5
// 0.5

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
  print(minutesToHours(90)); 
  print(minutesToHours(30));
}

// TODO ②: 여기에 double minutesToHours(int minutes)를 정의하세요.
double minutesToHours(int minutes) {
  return minutes / 60;
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] double metersToKm(int meters)를 정의하세요. 1000으로 나눈 값을 반환하세요.
//        step2 안에서 metersToKm(1500), metersToKm(3200)을 각각 print 안에서 호출하세요.
// [예상 출력]
// --- 2단계 ---
// 1.5
// 3.2
// [값을 바꾸어 다시 실행] 입력을 0과 500으로 바꾸면 0.0, 0.5예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
  print(metersToKm(1500));
  print(metersToKm(3200));
}

// TODO ②: 여기에 double metersToKm(int meters)를 정의하세요.
double metersToKm(int meters) {
  return meters / 1000;
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽고 옮기기 ━━━━━━━━━━
// Runnery의 home/running/running_start_page.dart에 아래 두 줄이 있어요.
//
//   static const hetbahnKcal = 315.0;   // 햇반 1개(210g) 칼로리
//   static double hetbahnCount(double kcal) => kcal / RunningConfig.hetbahnKcal;
//
// 읽는 법: static은 5주차, =>는 6일에 배워요. 지금은 이렇게 읽으면 돼요.
//   "double kcal을 입력으로 받아서, kcal을 315.0으로 나눈 값을 double로 돌려주는 hetbahnCount 함수"
// [문제]
// (1) double hetbahnCount(double kcal)를 { } 와 return을 쓰는 모양으로 정의하세요.
//     원본처럼 kcal을 315.0으로 나눈 값을 반환해요.
// (2) 실행 전에 hetbahnCount(315.0), hetbahnCount(630.0), hetbahnCount(157.5)의 결과를 [내 예측]에 적으세요.
// (3) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (4) 이 함수의 입력 단위와 반환값의 단위는 각각 무엇인가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 1.0
// 2.0
// 0.5

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
  print(hetbahnCount(315.0));
  print(hetbahnCount(630.0));
  print(hetbahnCount(157.5));

}

// TODO ②: 여기에 double hetbahnCount(double kcal)를 정의하세요.
double hetbahnCount(double kcal) {
  return kcal / 315.0;
}

// [내 말로 설명]
// 입력 단위와 반환값의 단위가 각각 무엇인가요?
