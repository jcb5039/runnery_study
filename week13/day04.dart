// 13주차 4일 — StreamSubscription 취소
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day04.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day04.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

import 'dart:async';

Future<void> main() async {
  // [짧은 실행 예제]
  final example = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (index) => index + 1,
  );
  await for (final value in example) {
    print(value);
    if (value == 2) break;
  }
  print('종료');

  // [한 줄씩 읽기]
  // 1. await for의 break는 반복을 끝내고 구독을 취소해요.
  // 2. listen을 쓸 때는 반환된 구독의 cancel()로 직접 취소할 수 있어요.
  // 3. 아래 문제의 Completer는 취소 완료를 main에 알려주는 도구예요.
  // [예제 예상 출력]
  // 1
  // 2
  // 종료

  // [직접 풀 문제]
  // main에서 done = Completer<void>()와 late StreamSubscription<int> subscription을 선언하세요.
  // late는 사용 전에 값이 반드시 들어갈 변수에 써요.
  // 50밀리초마다 1부터 보내는 periodic Stream을 listen하고 subscription에 담으세요.
  // 콜백은 async로 만들고 값을 출력하세요. 값이 2이면 await subscription.cancel() 후 done.complete()를 호출하세요.
  // main에서 await done.future 후 취소 완료를 출력하세요. 다른 이벤트가 추가로 나오면 안 돼요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 1
  // 2
  // 취소 완료
  //
  // [값을 바꾸어 다시 실행]
  // 취소 조건을 3으로 바꾸면 1, 2, 3, 취소 완료예요.
  //
  // [내 말로 설명]
  // cancel과 화면의 dispose를 연결해야 하는 이유를 말해보세요.

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
