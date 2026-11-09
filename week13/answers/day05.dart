// 13주차 5일 해설 — Timer
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 175밀리초 동안 50·100·150밀리초에 세 번 늘어요. 멈춘 뒤에는 더 늘지 않아요.
//            stopTicker를 빼먹으면 화면이 없어져도 타이머가 계속 돌아서 숫자가 계속 늘어요.

import 'dart:async';

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final done = Completer<void>();
  Timer(const Duration(milliseconds: 100), () {
    print('라면 완성');
    done.complete();
  });
  await done.future;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final done = Completer<void>();
  Timer.periodic(const Duration(milliseconds: 50), (timer) {
    print(timer.tick);
    if (timer.tick >= 3) {
      timer.cancel();
      done.complete();
    }
  });
  await done.future;
  print('타이머 종료');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Timer? ticker;
var redraws = 0;

void startTicker() {
  ticker = Timer.periodic(const Duration(milliseconds: 50), (_) {
    redraws++;
  });
}

void stopTicker() {
  ticker?.cancel();
  ticker = null;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  startTicker();
  await Future<void>.delayed(const Duration(milliseconds: 175));
  stopTicker();
  print(redraws);
  await Future<void>.delayed(const Duration(milliseconds: 100));
  print(redraws);
  print(ticker);
}
