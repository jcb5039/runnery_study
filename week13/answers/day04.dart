// 13주차 4일 해설 — StreamSubscription 취소
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: cancel과 화면의 dispose를 연결해야 하는 이유를 말해보세요.
// 예상 결과:
// 1
// 2
// 취소 완료

import 'dart:async';

Future<void> main() async {
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
