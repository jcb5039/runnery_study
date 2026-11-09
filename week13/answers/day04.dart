// 13주차 4일 해설 — 구독 취소하기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 처음엔 subscription이 null이라 ?.cancel()은 아무 일도 하지 않아요.
//            120밀리초 동안 50·100밀리초에 틱이 두 번 오고, stop 뒤에는 구독이 끊겨 더 오지 않아요.

import 'dart:async';

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
    (index) => index + 1,
  );
  await for (final value in ticks) {
    print(value);
    if (value == 3) break;
  }
  print('멈춤');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final done = Completer<void>();
  late StreamSubscription<int> subscription;
  subscription =
      Stream<int>.periodic(
        const Duration(milliseconds: 50),
        (index) => index + 1,
      ).listen((value) async {
        print(value);
        if (value == 2) {
          await subscription.cancel();
          done.complete();
        }
      });
  await done.future;
  print('취소 완료');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
StreamSubscription<int>? subscription;

void start() {
  subscription = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (i) => i + 1,
  ).listen((v) => print('틱 $v'));
}

void stop() {
  subscription?.cancel();
  subscription = null;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  stop();
  print(subscription);
  start();
  await Future<void>.delayed(const Duration(milliseconds: 120));
  stop();
  print(subscription);
  await Future<void>.delayed(const Duration(milliseconds: 120));
  print('끝');
}
