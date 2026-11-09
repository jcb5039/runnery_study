// 6주차 7일 해설 — 복습: 기다림과 없는 값
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 처음엔 preset이 null이라 loadSaved를 기다려요. 그래서 저장소에서 읽음과 [4.0]이 나와요.
//            preset에 목록을 넣은 뒤에는 ?? 왼쪽에 값이 있어서 오른쪽 loadSaved는 실행되지 않아요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  print('세는 중');
  print(await countRuns());
}

Future<int> countRuns() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 4;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  String? memo = null;
  print('시작');
  final km = await loadDistance();
  print(km);
  print(memo ?? '메모 없음');
  print('끝');
}

Future<double> loadDistance() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 3.0;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
List<double>? preset;

Future<List<double>> loadSaved() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  print('저장소에서 읽음');
  return [4.0];
}

Future<void> step3() async {
  print('--- 3단계 ---');
  final first = preset ?? await loadSaved();
  print(first);
  preset = [1.0, 2.0];
  final second = preset ?? await loadSaved();
  print(second);
}
