// 6주차 2일 — 값이 있을 때만 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week06/README.md의 "2. 값이 있을 때만 읽기 `?.`, 단정하기 `!` — 2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  print(exampleLength(null));
  print(exampleLength('아침'));

  // [한 줄씩 읽기]
  // 1. String? 매개변수에는 null도 전달할 수 있어요.
  // 2. ?.length는 값이 있을 때만 길이를 읽어요. 없으면 null이에요.
  // 3. ?? 0이 null을 0으로 바꿔요.
  // [예제 예상 출력]
  // 0
  // 2

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

int exampleLength(String? text) => text?.length ?? 0;

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] int? nameLength(String? name) => name?.length;를 정의하세요. ??는 붙이지 않아요.
//        step1 안에서 nameLength(null), nameLength('가나다라')를 각각 출력하세요.
// [예상 출력]
// --- 1단계 ---
// null
// 4

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 int? nameLength(String? name)을 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] int memoLength(String? memo)를 정의하고 memo?.length ?? 0을 반환하세요.
//        step2 안에서 memoLength(null), memoLength('달리기')를 출력하세요. !는 쓰지 마세요.
// [예상 출력]
// --- 2단계 ---
// 0
// 3
// [값을 바꾸어 다시 실행] ''를 전달하면 0이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기서 두 호출을 각각 print 안에 넣으세요.
}

// TODO ②: 여기에 int memoLength(String? memo)를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 입력 칸 다듬기 ━━━━━━━━━━
// Runnery 회원가입 화면(login/sign_up/account.dart)은 입력 칸의 글자를 이렇게 다듬어요.
//
//   final value = v?.trim() ?? '';
//
// 읽는 법: v는 입력 칸의 글자인데 없을 수도 있어서 String?예요.
//   v가 있으면 trim()으로 양끝 공백을 지우고, 없으면(null) 빈 글자를 써요.
// 바로 아래 [주어진 코드]는 이 한 줄에 결과를 [ ]로 감싸 보여주는 return만 더한 함수예요.
// [문제]
// (1) 실행 전에 cleanInput('  runner  '), cleanInput(null), cleanInput('')의 결과를 [내 예측]에 적으세요.
// (2) step3 안에서 세 호출을 각각 print 안에 넣어 실행하고 비교하세요.
// (3) ?.를 .로 바꾸면(v.trim()) 어떤 빨간 줄이 생기나요? 잠깐 바꿔 보고 되돌려요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// [runner]
// []
// []

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
String cleanInput(String? v) {
  final value = v?.trim() ?? '';
  return '[$value]';
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 호출을 각각 print 안에 넣으세요.
}

// [내 말로 설명]
// !로 값이 있다고 단정했는데 실제 null이면 어떻게 될까요?
