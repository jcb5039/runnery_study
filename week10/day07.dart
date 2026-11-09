// 10주차 7일 — 복습: 속도와 페이스
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week10/README.md의 "1~4번 섹션 전체" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print('거리 km, 시간 초, 속도 km/h, 페이스 초/km');

  // [한 줄씩 읽기]
  // 1. 단위를 먼저 적고 계산식을 구성하세요.
  // [예제 예상 출력]
  // 거리 km, 시간 초, 속도 km/h, 페이스 초/km

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] step1 안에서 d = Duration(seconds: 75)를 선언하세요.
//        분과 두 자리 초를 이어 '1:15'를 출력하세요. 초는 padLeft(2, '0')로 채워요.
// [예상 출력]
// --- 1단계 ---
// 1:15

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 d 선언과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] PracticeRun(double km, int seconds) 클래스를 정의하세요.
//        averageSpeed(double), paceSeconds(int) getter를 만들고 거리나 시간이 0 이하이면 둘 다 0을 반환하세요.
//        step2 안에서 PracticeRun(5.0, 1800)을 만들고 두 getter를 순서대로 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 10.0
// 360
// [값을 바꾸어 다시 실행] PracticeRun(0.0, 0)이면 0.0, 0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 PracticeRun(5.0, 1800)을 만들고 두 getter를 출력하세요.
}

// TODO ②: 여기에 PracticeRun 클래스를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 달리는 중 초시계 원본 ━━━━━━━━━━
// 3주차 7일에는 쉬운 문법으로 바꿔 읽었던 RunningFormat.clock을 이제 원본 그대로 읽어요.
//
//   static String _two(int n) => n.toString().padLeft(2, '0');
//   static String clock(Duration d) {
//     final h = d.inHours;
//     final m = d.inMinutes.remainder(60);
//     final s = d.inSeconds.remainder(60);
//     return h > 0 ? '$h:${_two(m)}:${_two(s)}' : '$m:${_two(s)}';
//   }
//
// 바로 아래 [주어진 코드]는 static만 뺀 원본이에요.
// [문제]
// (1) 실행 전에 clock(Duration(seconds: 1935)), clock(Duration(seconds: 3735)), clock(Duration(seconds: 59))의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) 3735초 한 번을 따라가며 h, m, s, _two(m), _two(s)의 값을 주석으로 적으세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 32:15
// 1:02:15
// 0:59

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
String _two(int n) => n.toString().padLeft(2, '0');

String clock(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes.remainder(60);
  final s = d.inSeconds.remainder(60);
  return h > 0 ? '$h:${_two(m)}:${_two(s)}' : '$m:${_two(s)}';
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// 실제 RunningRecord에서 같은 계산을 찾아 단위와 조건을 설명하세요.
