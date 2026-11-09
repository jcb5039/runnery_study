// 16주차 1일 — Git으로 변경 전후 확인하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week16/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week16/README.md의 "1. Git: 작업 파일 → 준비 → 기록 — 1일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final exampleKm = 2;
  print('${exampleKm}km');

  // [한 줄씩 읽기]
  // 1. 먼저 guides/git-practice.md의 별도 연습 저장소를 준비하세요.
  // 2. 이 파일을 그 저장소에 main.dart로 복사해 변경 전 기준을 커밋해요. 문제는 복사본에서 풀어요.
  // 3. git status는 바뀐 파일, git diff는 바뀐 줄을 보여줘요.
  // 4. 현재 학습 폴더나 Runnery의 브랜치를 바꾸는 실습이 아니에요.
  // [예제 예상 출력]
  // 2km

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 + git diff 보기 ━━━━━━━━━━
// [문제] step1 안에서 km = 3을 선언하고 '${km}km'를 출력하세요.
//        저장한 뒤 연습 폴더 터미널에서 git status와 git diff를 실행하세요.
//        diff에서 + 로 시작하는 줄이 방금 쓴 두 줄인지 확인해요.
// [예상 출력]
// --- 1단계 ---
// 3km

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 km 선언과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 + 커밋하기 ━━━━━━━━━━
// [문제] step2 안에서 km = 5를 선언하고 '기록: 5km'를 문자열 보간으로 출력하세요.
//        실행해서 확인한 뒤 git add main.dart → git diff --staged → git commit -m "거리 표시 연습" 순서로 기록하세요.
//        마지막에 git log --oneline -3으로 커밋이 생겼는지 봐요.
// [예상 출력]
// --- 2단계 ---
// 기록: 5km
// [값을 바꾸어 다시 실행] km를 3으로 바꾸고 git status를 보면 커밋 뒤에 고친 내용은 아직 기록되지 않았다고 나와요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 km 선언과 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: diff 읽기 — 고친 한 줄이 무엇을 바꾸나 ━━━━━━━━━━
// 누군가 Runnery의 RunningFormat.km을 아래처럼 고쳤다고 해 봐요. git diff로 보면 이렇게 나와요.
//
//   -  static String km(double meters) => (meters / 1000).toStringAsFixed(2);
//   +  static String km(double meters) => (meters / 1000).toStringAsFixed(1);
//
// 읽는 법: - 줄이 고치기 전, + 줄이 고친 뒤예요. 바뀐 곳은 괄호 안의 숫자 하나예요(3주차 6일 toStringAsFixed).
// 바로 아래 [주어진 코드]는 고치기 전과 후를 함수 두 개로 나란히 둔 거예요.
// [문제]
// (1) 실행 전에 kmBefore(5240), kmAfter(5240), kmBefore(500), kmAfter(500)의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 네 호출을 차례로 print 안에 넣어 실행하고 비교하세요.
// (3) 이 한 줄 변경이 화면의 어떤 글자에 영향을 줄지 한 문장으로 적어 보세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.24
// 5.2
// 0.50
// 0.5

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
String kmBefore(double meters) => (meters / 1000).toStringAsFixed(2);

String kmAfter(double meters) => (meters / 1000).toStringAsFixed(1);

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 네 호출을 차례로 print 안에 넣으세요.
}

// [내 말로 설명]
// 작업 파일, git add, 커밋의 차이를 자기 말로 설명하세요.
