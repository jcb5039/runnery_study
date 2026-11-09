// 10주차 5일 — 삼항 연산자와 두 자리 표시
// 실행 위치: ~/src/runnery-study
// 실행: dart run week10/day05.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day05.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final exampleSeconds = 65;
  final rest = (exampleSeconds % 60).toString().padLeft(2, '0');
  final label = exampleSeconds > 0 ? '측정됨' : '미측정';
  print('$label 1:$rest');

  // [한 줄씩 읽기]
  // 1. toString()으로 숫자를 문자열로 바꿔요.
  // 2. padLeft(2, '0')가 왼쪽을 채워 두 자리로 만들어요.
  // 3. 조건 ? 참일 때 값 : 거짓일 때 값은 하나의 값을 골라요.
  // [예제 예상 출력]
  // 측정됨 1:05

  // [직접 풀 문제]
  // main 아래 String paceText(int seconds)를 정의하세요.
  // seconds <= 0이면 '--:--', 그 외에는 몫과 나머지를 이용해 분:두자리초를 반환하세요.
  // main에서 paceText(365), paceText(0)을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 6:05
  // --:--
  //
  // [값을 바꾸어 다시 실행]
  // paceText(359)는 5:59예요.
  //
  // [내 말로 설명]
  // 0을 0:00 대신 --:--로 표시하면 사용자에게 어떤 의미를 전달하나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
