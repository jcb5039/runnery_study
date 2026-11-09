// 13주차 1일 — 여러 번 도착하는 값 Stream
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day01.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day01.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

Future<void> main() async {
  // [짧은 실행 예제]
  final example = Stream<int>.fromIterable([1, 2]);
  await for (final value in example) {
    print(value);
  }

  // [한 줄씩 읽기]
  // 1. Stream은 여러 이벤트를 시간에 따라 전달해요.
  // 2. await for는 다음 값이 올 때까지 기다려요.
  // 3. 스트림이 끝나면 반복 다음 줄로 이동해요.
  // [예제 예상 출력]
  // 1
  // 2

  // [직접 풀 문제]
  // main에서 Stream<int>.fromIterable([2, 4, 6])을 distances에 담으세요.
  // await for로 각 거리를 출력하고 끝난 뒤 완료를 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 2
  // 4
  // 6
  // 완료
  //
  // [값을 바꾸어 다시 실행]
  // 입력이 빈 목록이면 완료만 출력돼요.
  //
  // [내 말로 설명]
  // Future 하나와 Stream 하나가 전달하는 값의 횟수는 어떻게 다른가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
