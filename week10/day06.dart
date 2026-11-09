// 10주차 6일 — 값이 없을 때의 대체 값
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week10/README.md의 "4. 값이 있으면 쓰고, 없으면 다른 값 — 6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(exampleSeconds(2, 2500));
  print(exampleSeconds(2, null));

  // [한 줄씩 읽기]
  // 1. int? millis는 없을 수도 있는 정밀 시간이에요.
  // 2. 값이 있으면 1000으로 나누어 초로 바꿔요.
  // 3. 없으면 기존 초를 double로 바꿔 사용해요.
  // [예제 예상 출력]
  // 2.5
  // 2.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

double exampleSeconds(int seconds, int? millis) {
  if (millis != null) return millis / 1000;
  return seconds.toDouble();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] int total(int base, int? bonus)를 정의하세요.
//        bonus != null ? base + bonus : base를 반환해요.
//        step1 안에서 total(100, 20)과 total(100, null)을 각각 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 120
// 100

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 int total(int base, int? bonus)를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] double effectiveSeconds(int seconds, int? milliseconds)를 정의하세요.
//        milliseconds가 null이 아니면 / 1000, 없으면 seconds.toDouble()을 반환하세요.
//        step2 안에서 effectiveSeconds(1, 1500), effectiveSeconds(1, null)을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 1.5
// 1.0
// [값을 바꾸어 다시 실행] effectiveSeconds(2, 0)은 이 실습 규칙상 0.0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 double effectiveSeconds(int seconds, int? milliseconds)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 정밀 시간이 있으면 먼저 쓰기 ━━━━━━━━━━
// RunningRecord의 실제 평균 속도 계산이에요(record/models/running_record.dart).
//
//   final int? movingMilliseconds;
//   double get _movingSeconds =>
//       (movingMilliseconds ?? movingSeconds * 1000) / 1000;
//   double get averageSpeed =>
//       _movingSeconds > 0 ? distanceKm / _movingSeconds * 3600 : 0;
//
// 읽는 법: 밀리초 기록이 있으면 그걸, 없으면 초 × 1000을 써서 다시 초로 바꿔요.
//   이름 앞의 _는 "이 파일 안에서만 쓰는 이름"이라는 표시예요. 그 외에는 보통 getter와 같아요.
// 바로 아래 [주어진 코드]는 필드 세 개만 남긴 거예요.
// [문제]
// (1) 실행 전에 아래 세 값을 [내 예측]에 적으세요.
//       RecordLite(5.0, 1800).averageSpeed
//       RecordLite(5.0, 1800, movingMilliseconds: 1440000).averageSpeed
//       RecordLite(0.0, 0).averageSpeed
// (2) step3 안에서 세 값을 차례로 출력하고 비교하세요.
// (3) 두 번째 객체는 movingSeconds가 1800인데 왜 1800초로 계산하지 않나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 10.0
// 12.5
// 0.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class RecordLite {
  RecordLite(this.distanceKm, this.movingSeconds, {this.movingMilliseconds});

  final double distanceKm;
  final int movingSeconds;
  final int? movingMilliseconds;

  double get _movingSeconds =>
      (movingMilliseconds ?? movingSeconds * 1000) / 1000;
  double get averageSpeed =>
      _movingSeconds > 0 ? distanceKm / _movingSeconds * 3600 : 0;
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 averageSpeed를 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// null과 0을 같은 것으로 취급하지 않는 이유를 설명하세요.
