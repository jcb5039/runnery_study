// 6주차 4일 — Future로 값 돌려받기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week06/README.md의 "3. Future, async, await — 3~4일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  final exampleKm = await exampleLoad();
  print(exampleKm);

  // [한 줄씩 읽기]
  // 1. exampleLoad()는 Future<double>을 돌려줘요.
  // 2. await가 완료를 기다려 double 값을 꺼내요.
  // 3. exampleKm은 준비된 숫자예요.
  // [예제 예상 출력]
  // 2.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

Future<double> exampleLoad() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 2.0;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] Future<String> loadName() async를 정의하세요. 100밀리초를 기다린 뒤 '민수'를 반환해요.
//        step1 안에서 await loadName()을 name에 담고 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 민수

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기서 await loadName()을 name에 담고 출력하세요.
}

// TODO ②: 여기에 Future<String> loadName() async를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Future<double> loadDistance() async를 정의하세요.
//        100밀리초를 기다린 뒤 3.0을 반환하세요. step2 안에서 await loadDistance()를 km에 담고 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 3.0
// [값을 바꾸어 다시 실행] 반환값을 5.0으로 바꾸면 5.0이에요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기서 await loadDistance()를 km에 담고 출력하세요.
}

// TODO ②: 여기에 Future<double> loadDistance() async를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 기록 목록을 돌려주는 load ━━━━━━━━━━
// Runnery 저장소(record/data/running_record_store.dart)의 load 첫 줄이에요.
//
//   Future<List<RunningRecord>> load() async {
//     ...
//     return List.unmodifiable(records);
//   }
//
// 읽는 법: "나중에 기록 목록(List<RunningRecord>)을 주겠다"는 약속을 돌려줘요.
//   await로 꺼내야 목록이 돼요. 바로 아래 [주어진 코드]는 기록 대신 거리 목록을 주는 함수예요.
// [문제]
// (1) step3 안에서 먼저 print(loadDistances());를 쓰세요(await 없이).
// (2) 그 아래에 final list = await loadDistances();로 받고 list.length와 list[0]을 출력하세요.
// (3) 실행 전에 세 줄의 결과를 [내 예측]에 적고 비교하세요.
// (4) 첫 줄은 왜 숫자 목록이 아니라 다른 글자가 나오나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// Instance of 'Future<List<double>>'
// 2
// 5.0

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Future<List<double>> loadDistances() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return [5.0, 3.2];
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)~(2)의 코드를 쓰세요.
}

// [내 말로 설명]
// Future<double>과 double은 어떻게 다른가요?
