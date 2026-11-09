// 3주차 7일 — 복습: 계산을 함수로 나누기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week03/day07.dart
// 정답은 answers/day07.dart에 있어요. 오늘은 예제를 보지 않고 풀어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 호출하는 자리(①)와 함수를 만드는 자리(②)가 붙어 있어요. 위로 다시 올라갈 필요 없어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print('호출 → 입력 → 계산 → 반환 → 출력');

  // [한 줄씩 읽기]
  // 1. 오늘은 안내 문장만 실행돼요.
  // 2. 아래 과제는 예제를 보지 않고 함수와 호출을 직접 작성해요.

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] int totalMeters(int first, int second)를 정의하고 두 값의 합을 반환하세요.
//        step1 안에서 totalMeters(1200, 800)을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 2000

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 totalMeters(1200, 800)을 print 안에 넣으세요.
}

// TODO ②: 여기에 int totalMeters(int first, int second)를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] double metersToKm(int meters)와 bool reached(double km, double target)을 정의하세요.
//        첫 함수는 km 변환, 두 번째 함수는 km >= target의 결과를 반환해요.
//        step2 안에서 meters = 3200, target = 3.0을 선언하세요.
//        metersToKm(meters)를 km에 저장하고 km, reached(km, target)을 차례로 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 3.2
// true
// [값을 바꾸어 다시 실행] meters를 1500으로 바꾸면 1.5와 false예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 meters, target을 선언하고 두 함수를 호출해 출력하세요.
}

// TODO ②: 여기에 double metersToKm(int meters)와 bool reached(double km, double target)을 정의하세요.

// ━━━━━━━━━━ 3단계: 함수가 함수를 부르는 코드 추적 ━━━━━━━━━━
// Runnery의 RunningFormat.clock은 달리는 중 초시계를 '32:15'처럼 보여줘요. 원본의 핵심은 이래요.
//
//   static String _two(int n) => n.toString().padLeft(2, '0');
//   ...
//   return h > 0 ? '$h:${_two(m)}:${_two(s)}' : '$m:${_two(s)}';
//
// 원본은 Duration과 padLeft(10주차)를 써요. 바로 아래 [주어진 코드]는 같은 일을
// 지금까지 배운 문법으로 바꾼 거예요. ~/는 몫, %는 나머지예요.
// [문제]
// (1) 실행 전에 clock(125), clock(600), clock(59)의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) clock(125) 한 번을 따라가며 아래 표를 주석으로 채우세요.
//     clock 정의 위치:            clock 호출 위치:
//     clock에 들어간 값:          minutes와 seconds:
//     two에 들어간 값:            two가 돌려준 값:
//     clock이 돌려준 값:
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 2:05
// 10:00
// 0:59

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
String two(int n) {
  if (n < 10) return '0$n';
  return '$n';
}

String clock(int totalSeconds) {
  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;
  return '$minutes:${two(seconds)}';
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// 각 함수의 정의 위치, 호출 위치, 입력, 반환값을 가리켜 보세요.
