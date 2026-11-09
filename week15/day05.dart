// 15주차 5일 — 삭제도 전달할 작업
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day05.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day05.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

void main() {
  // [짧은 실행 예제]
  final exampleServer = {'a': 2};
  exampleServer.remove('a');
  print(exampleServer);

  // [한 줄씩 읽기]
  // 1. remove는 해당 키를 지워요.
  // 2. 로컬에서만 지우면 서버에는 남을 수 있어요.
  // 3. 삭제할 ID를 보관해 서버에도 전달하는 방식으로 연습해요.
  // [예제 예상 출력]
  // {}

  // [직접 풀 문제]
  // main에서 local = {'run-1': 5}, server = {'run-1': 5}, deletedIds = <String>[]를 선언하세요.
  // local에서 run-1을 지우고 deletedIds에 넣으세요.
  // 그다음 deletedIds의 각 ID를 server에서도 지우고 성공 후 deletedIds.clear()를 하세요.
  // local, server, deletedIds를 차례로 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // {}
  // {}
  // []
  //
  // [값을 바꾸어 다시 실행]
  // 서버 삭제를 실행하기 직전에 멈춘다고 생각하고 세 변수의 값을 종이에 적어보세요.
  //
  // [내 말로 설명]
  // 삭제 정보를 잊은 채 서버 기록을 내려받으면 지운 기록이 다시 나타날 수 있나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
