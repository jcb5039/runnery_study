// 10주차 6일 — 밀리초가 있으면 우선 사용하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day06.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day06.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  print(exampleSeconds(2, 2500));
  print(exampleSeconds(2, null));

  // [한 줄씩 읽기]
  // 1. int? millis는 없을 수도 있는 정밀 시간이에요.
  // 2. 값이 있으면 1000으로 나누어 초로 바꿔요.
  // 3. 없으면 기존 초를 double로 바꿔 사용해요.
  // [예제 예상 출력]
  // 2.5
  // 2.0

  // [직접 풀 문제]
  // main 아래 double effectiveSeconds(int seconds, int? milliseconds)를 정의하세요.
  // milliseconds가 null이 아니면 / 1000, 없으면 seconds.toDouble()을 반환하세요.
  // main에서 effectiveSeconds(1, 1500), effectiveSeconds(1, null)을 출력하세요.
  // 이 규칙은 연습용이에요. 실제 모델을 읽을 때는 유효값 조건도 직접 확인하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 1.5
  // 1.0
  //
  // [값을 바꾸어 다시 실행]
  // effectiveSeconds(2, 0)은 이 실습 규칙상 0.0이에요.
  //
  // [내 말로 설명]
  // null과 0을 같은 것으로 취급하지 않는 이유를 설명하세요.

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

double exampleSeconds(int seconds, int? millis) {
  if (millis != null) return millis / 1000;
  return seconds.toDouble();
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
