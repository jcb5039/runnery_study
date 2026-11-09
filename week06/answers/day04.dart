// 6주차 4일 해설 — Future로 값 돌려받기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: await 없이 출력하면 약속 상자 자체라서 Instance of 'Future<List<double>>'가 나와요.
//            await로 꺼낸 list는 진짜 목록이라 length는 2, 0번 칸은 5.0이에요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final name = await loadName();
  print(name);
}

Future<String> loadName() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return '민수';
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final km = await loadDistance();
  print(km);
}

Future<double> loadDistance() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 3.0;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Future<List<double>> loadDistances() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return [5.0, 3.2];
}

Future<void> step3() async {
  print('--- 3단계 ---');
  print(loadDistances());
  final list = await loadDistances();
  print(list.length);
  print(list[0]);
}
