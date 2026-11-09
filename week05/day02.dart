// 5주차 2일 — 생성자와 this
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day02.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day02.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  print(example.km);

  // [한 줄씩 읽기]
  // 1. 생성자 ExampleRun(this.km)가 입력을 필드에 넣어요.
  // 2. 호출의 2.0이 이 객체의 km가 돼요.
  // 3. final 필드는 생성한 뒤 다시 대입하지 않아요.
  // [예제 예상 출력]
  // 2.0

  // [직접 풀 문제]
  // main 아래에 PracticeRun을 정의하세요. final double distanceKm, final int seconds를 필드로 두세요.
  // 생성자는 PracticeRun(this.distanceKm, this.seconds)로 쓰세요.
  // main에서 PracticeRun(2.0, 1200), PracticeRun(5.0, 1800)을 각각 first, second에 담고 각 거리를 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 2.0
  // 5.0
  //
  // [값을 바꾸어 다시 실행]
  // 두 번째 객체의 거리만 6.0으로 바꾸면 두 번째 출력만 바뀌어요.
  //
  // [내 말로 설명]
  // this.distanceKm의 this는 어느 객체를 뜻하나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

class ExampleRun {
  final double km;
  ExampleRun(this.km);
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
