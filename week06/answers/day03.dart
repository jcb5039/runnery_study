// 6주차 3일 해설 — 기다린 뒤 실행하기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: reload 안에서 '불러오기 시작'을 출력하고 load를 기다려요. 0.1초 뒤 개수를 출력하고 reload가 끝나요.
//            그다음에야 step3의 '끝'이 실행돼요. await를 빼면 reload가 기다리는 동안 '끝'이 먼저 나와요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  print('물 끓이기');
  await Future<void>.delayed(const Duration(milliseconds: 200));
  print('라면 넣기');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  print('불러오는 중');
  await Future<void>.delayed(const Duration(milliseconds: 100));
  print('완료');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
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
  print('화면 그리기');
  await reload();
  print('끝');
}
