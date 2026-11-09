// 10주차 3일 — 속도 계산과 0 검사
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week10/README.md의 "2. 단위 바꾸기와 0으로 나누기 — 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(exampleSpeed(2.0, 1200));

  // [한 줄씩 읽기]
  // 1. seconds / 3600으로 초를 시간으로 바꿔요.
  // 2. km를 시간으로 나누면 km/h예요.
  // 3. 시간이 0 이하이면 먼저 0을 반환해요.
  // [예제 예상 출력]
  // 6.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

double exampleSpeed(double km, int seconds) {
  if (seconds <= 0) return 0;
  return km / (seconds / 3600);
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] double metersPerMinute(double meters, int seconds)를 정의하세요.
//        seconds <= 0이면 0을, 아니면 meters / (seconds / 60)을 반환해요.
//        step1 안에서 metersPerMinute(1500, 600)과 metersPerMinute(1500, 0)을 각각 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 150.0
// 0.0

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 double metersPerMinute(double meters, int seconds)를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] double averageSpeed(double km, int seconds)를 정의하세요.
//        km <= 0 또는 seconds <= 0이면 0을 반환하고, 그 외에는 km / (seconds / 3600)을 반환하세요.
//        step2 안에서 averageSpeed(5.0, 1800), averageSpeed(0.0, 1800), averageSpeed(5.0, 0)을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 10.0
// 0.0
// 0.0
// [값을 바꾸어 다시 실행] averageSpeed(3.0, 1800)은 6.0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 double averageSpeed(double km, int seconds)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 달리는 중 평균 속도 ━━━━━━━━━━
// 달리는 중 화면의 평균 속도 getter예요(home/running/running_start_page.dart의 RunningSession).
//
//   double get averageSpeedKmh {
//     final hours = movingDuration.inMilliseconds / Duration.millisecondsPerHour;
//     return hours == 0 ? 0 : distanceMeters / 1000 / hours;
//   }
//
// 읽는 법: 움직인 시간을 밀리초로 받아 1시간의 밀리초(3,600,000)로 나눠 "시간" 단위로 바꿔요.
//   거리(m)는 1000으로 나눠 km로 바꾼 뒤 시간으로 나눠요. 시간이 0이면 0이에요(? :는 5일).
// 바로 아래 [주어진 코드]는 getter를 입력 두 개 받는 함수로 바꾸고 ? :를 if로 쓴 거예요.
// [문제]
// (1) 실행 전에 아래 세 값을 [내 예측]에 적으세요.
//       Duration.millisecondsPerHour
//       averageSpeedKmh(5000, Duration(minutes: 30))
//       averageSpeedKmh(3000, Duration.zero)
// (2) step3 안에서 세 값을 차례로 출력하고 비교하세요.
// (3) distanceMeters / 1000 / hours에서 각 값의 단위를 m, km, 시간, km/h로 적어 보세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 3600000
// 10.0
// 0.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
double averageSpeedKmh(double distanceMeters, Duration moving) {
  final hours = moving.inMilliseconds / Duration.millisecondsPerHour;
  if (hours == 0) return 0;
  return distanceMeters / 1000 / hours;
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 값을 차례로 출력하세요.
}

// [내 말로 설명]
// 속도가 두 배가 되는 입력 변화 한 가지를 설명하세요.
