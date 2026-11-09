// 13주차 3일 해설 — 일정 간격으로 오는 값
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: periodic이 1~4를 보내고, map이 각각 '0:01'~'0:04'로 바꿔요. take(4)가 4개 뒤에 끝내요.
//            take가 없으면 periodic은 스스로 끝나지 않아서 직접 멈춰야 해요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final ticks = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (index) => index,
  ).take(3);
  await for (final tick in ticks) {
    print(tick);
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final meters = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (index) => (index + 1) * 100,
  ).take(3);
  await for (final value in meters) {
    print(value);
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Stream<String> clockTicks() {
  return Stream<int>.periodic(const Duration(milliseconds: 20), (i) => i + 1)
      .take(4)
      .map((s) => '0:${s.toString().padLeft(2, '0')}');
}

Future<void> step3() async {
  print('--- 3단계 ---');
  await for (final text in clockTicks()) {
    print(text);
  }
}
