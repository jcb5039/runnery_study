// 10주차 4일 — 페이스 계산
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week10/README.md의 "2. 단위 바꾸기와 0으로 나누기 — 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final examplePace = 1000 / 3;
  print(examplePace.round());

  // [한 줄씩 읽기]
  // 1. 시간(초)을 거리(km)로 나누면 1km당 초예요.
  // 2. round()는 가장 가까운 정수로 반올림해요.
  // [예제 예상 출력]
  // 333

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 (1000 / 6).round()와 (7 / 2).round()를 각각 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 167
// 4

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 두 값을 각각 print 안에 넣으세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] int paceSeconds(double km, int seconds)를 정의하세요.
//        거리나 시간이 0 이하이면 0을 반환하고, 그 외에는 (seconds / km).round()를 반환하세요.
//        step2 안에서 paceSeconds(5.0, 1800), paceSeconds(0.0, 1800)을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 360
// 0
// [값을 바꾸어 다시 실행] paceSeconds(3.0, 1000)은 333이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 int paceSeconds(double km, int seconds)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 너무 짧으면 페이스 없음 ━━━━━━━━━━
// Runnery의 RunningCalc.paceSecondsPerKm이에요(home/running/running_start_page.dart).
//
//   static const minDistanceForPaceMeters = 10.0;   // RunningConfig 안
//   ...
//   static double? paceSecondsPerKm(double meters, Duration duration) {
//     if (meters < RunningConfig.minDistanceForPaceMeters) return null;
//     return duration.inMilliseconds / 1000 / (meters / 1000);
//   }
//
// 읽는 법: 10m보다 짧게 달렸으면 페이스를 계산하지 않고 null(값 없음)을 돌려줘요. 반환 타입이 double?예요.
//   그 외에는 (초) ÷ (km) = 1km당 초예요. 바로 아래 [주어진 코드]는 static만 뺀 거예요.
// [문제]
// (1) 실행 전에 아래 세 값을 [내 예측]에 적으세요.
//       paceSecondsPerKm(5000, Duration(minutes: 30))
//       paceSecondsPerKm(8, Duration(seconds: 20))
//       paceSecondsPerKm(2000, Duration(seconds: 700))
// (2) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) 0이 아니라 null을 돌려주면 화면에서 어떤 차이를 표시할 수 있나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 360.0
// null
// 350.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
const minDistanceForPaceMeters = 10.0;

double? paceSecondsPerKm(double meters, Duration duration) {
  if (meters < minDistanceForPaceMeters) return null;
  return duration.inMilliseconds / 1000 / (meters / 1000);
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// 속도와 페이스 중 숫자가 작아질수록 더 빠른 것은 어느 쪽인가요?
