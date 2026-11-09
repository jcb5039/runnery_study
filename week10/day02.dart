// 10주차 2일 — 시간의 길이
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week10/README.md의 "1. DateTime과 Duration — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final example = Duration(seconds: 125);
  print(example.inMinutes);
  print(example.inSeconds % 60);

  // [한 줄씩 읽기]
  // 1. Duration은 시간의 길이를 나타내요.
  // 2. inMinutes는 완성된 분의 수예요.
  // 3. 전체 초를 60으로 나눈 나머지가 남은 초예요.
  // [예제 예상 출력]
  // 2
  // 5

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 movie = Duration(minutes: 90)을 선언하세요.
//        movie.inHours와 movie.inMinutes % 60을 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 1
// 30

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 movie 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 duration = Duration(seconds: 185)를 선언하세요.
//        분과 남은 초를 구해 '3분 5초'를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 3분 5초
// [값을 바꾸어 다시 실행] 60초이면 1분 0초예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 duration 선언, 분과 초 계산, 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 한국어 시간 표시 ━━━━━━━━━━
// Runnery의 RunningFormat.koreanDuration이에요(home/running/running_start_page.dart).
//
//   static String koreanDuration(Duration d) {
//     final h = d.inHours;
//     final m = d.inMinutes.remainder(60);
//     final s = d.inSeconds.remainder(60);
//     return h > 0 ? '$h시간 $m분 $s초' : '$m분 $s초';
//   }
//
// 읽는 법: remainder(60)은 % 60과 같은 나머지예요. 1시간이 넘으면 시간까지, 아니면 분과 초만 써요.
//   마지막 줄의 ? :는 5일에 배워요. 바로 아래 [주어진 코드]는 그 줄을 if와 return으로 바꾼 거예요.
// [문제]
// (1) 실행 전에 koreanDuration(Duration(seconds: 1935))와 koreanDuration(Duration(seconds: 3735))의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 두 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) 3735초에서 m이 62가 아니라 2인 이유는 무엇인가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 32분 15초
// 1시간 2분 15초

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
String koreanDuration(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes.remainder(60);
  final s = d.inSeconds.remainder(60);
  if (h > 0) return '$h시간 $m분 $s초';
  return '$m분 $s초';
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// inSeconds와 남은 초는 왜 같지 않나요?
