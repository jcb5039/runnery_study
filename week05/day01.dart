// 5주차 1일 — 클래스와 객체
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day01.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day01.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun();
  print(example.km);

  // [한 줄씩 읽기]
  // 1. main 아래 class가 객체의 모양을 정해요.
  // 2. ExampleRun()이 객체를 만들어요.
  // 3. .km가 객체 안의 필드를 읽어요.
  // [예제 예상 출력]
  // 2.0

  // [직접 풀 문제]
  // main 아래에 PracticeRun 클래스를 정의하고 double distanceKm = 3.0 필드를 넣으세요.
  // main에서 final record = PracticeRun();으로 객체를 만들고 거리를 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 3.0
  //
  // [값을 바꾸어 다시 실행]
  // 필드 초기값을 5.0으로 바꾸면 5.0이에요.
  //
  // [내 말로 설명]
  // 클래스를 정의한 줄과 객체를 만든 줄을 구분해 보세요.

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

class ExampleRun {
  double km = 2.0;
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
