// 6주차 6일 해설 — 기다린 작업의 실패
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 실패하면 await load(ok) 줄에서 바로 catch로 가요. 그래서 records = loaded;는 실행되지 않고
//            처음 성공 때 넣은 [3.0, 5.0]이 그대로 남아요. error만 문구로 바뀌어요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// 1단계에서 쓰는 예제 함수예요.
Future<double> exampleLoad(bool succeed) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (!succeed) throw StateError('실패');
  return 2.0;
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  try {
    print(await exampleLoad(true));
  } catch (error) {
    print('불러오기 실패');
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final succeed = true;
  try {
    print(await loadDistance(succeed));
  } catch (error) {
    print('불러오기 실패');
  } finally {
    print('처리 끝');
  }
}

Future<double> loadDistance(bool succeed) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (!succeed) throw StateError('불러오기 실패');
  return 3.0;
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
List<double> records = [];
String? error;

Future<List<double>> load(bool ok) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (!ok) throw StateError('저장소 읽기 실패');
  return [3.0, 5.0];
}

Future<void> reload(bool ok) async {
  try {
    final loaded = await load(ok);
    records = loaded;
    error = null;
  } catch (e) {
    error = '불러오기 실패';
  }
}

Future<void> step3() async {
  print('--- 3단계 ---');
  await reload(true);
  print(records);
  print(error);
  await reload(false);
  print(records);
  print(error);
}
