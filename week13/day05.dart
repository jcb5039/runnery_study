// 13주차 5일 — Timer 시작과 정리
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day05.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day05.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

import 'dart:async';

Future<void> main() async {
  // [짧은 실행 예제]
  final done = Completer<void>();
  Timer(const Duration(milliseconds: 50), () {
    print('한 번 실행');
    done.complete();
  });
  await done.future;

  // [한 줄씩 읽기]
  // 1. Timer는 시간이 지나면 콜백을 한 번 실행해요.
  // 2. Timer.periodic은 취소할 때까지 반복해요.
  // 3. Completer는 콜백의 완료를 기다릴 Future를 제공해요.
  // [예제 예상 출력]
  // 한 번 실행

  // [직접 풀 문제]
  // main에서 done = Completer<void>()를 선언하세요.
  // 50밀리초 간격 Timer.periodic을 만들고 콜백의 timer.tick을 출력하세요.
  // tick이 3이면 timer.cancel()과 done.complete()를 호출하세요.
  // main에서 done.future를 기다린 뒤 타이머 종료를 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 1
  // 2
  // 3
  // 타이머 종료
  //
  // [값을 바꾸어 다시 실행]
  // 정상적으로 콜백이 처리되는 환경의 예상이에요. 시스템 지연 시 tick이 건너뛸 수 있어요. 종료 기준을 2로 바꾸어 보세요.
  //
  // [내 말로 설명]
  // Timer의 tick을 정확한 GPS 이동 시간으로 단정하면 안 되는 이유는 무엇인가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
