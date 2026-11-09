// 5주차 5일 — static 메서드
// 실행 위치: ~/src/runnery-study
// 실행: dart run week05/day05.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day05.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  print(ExampleCalc.doubleValue(3));

  // [한 줄씩 읽기]
  // 1. static 메서드는 클래스 이름으로 호출해요.
  // 2. ExampleCalc 객체를 만들지 않아요.
  // 3. 전달받은 n으로 계산해요.
  // [예제 예상 출력]
  // 6

  // [직접 풀 문제]
  // main 아래에 RunCalc 클래스를 정의하고 static double metersToKm(int meters)를 만드세요.
  // main에서 RunCalc.metersToKm(1500)을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 1.5
  //
  // [값을 바꾸어 다시 실행]
  // 3200을 전달하면 3.2예요.
  //
  // [내 말로 설명]
  // RunCalc.metersToKm과 record.label 호출의 앞부분은 무엇이 다른가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

class ExampleCalc {
  static int doubleValue(int n) => n * 2;
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
