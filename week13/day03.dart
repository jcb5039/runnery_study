// 13주차 3일 — 일정 간격의 가짜 위치 이벤트
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day03.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day03.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

Future<void> main() async {
  // [짧은 실행 예제]
  final example = Stream<int>.periodic(
    const Duration(milliseconds: 50),
    (index) => index + 1,
  ).take(2);
  await for (final value in example) {
    print(value);
  }

  // [한 줄씩 읽기]
  // 1. periodic은 일정 간격으로 index를 전달해요. index는 0부터 시작해요.
  // 2. index + 1이 실제 전달할 값이에요.
  // 3. take(2)는 두 값을 받은 뒤 끝내요.
  // [예제 예상 출력]
  // 1
  // 2

  // [직접 풀 문제]
  // main에서 50밀리초마다 (index + 1) * 100을 보내는 Stream<int>.periodic을 만드세요.
  // take(3)으로 끝내고 await for로 출력하세요. 값은 가짜 누적 거리(m)예요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 100
  // 200
  // 300
  //
  // [값을 바꾸어 다시 실행]
  // take(1)로 바꾸면 100만 출력돼요.
  //
  // [내 말로 설명]
  // take가 없으면 이 스트림은 스스로 끝나나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
