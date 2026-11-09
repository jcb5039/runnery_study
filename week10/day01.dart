// 10주차 1일 — 날짜 객체
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day01.dart
// 정답은 answers/day01.dart에 있어요.
// 오늘의 강의: week10/README.md의 "1. DateTime과 Duration — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  final exampleDate = DateTime(2026, 11, 8);
  print(exampleDate.year);
  print(exampleDate.month);
  print(exampleDate.day);

  // [한 줄씩 읽기]
  // 1. DateTime에 연, 월, 일을 전달해 날짜 객체를 만들어요.
  // 2. year, month, day로 각 부분을 읽어요.
  // 3. 오늘 날짜 대신 고정 입력을 써서 출력 예측이 가능해요.
  // [예제 예상 출력]
  // 2026
  // 11
  // 8

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 d = DateTime(2025, 5, 1)을 선언하세요.
//        문자열 보간으로 '5/1'(월/일)을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 5/1

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 d 선언과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 date = DateTime(2026, 12, 3)을 선언하세요.
//        문자열 보간으로 '2026년 12월 3일'을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 2026년 12월 3일
// [값을 바꾸어 다시 실행] DateTime(2027, 1, 1)로 바꾸면 2027년 1월 1일이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 date 선언과 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록 날짜 글자 ━━━━━━━━━━
// RunningRecord의 dateLabel getter예요(record/models/running_record.dart). 4주차 1일에 본 요일 목록이 여기 있어요.
//
//   String get dateLabel =>
//       '${startedAt.month}월 ${startedAt.day}일 ${const ['월', '화', '수', '목', '금', '토', '일'][startedAt.weekday - 1]}요일';
//
// 읽는 법: startedAt은 달리기를 시작한 DateTime이에요. 월, 일, 요일을 이어 붙인 글자를 돌려줘요.
// 바로 아래 [주어진 코드]는 getter를 DateTime 하나를 받는 함수로 바꾸고, 요일 목록을 따로 뺀 거예요.
// [문제]
// (1) 실행 전에 아래 세 값을 [내 예측]에 적으세요.
//       DateTime(2026, 11, 9).weekday
//       dateLabel(DateTime(2026, 11, 9))
//       dateLabel(DateTime(2026, 11, 15))
// (2) step3 안에서 세 값을 차례로 출력하고 비교하세요.
// (3) weekday에서 1을 빼는 이유를 위치 번호로 설명하세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 1
// 11월 9일 월요일
// 11월 15일 일요일

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
final weekNames = ['월', '화', '수', '목', '금', '토', '일'];

String dateLabel(DateTime startedAt) =>
    '${startedAt.month}월 ${startedAt.day}일 ${weekNames[startedAt.weekday - 1]}요일';

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기서 세 값을 차례로 출력하세요.
}

// [내 말로 설명]
// DateTime 객체와 출력용 문자열은 무엇이 다른가요?
