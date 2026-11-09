// 13주차 1일 해설 — Stream과 await for
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 12.0과 8.0만 더해져 20.0이에요. 1.5는 3.0보다 작아서 continue로 건너뛰어요.
//            빈 Stream은 값이 하나도 오지 않아 반복 안이 실행되지 않고 0.0을 돌려줘요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final signs = Stream<String>.fromIterable(['출발', '도착']);
  await for (final sign in signs) {
    print(sign);
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final distances = Stream<int>.fromIterable([2, 4, 6]);
  await for (final km in distances) {
    print(km);
  }
  print('완료');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Future<double> totalMeters(Stream<double> segments) async {
  var meters = 0.0;
  await for (final m in segments) {
    if (m < 3.0) continue;
    meters += m;
  }
  return meters;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  print(await totalMeters(Stream<double>.fromIterable([12.0, 1.5, 8.0])));
  print(await totalMeters(Stream<double>.fromIterable([])));
}
