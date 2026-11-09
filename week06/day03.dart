// 6주차 3일 — 기다린 뒤 실행하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week06/README.md의 "3. Future, async, await — 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  print('시작');
  await Future<void>.delayed(const Duration(milliseconds: 100));
  print('끝');

  // [한 줄씩 읽기]
  // 1. async가 있는 main은 기다리는 작업을 쓸 수 있어요.
  // 2. delayed는 지정한 시간이 지난 뒤 완료돼요.
  // 3. await 다음 줄은 완료 후 실행돼요. 기다리는 동안 앱 전체가 멈춘다는 뜻은 아니에요.
  // 4. 아래 step 함수들도 기다리는 일이 있어서 await step1();처럼 끝날 때까지 기다려요.
  // [예제 예상 출력]
  // 시작
  // 끝

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 '물 끓이기'를 출력하고, 200밀리초를 await로 기다린 뒤 '라면 넣기'를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 물 끓이기
// 라면 넣기

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 출력, 기다리기, 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 '불러오는 중'을 출력하고 100밀리초를 await로 기다린 뒤 '완료'를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 불러오는 중
// 완료
// [값을 바꾸어 다시 실행] 100을 300으로 바꾸면 순서는 같고 기다리는 시간이 길어져요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 출력, 기다리기, 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 홈 화면 새로고침 순서 ━━━━━━━━━━
// Runnery 홈 화면(home/home_page.dart)의 _reload는 저장된 기록을 기다려서 받아요. 핵심만 남긴 원본이에요.
//
//   Future<void> _reload() async {
//     final loaded = await _store.load();
//     ... _records = loaded ...
//   }
//
// 읽는 법: _store.load()는 파일을 읽느라 시간이 걸려요. await로 끝날 때까지 기다린 뒤 loaded에 받아요.
// 바로 아래 [주어진 코드]는 파일 대신 0.1초 기다리는 load와, 받은 개수를 출력하는 reload예요.
// [문제]
// (1) step3 안에 아래 세 줄을 그대로 쓰세요.
//       print('화면 그리기');
//       await reload();
//       print('끝');
// (2) 실행 전에 출력 네 줄의 순서를 [내 예측]에 적은 뒤 실행해 비교하세요.
// (3) await reload(); 에서 await를 빼면 '끝'이 언제 나올지 예측해 보세요(확인 후 되돌려요).
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 화면 그리기
// 불러오기 시작
// 불러온 기록: 2개
// 끝

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Future<List<double>> load() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return [3.0, 5.0];
}

Future<void> reload() async {
  print('불러오기 시작');
  final loaded = await load();
  print('불러온 기록: ${loaded.length}개');
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)의 세 줄을 쓰세요.
}

// [내 말로 설명]
// await 다음 print는 언제 실행되나요?
