// 4주차 2일 — 빈 목록과 평균
// 실행 위치: ~/src/runnery-study
// 실행: dart run week04/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week04/README.md의 "1. List의 위치 번호와 길이 — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(exampleAverage([1.0, 3.0]));
  print(exampleAverage([]));

  // [한 줄씩 읽기]
  // 1. 함수가 List<double>을 받아요.
  // 2. isEmpty가 true면 나누기 전에 0을 반환해요.
  // 3. 합계를 length로 나눈 값이 평균이에요.
  // [예제 예상 출력]
  // 2.0
  // 0.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

double exampleAverage(List<double> values) {
  if (values.isEmpty) return 0;
  var total = 0.0;
  for (final value in values) {
    total += value;
  }
  return total / values.length;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] double firstOrZero(List<double> values)를 정의하세요.
//        목록이 비어 있으면 0을, 아니면 0번 칸의 값을 반환하세요.
//        step1 안에서 firstOrZero([3.5, 1.0])과 firstOrZero([])를 각각 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 3.5
// 0.0

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 double firstOrZero(List<double> values)를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] double averageKm(List<double> distances)를 정의하세요. 빈 목록이면 0을 반환하세요.
//        반복문으로 합계를 구하고 개수(length)로 나누세요.
//        step2 안에서 averageKm([2.0, 4.0, 6.0]), averageKm([])를 각각 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 4.0
// 0.0
// [값을 바꾸어 다시 실행] [5.0]은 5.0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 double averageKm(List<double> distances)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 최고 속도 ━━━━━━━━━━
// Runnery의 기록 모델(record/models/running_record.dart)에 최고 속도를 구하는 줄이 있어요.
//
//   double get maxSpeed => speeds.isEmpty ? 0 : speeds.reduce(math.max);
//
// 읽는 법: speeds(속도 목록)가 비어 있으면 0, 아니면 가장 큰 값을 돌려줘요.
//   get, ? :, reduce는 아직 안 배웠어요. 바로 아래 [주어진 코드]는 같은 일을 오늘 배운 문법으로 바꾼 거예요.
// [문제]
// (1) 실행 전에 maxSpeed([8.5, 11.2, 9.0])과 maxSpeed([])의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 두 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) maxSpeed([8.5, 11.2, 9.0])을 따라가며 반복마다 best가 어떻게 바뀌는지 적으세요.
// (4) if (speeds.isEmpty) return 0; 줄이 없으면 빈 목록에서 무엇이 문제일까요? (speeds[0])
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 11.2
// 0.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
double maxSpeed(List<double> speeds) {
  if (speeds.isEmpty) return 0;
  var best = speeds[0];
  for (final speed in speeds) {
    if (speed > best) {
      best = speed;
    }
  }
  return best;
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 maxSpeed([8.5, 11.2, 9.0])과 maxSpeed([])를 각각 출력하세요.
}

// [내 말로 설명]
// 빈 목록인지 확인하지 않고 0으로 나누면 평균을 의미 있게 표시할 수 있나요?
