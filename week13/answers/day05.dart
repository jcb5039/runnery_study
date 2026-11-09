// 13주차 5일 해설 — Timer 시작과 정리
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: Timer의 tick을 정확한 GPS 이동 시간으로 단정하면 안 되는 이유는 무엇인가요?
// 예상 결과:
// 1
// 2
// 3
// 타이머 종료

import 'dart:async';

Future<void> main() async {
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
