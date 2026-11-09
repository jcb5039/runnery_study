// 6주차 4일 — Future 값을 기다려 받기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day04.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day04.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

Future<void> main() async {
  // [짧은 실행 예제]
  final exampleKm = await exampleLoad();
  print(exampleKm);

  // [한 줄씩 읽기]
  // 1. exampleLoad()는 Future<double>을 돌려줘요.
  // 2. await가 완료를 기다려 double 값을 꺼내요.
  // 3. exampleKm은 준비된 숫자예요.
  // [예제 예상 출력]
  // 2.0

  // [직접 풀 문제]
  // main 아래에 Future<double> loadDistance() async를 정의하세요.
  // 100밀리초를 기다린 뒤 3.0을 반환하세요. main에서 await loadDistance()를 km에 담고 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 3.0
  //
  // [값을 바꾸어 다시 실행]
  // 반환값을 5.0으로 바꾸면 5.0이에요.
  //
  // [내 말로 설명]
  // Future<double>과 double은 어떻게 다른가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

Future<double> exampleLoad() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 2.0;
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
