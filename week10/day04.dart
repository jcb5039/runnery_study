// 10주차 4일 — 페이스와 round
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day04.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day04.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final examplePace = 1000 / 3;
  print(examplePace.round());

  // [한 줄씩 읽기]
  // 1. 시간(초)을 거리(km)로 나누면 1km당 초예요.
  // 2. round()는 가장 가까운 정수로 반올림해요.
  // [예제 예상 출력]
  // 333

  // [직접 풀 문제]
  // main 아래 int paceSeconds(double km, int seconds)를 정의하세요.
  // 거리나 시간이 0 이하이면 0을 반환하고, 그 외에는 (seconds / km).round()를 반환하세요.
  // main에서 paceSeconds(5.0, 1800), paceSeconds(0.0, 1800)을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 360
  // 0
  //
  // [값을 바꾸어 다시 실행]
  // paceSeconds(3.0, 1000)은 333이에요.
  //
  // [내 말로 설명]
  // 속도와 페이스 중 숫자가 작아질수록 더 빠른 것은 어느 쪽인가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
