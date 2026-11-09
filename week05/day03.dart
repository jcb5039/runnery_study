// 5주차 3일 — 객체 안의 함수: 메서드
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day03.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day03.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  print(example.meters());

  // [한 줄씩 읽기]
  // 1. 객체를 만들며 km를 저장해요.
  // 2. example.meters()가 이 객체의 메서드를 호출해요.
  // 3. 메서드는 자기 객체의 km를 읽어요.
  // [예제 예상 출력]
  // 2000.0

  // [직접 풀 문제]
  // main 아래에 PracticeRun(double distanceKm)을 받는 클래스를 정의하세요.
  // 필드는 final double distanceKm이에요. String label() 메서드는 거리 뒤에 km를 붙여 반환하세요.
  // main에서 PracticeRun(3.0)을 record에 저장하고 record.label()을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 3.0km
  //
  // [값을 바꾸어 다시 실행]
  // 입력 0.0이면 0.0km예요.
  //
  // [내 말로 설명]
  // label()은 별도 입력 없이 어떤 값을 읽나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

class ExampleRun {
  final double km;
  ExampleRun(this.km);
  double meters() => km * 1000;
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
