// 10주차 5일 — 삼항 연산자와 두 자리 표시
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week10/README.md의 "3. 삼항 연산자와 자릿수 채우기 — 5일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final exampleSeconds = 65;
  final rest = (exampleSeconds % 60).toString().padLeft(2, '0');
  final label = exampleSeconds > 0 ? '측정됨' : '미측정';
  print('$label 1:$rest');

  // [한 줄씩 읽기]
  // 1. toString()으로 숫자를 문자열로 바꿔요.
  // 2. padLeft(2, '0')가 왼쪽을 채워 두 자리로 만들어요.
  // 3. 조건 ? 참일 때 값 : 거짓일 때 값은 하나의 값을 골라요.
  // [예제 예상 출력]
  // 측정됨 1:05

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 n = 3을 선언하세요.
//        n.toString().padLeft(2, '0')와 n >= 5 ? '많음' : '적음'을 차례로 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 03
// 적음

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 n 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] String paceText(int seconds)를 정의하세요.
//        seconds <= 0이면 '--:--', 그 외에는 몫과 나머지를 이용해 분:두자리초를 반환하세요.
//        step2 안에서 paceText(365), paceText(0)을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 6:05
// --:--
// [값을 바꾸어 다시 실행] paceText(359)는 5:59예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 String paceText(int seconds)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록 목록의 페이스 글자 ━━━━━━━━━━
// 기록 목록 카드에 보이는 페이스 글자예요(record/models/running_record.dart).
//
//   String paceText(int seconds) =>
//       "${seconds ~/ 60}'${(seconds % 60).toString().padLeft(2, '0')}\"";
//   ...
//   String get paceLabel =>
//       distanceKm < .01 || movingSeconds == 0 ? '—' : paceText(paceSeconds);
//
// 읽는 법: 첫 함수는 365초를 6'05"처럼 바꿔요. 분 뒤에 ', 초 뒤에 "를 붙여요.
//   paceLabel은 거리가 0.01km보다 짧거나 시간이 0이면 '—', 아니면 그 글자를 골라요.
// 바로 아래 [주어진 코드]는 2단계 paceText와 이름이 겹치지 않게 quotePace로 바꾸고, getter를 함수로 바꾼 거예요.
// [문제]
// (1) 실행 전에 아래 세 값을 [내 예측]에 적으세요.
//       quotePace(365)
//       paceLabel(5.0, 1800, 360)
//       paceLabel(0.005, 30, 6000)
// (2) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) paceLabel(0.005, 30, 6000)은 왜 6000초를 쓰지 않고 '—'가 되나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 6'05"
// 6'00"
// —

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
String quotePace(int seconds) =>
    "${seconds ~/ 60}'${(seconds % 60).toString().padLeft(2, '0')}\"";

String paceLabel(double distanceKm, int movingSeconds, int paceSeconds) =>
    distanceKm < .01 || movingSeconds == 0 ? '—' : quotePace(paceSeconds);

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// 0을 0:00 대신 --:--로 표시하면 사용자에게 어떤 의미를 전달하나요?
