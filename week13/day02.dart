// 13주차 2일 — listen으로 구독하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day02.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day02.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

Future<void> main() async {
  // [짧은 실행 예제]
  final subscription = Stream<int>.fromIterable([1, 2]).listen((value) {
    print(value);
  });
  await subscription.asFuture<void>();

  // [한 줄씩 읽기]
  // 1. listen에 전달한 함수는 이벤트가 도착할 때 호출돼요.
  // 2. listen은 구독 객체를 즉시 반환해요.
  // 3. asFuture는 이 예제에서 스트림 종료까지 기다리기 위해 사용해요.
  // [예제 예상 출력]
  // 1
  // 2

  // [직접 풀 문제]
  // main에서 Stream<int>.fromIterable([3, 5])에 listen을 연결하세요.
  // 콜백은 값을 출력하게 하고 반환된 subscription의 asFuture<void>()를 await하세요.
  // 그 뒤 완료를 출력하세요. 이번 문제에는 수동 cancel을 넣지 않아요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 3
  // 5
  // 완료
  //
  // [값을 바꾸어 다시 실행]
  // [7]이면 7, 완료예요.
  //
  // [내 말로 설명]
  // listen 호출 시점과 콜백이 실행되는 시점은 같은가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
